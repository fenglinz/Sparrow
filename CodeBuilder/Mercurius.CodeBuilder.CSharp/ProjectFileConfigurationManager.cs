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
            XNamespace xmlns = xdocument.Root.Attribute("xmlns")?.Value;

            if (item.Parameters?.ContainsKey("References") == true)
            {
                var items = item.Parameters["References"].Split(',');

                var references = from c in xdocument.Descendants(xmlns == null ? "Reference" : xmlns + "Reference")
                                 where items.Contains(c.Attribute("Include").Value)
                                 select c.Attribute("Include").Value;

                foreach (var a in items)
                {
                    if (references.Contains(a))
                    {
                        continue;
                    }

                    var refItem = new XElement(xmlns == null ? "Reference" : xmlns + "Reference");

                    refItem.SetAttributeValue("Include", a);

                    xdocument.Descendants(xmlns == null ? "ItemGroup" : xmlns + "ItemGroup").First().Add(refItem);
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

            var file = new FileInfo(fileName)
            {
                Attributes = FileAttributes.Normal
            };

            var xdocument = XDocument.Load(projectFile);
            var relativePath = fileName.Replace(Path.GetDirectoryName(projectFile), string.Empty).TrimStart('\\');

            XNamespace xmlns = xdocument.Root.Attribute("xmlns")?.Value;

            // net core情况
            if (xmlns == null)
            {
                if (itemType == ItemGroupItemType.EmbeddedResource)
                {
                    XName xname2 = itemType.ToString();

                    var exist2 = (from c in xdocument.Descendants(xname2)
                                 where
                                     c.Attribute("Include").Value == relativePath
                                 select c).Any();

                    if (exist2)
                    {
                        return;
                    }

                    var item2 = new XElement(xname2);

                    item2.SetAttributeValue("Include", relativePath);

                    xdocument.Descendants("ItemGroup").Last().Add(item2);

                    xdocument.Save(projectFile, SaveOptions.None);
                }

                return;
            }

            var itemTypeName = itemType.ToString();
            var xname = xmlns + itemTypeName;

            var exist = (from c in xdocument.Descendants(xname)
                         where
                             c.Attribute("Include").Value == relativePath
                         select c).Any();

            if (exist)
            {
                return;
            }

            var item = new XElement(xname);

            item.SetAttributeValue("Include", relativePath);

            xdocument.Descendants(xmlns + "ItemGroup").Last().Add(item);

            xdocument.Save(projectFile, SaveOptions.None);
        }

        #endregion
    }
}
