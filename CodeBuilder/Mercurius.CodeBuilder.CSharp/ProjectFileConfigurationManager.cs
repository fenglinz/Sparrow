using System.IO;
using System.Linq;
using System.Xml.Linq;
using Mercurius.CodeBuilder.Core.Config;

namespace Mercurius.CodeBuilder.CSharp
{
    public static class ProjectFileConfigurationManager
    {
        #region 公开方法

        public static void AddReferences(string projectFile, Item item)
        {
            if (!File.Exists(projectFile))
            {
                return;
            }

            var xdocument = XDocument.Load(projectFile);
            XNamespace xmlns = "http://schemas.microsoft.com/developer/msbuild/2003";

            if (item.Parameters?.ContainsKey("References") == true)
            {
                var items = item.Parameters["References"].Split(',');

                var references = from c in xdocument.Descendants(xmlns + "Reference")
                                 where items.Contains(c.Attribute("Include").Value)
                                 select c.Attribute("Include").Value;

                foreach (var a in items)
                {
                    if (references.Contains(a))
                    {
                        continue;
                    }

                    var refItem = new XElement(xmlns + "Reference");

                    refItem.SetAttributeValue("Include", a);

                    xdocument.Descendants(xmlns + "ItemGroup").First().Add(refItem);
                }

                xdocument.Save(projectFile, SaveOptions.None);
            }

        }

        public static void AddItemGroupItem(string projectFile, string fileName, ItemGroupItemType itemType)
        {
            if (!File.Exists(projectFile))
            {
                return;
            }

            var file = new FileInfo(fileName);
            file.Attributes = FileAttributes.Normal;

            var xdocument = XDocument.Load(projectFile);
            var relativePath = fileName.Replace(Path.GetDirectoryName(projectFile), string.Empty).TrimStart('\\');

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
