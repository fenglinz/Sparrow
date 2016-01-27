using System.IO;
using System.Linq;
using System.Xml.Linq;

namespace Mercurius.CodeBuilder.CSharp
{
    public static class ProjectFileConfigurationManager
    {
        #region 公开方法

        public static void AddItemGroupItem(string projectFile, string fileName, ItemGroupItemType itemType)
        {
            if (!File.Exists(projectFile))
            {
                return;
            }

            var file = new FileInfo(projectFile);
            file.Attributes = FileAttributes.Normal;

            var xdocument = XDocument.Load(projectFile);
            var relativePath = fileName.Replace(file.DirectoryName, string.Empty).TrimStart('\\');

            XNamespace xmlns = "http://schemas.microsoft.com/developer/msbuild/2003";

            var itemTypeName = itemType.ToString();
            var exist = (from c in xdocument.Descendants(xmlns + itemTypeName)
                         where
                             c.Attribute("Include").Value == relativePath
                         select c).Any();

            if (exist)
            {
                return;
            }

            var item = new XElement(xmlns + itemTypeName);

            item.SetAttributeValue("Include", relativePath);
            xdocument.Descendants(xmlns + "ItemGroup").Last().Add(item);

            xdocument.Save(projectFile, SaveOptions.None);
        }

        #endregion
    }
}
