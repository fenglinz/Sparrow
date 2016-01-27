﻿using System;
using System.Configuration;
using System.Text;

namespace Mercurius.Sparrow.Entities
{
    /// <summary>
    /// 查询对象信息。
    /// </summary>
    [Serializable]
    public class SearchObject
    {
        #region 属性

        /// <summary>
        /// 获取或者设置每页显示数据大小。
        /// </summary>
        public int PageSize { get; set; }

        /// <summary>
        /// 获取或者设置当前页的序号。
        /// </summary>
        public int PageIndex { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public SearchObject()
        {
            this.PageIndex = 1;
            this.PageSize = DefalutPageSize;
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

        #region 公开方法

        /// <summary>
        /// 获取默认的分页大小。
        /// </summary>
        /// <returns>默认分页大小</returns>
        public static int DefalutPageSize
        {
            get
            {
                int pageSize;
                var defaultPageSize = ConfigurationManager.AppSettings["DefaultPageSize"];

                return int.TryParse(defaultPageSize, out pageSize) ? pageSize : 10;
            }
        }

        #endregion
    }
}
