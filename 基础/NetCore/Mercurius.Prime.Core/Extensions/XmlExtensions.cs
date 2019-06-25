using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml.Serialization;

namespace Mercurius.Prime.Core
{
    /// <summary>
    /// xml扩展
    /// </summary>
    public static class XmlExtensions
    {
        /// <summary>
        /// 将xml数据转换为实体对象
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="xml">xml字符串</param>
        /// <returns>实体对象</returns>
        public static T FromXml<T>(this string xml)
        {
            if (xml.IsNullOrEmpty())
            {
                return default;
            }

            using (var reader = new StringReader(xml))
            {
                var serializer = new XmlSerializer(typeof(T));

                return (T)serializer.Deserialize(reader);
            }
        }

        /// <summary>
        /// 将实体对象序列化为xml文档
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="data">实体对象</param>
        /// <returns>xml文档</returns>
        public static string ToXml<T>(this T data) where T : class, new()
        {
            if (data == null)
            {
                return null;
            }

            using (var stream = new MemoryStream())
            {
                var rs = new T();
                var serializer = new XmlSerializer(typeof(T));

                serializer.Serialize(stream, rs);
                stream.Seek(0, SeekOrigin.Begin);

                using (var reader = new StreamReader(stream))
                {
                    return reader.ReadToEnd();
                }
            }
        }
    }
}
