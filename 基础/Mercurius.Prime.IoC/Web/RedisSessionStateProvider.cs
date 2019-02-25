using System;
using System.Collections.Specialized;
using System.IO;
using System.Web;
using System.Web.SessionState;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Configuration;
using Mercurius.Prime.Core.Configuration.Redis;

namespace Mercurius.Prime.Boot.Web
{
    #region Session Item Model

    [Serializable]
    public class SessionItem
    {
        #region Properties

        public DateTime CreatedAt { get; set; }

        public DateTime LockDate { get; set; }

        public int LockID { get; set; }

        public int Timeout { get; set; }

        public bool Locked { get; set; }

        public string SessionItems { get; set; }

        public int Flags { get; set; }

        #endregion
    }

    #endregion

    public class RedisSessionStateProvider : SessionStateStoreProviderBase, IDisposable
    {
        #region 字段

        private string _applicationName;
        private RedisSessionElement _redisSessionElement;

        private RedisClient _redisClient;

        #endregion

        #region Properties

        private RedisClient RedisSessionClient
        {
            get
            {
                return this._redisClient = this._redisClient ?? new RedisClient(PlatformSection.Instance.RedisSession.RedisName);
            }
        }

        #endregion Properties

        #region 构造方法

        /// <summary>
        /// 默认构造方法.
        /// </summary>
        public RedisSessionStateProvider()
        {

        }

        #endregion

        #region Private Methods

        /// <summary>
        /// Prepends the application name to the redis key if one exists. Querying by application name is recommended for session
        /// </summary>
        /// <param name="id">The session id</param>
        /// <returns>Concatenated string applicationname:sessionkey</returns>
        private string RedisKey(string id)
        {
            return string.Format("{0}{1}", this._applicationName.IsNullOrEmptyValue(""), id);
        }

        #endregion

        #region Overrides

        public override void Dispose()
        {
        }

        public override void Initialize(string name, NameValueCollection config)
        {
            if (PlatformSection.Instance.RedisSession == null)
            {
                throw new Exception("无RedisSession配置信息！");
            }

            this._redisSessionElement = PlatformSection.Instance.RedisSession;
            this._applicationName = PlatformSection.Instance.RedisSession.Name;

            // Initialize the abstract base class.
            base.Initialize(name, config);
        }

        public override bool SetItemExpireCallback(SessionStateItemExpireCallback expireCallback)
        {
            return true;
        }

        public override void SetAndReleaseItemExclusive(HttpContext context, string id, SessionStateStoreData item, object lockId, bool newItem)
        {
            var client = this.RedisSessionClient;

            // Serialize the SessionStateItemCollection as a string.
            string sessionItems = Serialize((SessionStateItemCollection)item.Items);

            try
            {
                if (newItem)
                {
                    var sessionItem = new SessionItem();
                    sessionItem.CreatedAt = DateTime.UtcNow;
                    sessionItem.LockDate = DateTime.UtcNow;
                    sessionItem.LockID = 0;
                    sessionItem.Timeout = item.Timeout;
                    sessionItem.Locked = false;
                    sessionItem.SessionItems = sessionItems;
                    sessionItem.Flags = 0;

                    client.Set(this.RedisKey(id), sessionItem, TimeSpan.FromMinutes(item.Timeout));
                }
                else
                {
                    var currentSessionItem = client.Get<SessionItem>(this.RedisKey(id));
                    if (currentSessionItem != null && currentSessionItem.LockID == (int?)lockId)
                    {
                        currentSessionItem.Locked = false;
                        currentSessionItem.SessionItems = sessionItems;
                        client.Set(this.RedisKey(id), currentSessionItem, TimeSpan.FromMinutes(item.Timeout));
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public override SessionStateStoreData GetItemExclusive(HttpContext context, string id, out bool locked, out TimeSpan lockAge, out object lockId, out SessionStateActions actions)
        {
            return GetSessionStoreItem(true, context, id, out locked, out lockAge, out lockId, out actions);
        }

        public override SessionStateStoreData GetItem(HttpContext context, string id, out bool locked, out TimeSpan lockAge, out object lockId, out SessionStateActions actionFlags)
        {
            return GetSessionStoreItem(false, context, id, out locked, out lockAge, out lockId, out actionFlags);
        }

        private SessionStateStoreData GetSessionStoreItem(bool lockRecord,
          HttpContext context,
          string id,
          out bool locked,
          out TimeSpan lockAge,
          out object lockId,
          out SessionStateActions actionFlags)
        {
            // Initial values for return value and out parameters.
            SessionStateStoreData item = null;
            lockAge = TimeSpan.Zero;
            lockId = null;
            locked = false;
            actionFlags = 0;

            // String to hold serialized SessionStateItemCollection.
            string serializedItems = "";

            // Timeout value from the data store.
            int timeout = 0;

            var client = this.RedisSessionClient;
            try
            {
                if (lockRecord)
                {
                    locked = false;
                    var currentItem = client.Get<SessionItem>(this.RedisKey(id));

                    if (currentItem != null)
                    {
                        // If the item is locked then do not attempt to update it
                        if (!currentItem.Locked)
                        {
                            currentItem.Locked = true;
                            currentItem.LockDate = DateTime.UtcNow;
                            client.Set<SessionItem>(this.RedisKey(id), currentItem, TimeSpan.FromMinutes(this._redisSessionElement.SessionTimeOut));
                        }
                        else
                        {
                            locked = true;
                        }
                    }
                }

                var currentSessionItem = client.Get<SessionItem>(this.RedisKey(id));

                if (currentSessionItem != null)
                {
                    serializedItems = currentSessionItem.SessionItems;
                    lockId = currentSessionItem.LockID;
                    lockAge = DateTime.UtcNow.Subtract(currentSessionItem.LockDate);
                    actionFlags = (SessionStateActions)currentSessionItem.Flags;
                    timeout = currentSessionItem.Timeout;
                }
                else
                {
                    locked = false;
                }

                if (currentSessionItem != null && !locked)
                {
                    // Delete the old item before inserting the new one
                    client.Remove(this.RedisKey(id));

                    lockId = (int?)lockId + 1;
                    currentSessionItem.LockID = lockId != null ? (int)lockId : 0;
                    currentSessionItem.Flags = 0;

                    client.Set<SessionItem>(this.RedisKey(id), currentSessionItem, TimeSpan.FromMinutes(this._redisSessionElement.SessionTimeOut));

                    // If the actionFlags parameter is not InitializeItem,
                    // deserialize the stored SessionStateItemCollection.
                    if (actionFlags == SessionStateActions.InitializeItem)
                    {
                        item = CreateNewStoreData(context, 30);
                    }
                    else
                    {
                        item = Deserialize(context, serializedItems, timeout);
                    }
                }
            }

            catch (Exception e)
            {
                throw e;
            }

            return item;
        }

        public override void ReleaseItemExclusive(HttpContext context, string id, object lockId)
        {

            var client = this.RedisSessionClient;
            var currentSessionItem = client.Get<SessionItem>(this.RedisKey(id));

            if (currentSessionItem != null && (int?)lockId == currentSessionItem.LockID)
            {
                currentSessionItem.Locked = false;
                client.Set(this.RedisKey(id), currentSessionItem, TimeSpan.FromMinutes(this._redisSessionElement.SessionTimeOut));
            }
        }
        public override void RemoveItem(HttpContext context, string id, object lockId, SessionStateStoreData item)
        {
            // Delete the old item before inserting the new one
            this.RedisSessionClient.Remove(this.RedisKey(id));
        }

        public override void CreateUninitializedItem(HttpContext context, string id, int timeout)
        {
            var sessionItem = new SessionItem
            {
                CreatedAt = DateTime.Now.ToUniversalTime(),
                LockDate = DateTime.Now.ToUniversalTime(),
                LockID = 0,
                Timeout = timeout,
                Locked = false,
                SessionItems = string.Empty,
                Flags = 0
            };

            this.RedisSessionClient.Set(this.RedisKey(id), sessionItem, TimeSpan.FromMinutes(timeout));
        }

        public override SessionStateStoreData CreateNewStoreData(System.Web.HttpContext context, int timeout)
        {
            return new SessionStateStoreData(new SessionStateItemCollection(), SessionStateUtility.GetSessionStaticObjects(context), timeout);
        }

        public override void ResetItemTimeout(HttpContext context, string id)
        {
            var client = this.RedisSessionClient;

            try
            {
                // TODO :: GET THIS VALUE FROM THE CONFIG
                client.ExpireEntryAt(id, TimeSpan.FromMinutes(this._redisSessionElement.SessionTimeOut));
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public override void InitializeRequest(HttpContext context)
        {
            // Was going to open the redis connection here but sometimes I had 5 connections open at one time which was strange
        }

        public override void EndRequest(HttpContext context)
        {
            this.Dispose();
        }

        #endregion Overrides

        #region Serialization

        /// <summary>
        /// Serialize is called by the SetAndReleaseItemExclusive method to
        /// convert the SessionStateItemCollection into a Base64 string to
        /// be stored in MongoDB.
        /// </summary>
        private string Serialize(SessionStateItemCollection items)
        {
            using (var ms = new MemoryStream())
            using (var writer = new BinaryWriter(ms))
            {
                if (items != null)
                    items.Serialize(writer);

                writer.Close();

                return Convert.ToBase64String(ms.ToArray());
            }
        }

        private SessionStateStoreData Deserialize(HttpContext context, string serializedItems, int timeout)
        {
            using (var ms = new MemoryStream(Convert.FromBase64String(serializedItems)))
            {
                var sessionItems = new SessionStateItemCollection();

                if (ms.Length > 0)
                {
                    using (BinaryReader reader = new BinaryReader(ms))
                    {
                        sessionItems = SessionStateItemCollection.Deserialize(reader);
                    }
                }

                return new SessionStateStoreData(sessionItems, SessionStateUtility.GetSessionStaticObjects(context), timeout);
            }
        }

        #endregion
    }
}