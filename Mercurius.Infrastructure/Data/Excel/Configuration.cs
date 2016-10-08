using System;
using System.Collections.Generic;
using System.Linq;

namespace Mercurius.Infrastructure.Data.Excel
{
    /// <summary>
    /// Excel导入导出配置。
    /// </summary>
    [Serializable]
    public class Configuration
    {
        #region 属性

        /// <summary>
        /// 数据库表名称。
        /// </summary>
        public string TableName { get; set; }

        /// <summary>
        /// sheet名称。
        /// </summary>
        public string SheetName { get; set; }

        /// <summary>
        /// 导入导出项集合。
        /// </summary>
        public IList<OptionItem> Options { get; set; }

        #endregion

        #region 索引

        /// <summary>
        /// 获取导入导出配置项。
        /// </summary>
        /// <param name="index">索引</param>
        /// <returns>导入导出配置项</returns>
        public OptionItem this[int index]
        {
            get { return this.Options[index]; }
        }

        /// <summary>
        /// 获取导入导出配置项。
        /// </summary>
        /// <param name="headerText">标题名</param>
        /// <returns>导入导出配置项</returns>
        public OptionItem this[string headerText]
        {
            get { return this.Options.Where(o => o.HeaderText == headerText).FirstOrDefault(); }
        }

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public Configuration()
        {
            this.Options = new List<OptionItem>();
        }

        #endregion
    }
}
