using System.IO;
using System.Xml.Linq;
using System.Xml.Xsl;
using System.Xml;
using System.Text;

namespace Mercurius.CodeBuilder.Core
{
    /// <summary>
    /// <para>
    /// Xsl转换帮助类。
    /// </para>
    /// 
    /// <para>
    /// 作者：Fenglinz
    /// 日期：2011-11-07
    /// </para>
    /// </summary>
    public static class XslHelper
    {
        #region 公开方法

        /// <summary>
        /// 将数据库表详细信息转换为指定的文件。
        /// </summary>
        /// <param name="xdocument">xml数据</param>
        /// <param name="xslFile">Xslt文件</param>
        /// <param name="outFile">输出文件</param>
        public static void Transform(XDocument xdocument, string xslFile, string outFile)
        {
            if (xdocument != null)
            {
                var xslTransform = new XslCompiledTransform(true);

                var fileInfo = new FileInfo(outFile);
                if (!Directory.Exists(fileInfo.Directory.FullName))
                {
                    Directory.CreateDirectory(fileInfo.Directory.FullName);
                }

                // new UTF8Encoding(false)控制生成的文本为UTF-8无bom格式，解决Java环境下编译出错的问题。
                using (var stream = new StreamWriter(outFile, false, new UTF8Encoding(false)))
                {
                    xslTransform.Load(xslFile);
                    xslTransform.Transform(new XmlTextReader(new StringReader(xdocument.ToString())), null, stream);
                }
            }
        }

        #endregion
    }
}
