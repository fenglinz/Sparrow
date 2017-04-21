using IBatisNet.DataMapper;
using IBatisNet.DataMapper.SessionStore;

namespace Mercurius.Prime.Data.IBatisNet
{
    /// <summary>
    /// SqlMapper管理器。
    /// </summary>
    public sealed class SqlMapperManager
    {
        #region 字段

        private readonly ISqlMapper _reader;
        private readonly ISqlMapper _writer;

        // 是否读写分离
        private readonly bool _isReadWriteSeparation;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="sqlMapper">SqlMapper对象</param>
        public SqlMapperManager(ISqlMapper sqlMapper)
        {
            this._isReadWriteSeparation = false;
            this._reader = this._writer = sqlMapper;

            this._reader.SessionStore = new HybridWebThreadSessionStore(this._reader.Id);
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="writer">向数据库写入数据的SqlMapper</param>
        /// <param name="reader">从数据库读取数据的SqlMapper</param>
        public SqlMapperManager(ISqlMapper writer, ISqlMapper reader)
        {
            this._writer = writer;
            this._reader = reader;

            this._isReadWriteSeparation = true;
            this._reader.SessionStore = new HybridWebThreadSessionStore(this._reader.Id);
            this._writer.SessionStore = new HybridWebThreadSessionStore(this._writer.Id);
        }

        #endregion

        /// <summary>
        /// 获取SqlMapper。
        /// </summary>
        /// <param name="rw">读-写库选择</param>
        /// <returns>SqlMapper对象</returns>
        public ISqlMapper this[RW rw]
        {
            get
            {
                var result = this._isReadWriteSeparation ?
                    (rw == RW.Read ? this._reader : this._writer) : this._writer;

                return result;
            }
        }
    }
}
