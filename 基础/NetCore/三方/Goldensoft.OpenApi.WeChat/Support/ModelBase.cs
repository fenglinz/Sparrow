using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Linq;
using Mercurius.Prime.Core;

namespace Goldensoft.OpenApi.WeChat
{
    /// <summary>
    /// 微信接口调用数据模型基类
    /// </summary>
    public abstract class ModelBase
    {
        #region Fields

        protected readonly SortedDictionary<string, string> RequestDatas = new SortedDictionary<string, string>();

        #endregion

        #region Index

        /// <summary>
        /// 索引：获取或者设置属性值
        /// </summary>
        /// <param name="key">键</param>
        /// <returns>值</returns>
        public string this[string key]
        {
            get
            {
                if (this.RequestDatas.ContainsKey(key))
                {
                    return this.RequestDatas[key];
                }

                return null;
            }
            protected set => this.RequestDatas[key] = value;
        }

        #endregion

        #region Public Methods

        /// <summary>
        /// 将实体数据转换为xml格式数据
        /// </summary>
        /// <returns>xml数据</returns>
        public string ToXml()
        {
            var builder = new StringBuilder("<xml>");

            foreach (var item in this.RequestDatas)
            {
                if (item.Value.IsNotBlank())
                {
                    builder.AppendFormat("<{0}><![CDATA[{1}]]></{0}>", item.Key, item.Value);
                }
            }

            builder.Append("</xml>");

            return builder.ToString();
        }

        /// <summary>
        /// 从xml解析数据到实体
        /// </summary>
        /// <param name="xml">xml数据</param>
        public void ResolverFromXml(string xml)
        {
            if (xml.IsNotBlank())
            {
                var xdoc = new XmlDocument();
                xdoc.LoadXml(xml);

                foreach (XmlNode item in xdoc.FirstChild.ChildNodes)
                {
                    this[item.Name] = item.InnerText;
                }
            }
        }

        #endregion
    }
}
