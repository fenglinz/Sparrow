using Mercurius.Prime.Core.Ado;
using Prism.Mvvm;

namespace Mercurius.CodeBuilder.Core.Database
{
    /// <summary>
    /// 连接的数据库信息。
    /// </summary>
    public class ConnectedDatabase : BindableBase
    {
        #region 字段

        private bool _isOpend;

        #endregion

        #region 属性

        /// <summary>
        /// 数据库类型。
        /// </summary>
        public DatabaseType Type { get; set; }

        /// <summary>
        /// 数据库连接地址。
        /// </summary>
        public string ServerUri { get; set; }

        /// <summary>
        /// 帐户。
        /// </summary>
        public string Account { get; set; }

        /// <summary>
        /// 密码。
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// 端口号。
        /// </summary>
        public int? Port { get; set; }

        /// <summary>
        /// 数据库名称。
        /// </summary>
        public string Name { get; set; }

        #endregion

        #region 业务属性

        public bool IsOpened
        {
            get { return this._isOpend; }
            set
            {
                if (this._isOpend != value)
                {
                    this._isOpend = value;
                    this.RaisePropertyChanged(nameof(IsOpened));
                }
            }
        }

        #endregion
    }
}
