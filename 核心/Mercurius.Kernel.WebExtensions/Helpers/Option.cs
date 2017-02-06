using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mercurius.Kernel.WebExtensions.Helpers
{
    /// <summary>
    /// 选项信息。
    /// </summary>
    public class Option
    {
        #region 属性

        /// <summary>
        /// 文本。
        /// </summary>
        public string Text { get; set; }

        /// <summary>
        /// 值。
        /// </summary>
        public string Value { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="data">数据</param>
        public Option(string data)
        {
            this.Text = data;
            this.Value = data;
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="text">文本</param>
        /// <param name="value">值</param>
        public Option(string text, string value)
        {
            this.Text = text;
            this.Value = value;
        }

        #endregion
    }

}