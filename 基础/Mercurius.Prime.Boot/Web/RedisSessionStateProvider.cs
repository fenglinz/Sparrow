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
	// Token: 0x02000007 RID: 7
	public class RedisSessionStateProvider : SessionStateStoreProviderBase, IDisposable
	{
		// Token: 0x1700000C RID: 12
		// (get) Token: 0x06000026 RID: 38 RVA: 0x000024A0 File Offset: 0x000006A0
		private RedisClient RedisSessionClient
		{
			get
			{
				return this._redisClient = (this._redisClient ?? new RedisClient(PlatformSection.Instance.RedisSession.RedisName));
			}
		}

		// Token: 0x06000028 RID: 40 RVA: 0x000024E4 File Offset: 0x000006E4
		private string RedisKey(string id)
		{
			return string.Format("{0}{1}", this._applicationName.IsNullOrEmptyValue(""), id);
		}

		// Token: 0x06000029 RID: 41 RVA: 0x00002511 File Offset: 0x00000711
		public override void Dispose()
		{
		}

		// Token: 0x0600002A RID: 42 RVA: 0x00002514 File Offset: 0x00000714
		public override void Initialize(string name, NameValueCollection config)
		{
			bool flag = PlatformSection.Instance.RedisSession == null;
			if (flag)
			{
				throw new Exception("无RedisSession配置信息！");
			}
			this._redisSessionElement = PlatformSection.Instance.RedisSession;
			this._applicationName = PlatformSection.Instance.RedisSession.Name;
			base.Initialize(name, config);
		}

		// Token: 0x0600002B RID: 43 RVA: 0x00002570 File Offset: 0x00000770
		public override bool SetItemExpireCallback(SessionStateItemExpireCallback expireCallback)
		{
			return true;
		}

		// Token: 0x0600002C RID: 44 RVA: 0x00002584 File Offset: 0x00000784
		public override void SetAndReleaseItemExclusive(HttpContext context, string id, SessionStateStoreData item, object lockId, bool newItem)
		{
			RedisClient client = this.RedisSessionClient;
			string sessionItems = this.Serialize((SessionStateItemCollection)item.Items);
			try
			{
				if (newItem)
				{
					SessionItem sessionItem = new SessionItem();
					sessionItem.CreatedAt = DateTime.UtcNow;
					sessionItem.LockDate = DateTime.UtcNow;
					sessionItem.LockID = 0;
					sessionItem.Timeout = item.Timeout;
					sessionItem.Locked = false;
					sessionItem.SessionItems = sessionItems;
					sessionItem.Flags = 0;
					client.Set<SessionItem>(this.RedisKey(id), sessionItem, new TimeSpan?(TimeSpan.FromMinutes((double)item.Timeout)));
				}
				else
				{
					SessionItem currentSessionItem = client.Get<SessionItem>(this.RedisKey(id));
					bool flag;
					if (currentSessionItem != null)
					{
						int lockID = currentSessionItem.LockID;
						int? num = (int?)lockId;
						flag = (lockID == num.GetValueOrDefault() & num != null);
					}
					else
					{
						flag = false;
					}
					bool flag2 = flag;
					if (flag2)
					{
						currentSessionItem.Locked = false;
						currentSessionItem.SessionItems = sessionItems;
						client.Set<SessionItem>(this.RedisKey(id), currentSessionItem, new TimeSpan?(TimeSpan.FromMinutes((double)item.Timeout)));
					}
				}
			}
			catch (Exception e)
			{
				throw e;
			}
		}

		// Token: 0x0600002D RID: 45 RVA: 0x000026B0 File Offset: 0x000008B0
		public override SessionStateStoreData GetItemExclusive(HttpContext context, string id, out bool locked, out TimeSpan lockAge, out object lockId, out SessionStateActions actions)
		{
			return this.GetSessionStoreItem(true, context, id, out locked, out lockAge, out lockId, out actions);
		}

		// Token: 0x0600002E RID: 46 RVA: 0x000026D4 File Offset: 0x000008D4
		public override SessionStateStoreData GetItem(HttpContext context, string id, out bool locked, out TimeSpan lockAge, out object lockId, out SessionStateActions actionFlags)
		{
			return this.GetSessionStoreItem(false, context, id, out locked, out lockAge, out lockId, out actionFlags);
		}

		// Token: 0x0600002F RID: 47 RVA: 0x000026F8 File Offset: 0x000008F8
		private SessionStateStoreData GetSessionStoreItem(bool lockRecord, HttpContext context, string id, out bool locked, out TimeSpan lockAge, out object lockId, out SessionStateActions actionFlags)
		{
			SessionStateStoreData item = null;
			lockAge = TimeSpan.Zero;
			lockId = null;
			locked = false;
			actionFlags = SessionStateActions.None;
			string serializedItems = "";
			int timeout = 0;
			RedisClient client = this.RedisSessionClient;
			try
			{
				if (lockRecord)
				{
					locked = false;
					SessionItem currentItem = client.Get<SessionItem>(this.RedisKey(id));
					bool flag = currentItem != null;
					if (flag)
					{
						bool flag2 = !currentItem.Locked;
						if (flag2)
						{
							currentItem.Locked = true;
							currentItem.LockDate = DateTime.UtcNow;
							client.Set<SessionItem>(this.RedisKey(id), currentItem, new TimeSpan?(TimeSpan.FromMinutes((double)this._redisSessionElement.SessionTimeOut)));
						}
						else
						{
							locked = true;
						}
					}
				}
				SessionItem currentSessionItem = client.Get<SessionItem>(this.RedisKey(id));
				bool flag3 = currentSessionItem != null;
				if (flag3)
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
				bool flag4 = currentSessionItem != null && !locked;
				if (flag4)
				{
					client.Remove(this.RedisKey(id));
					lockId = (int?)lockId + 1;
					currentSessionItem.LockID = ((lockId != null) ? ((int)lockId) : 0);
					currentSessionItem.Flags = 0;
					client.Set<SessionItem>(this.RedisKey(id), currentSessionItem, new TimeSpan?(TimeSpan.FromMinutes((double)this._redisSessionElement.SessionTimeOut)));
					bool flag5 = actionFlags == SessionStateActions.InitializeItem;
					if (flag5)
					{
						item = this.CreateNewStoreData(context, 30);
					}
					else
					{
						item = this.Deserialize(context, serializedItems, timeout);
					}
				}
			}
			catch (Exception e)
			{
				throw e;
			}
			return item;
		}

		// Token: 0x06000030 RID: 48 RVA: 0x0000290C File Offset: 0x00000B0C
		public override void ReleaseItemExclusive(HttpContext context, string id, object lockId)
		{
			RedisClient client = this.RedisSessionClient;
			SessionItem currentSessionItem = client.Get<SessionItem>(this.RedisKey(id));
			bool flag;
			if (currentSessionItem != null)
			{
				int? num = (int?)lockId;
				int lockID = currentSessionItem.LockID;
				flag = (num.GetValueOrDefault() == lockID & num != null);
			}
			else
			{
				flag = false;
			}
			bool flag2 = flag;
			if (flag2)
			{
				currentSessionItem.Locked = false;
				client.Set<SessionItem>(this.RedisKey(id), currentSessionItem, new TimeSpan?(TimeSpan.FromMinutes((double)this._redisSessionElement.SessionTimeOut)));
			}
		}

		// Token: 0x06000031 RID: 49 RVA: 0x0000298A File Offset: 0x00000B8A
		public override void RemoveItem(HttpContext context, string id, object lockId, SessionStateStoreData item)
		{
			this.RedisSessionClient.Remove(this.RedisKey(id));
		}

		// Token: 0x06000032 RID: 50 RVA: 0x000029A0 File Offset: 0x00000BA0
		public override void CreateUninitializedItem(HttpContext context, string id, int timeout)
		{
			SessionItem sessionItem = new SessionItem
			{
				CreatedAt = DateTime.Now.ToUniversalTime(),
				LockDate = DateTime.Now.ToUniversalTime(),
				LockID = 0,
				Timeout = timeout,
				Locked = false,
				SessionItems = string.Empty,
				Flags = 0
			};
			this.RedisSessionClient.Set<SessionItem>(this.RedisKey(id), sessionItem, new TimeSpan?(TimeSpan.FromMinutes((double)timeout)));
		}

		// Token: 0x06000033 RID: 51 RVA: 0x00002A28 File Offset: 0x00000C28
		public override SessionStateStoreData CreateNewStoreData(HttpContext context, int timeout)
		{
			return new SessionStateStoreData(new SessionStateItemCollection(), SessionStateUtility.GetSessionStaticObjects(context), timeout);
		}

		// Token: 0x06000034 RID: 52 RVA: 0x00002A4C File Offset: 0x00000C4C
		public override void ResetItemTimeout(HttpContext context, string id)
		{
			RedisClient client = this.RedisSessionClient;
			try
			{
				client.ExpireEntryAt(id, TimeSpan.FromMinutes((double)this._redisSessionElement.SessionTimeOut));
			}
			catch (Exception e)
			{
				throw e;
			}
		}

		// Token: 0x06000035 RID: 53 RVA: 0x00002A94 File Offset: 0x00000C94
		public override void InitializeRequest(HttpContext context)
		{
		}

		// Token: 0x06000036 RID: 54 RVA: 0x00002A97 File Offset: 0x00000C97
		public override void EndRequest(HttpContext context)
		{
			this.Dispose();
		}

		// Token: 0x06000037 RID: 55 RVA: 0x00002AA4 File Offset: 0x00000CA4
		private string Serialize(SessionStateItemCollection items)
		{
			string result;
			using (MemoryStream ms = new MemoryStream())
			{
				using (BinaryWriter writer = new BinaryWriter(ms))
				{
					bool flag = items != null;
					if (flag)
					{
						items.Serialize(writer);
					}
					writer.Close();
					result = Convert.ToBase64String(ms.ToArray());
				}
			}
			return result;
		}

		// Token: 0x06000038 RID: 56 RVA: 0x00002B18 File Offset: 0x00000D18
		private SessionStateStoreData Deserialize(HttpContext context, string serializedItems, int timeout)
		{
			SessionStateStoreData result;
			using (MemoryStream ms = new MemoryStream(Convert.FromBase64String(serializedItems)))
			{
				SessionStateItemCollection sessionItems = new SessionStateItemCollection();
				bool flag = ms.Length > 0L;
				if (flag)
				{
					using (BinaryReader reader = new BinaryReader(ms))
					{
						sessionItems = SessionStateItemCollection.Deserialize(reader);
					}
				}
				result = new SessionStateStoreData(sessionItems, SessionStateUtility.GetSessionStaticObjects(context), timeout);
			}
			return result;
		}

		// Token: 0x0400000C RID: 12
		private string _applicationName;

		// Token: 0x0400000D RID: 13
		private RedisSessionElement _redisSessionElement;

		// Token: 0x0400000E RID: 14
		private RedisClient _redisClient;
	}
}
