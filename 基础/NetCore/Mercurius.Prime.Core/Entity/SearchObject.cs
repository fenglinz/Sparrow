using System.Text;
using Mercurius.Prime.Core.Configuration;

namespace Mercurius.Prime.Core.Entity
{
    /// <summary>
    /// 查询对象信息。
    /// </summary>
    public class SearchObject
    {
        #region 属性

        /// <summary>
        /// 每页显示数据大小。
        /// </summary>
        public int PageSize { get; set; }

        /// <summary>
        /// 当前页的序号。
        /// </summary>
        public int PageIndex { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 获取偏移的行数。
        /// </summary>
        public int OffsetRows => (this.PageIndex - 1) * this.PageSize;

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public SearchObject()
        {
            this.PageIndex = 1;
            this.PageSize = PlatformConfig.Instance.PageSize;
        }

        #endregion

        #region 重写

        /// <summary>
        /// 重写ToString方法：自定义格式显示数据。
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            var type = this.GetType();
            var props = type.GetProperties();
            var buffers = new StringBuilder();

            foreach (var item in props)
            {
                buffers.AppendFormat("{0}:{1}\r\n", item.Name, item.GetValue(this, null));
            }

            return buffers.ToString();
        }

        #endregion
    }
}
