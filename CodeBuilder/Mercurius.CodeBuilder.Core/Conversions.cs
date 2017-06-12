using System.Xml.Linq;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Ado;
using Microsoft.Practices.ServiceLocation;

namespace Mercurius.CodeBuilder.Core
{
    public static class Conversions
    {
        public static XDocument ToXml(this DbTable table, Configuration config)
        {
            var xdocument = new XDocument(new XElement("root"));
            var database = config.CurrentDatabase;

            xdocument.Root.Add(new XElement("author", config.Author));
            xdocument.Root.Add(new XElement("buildDate", config.BuildDate.ToString("yyyy-MM-dd")));
            xdocument.Root.Add(new XElement("copyright", config.CopyrightOwner));

            xdocument.Root.Add(new XElement("rootNamespace", config.BaseNamespace));
            xdocument.Root.Add(new XElement("entityNamespace", config.EntityBaseNamespace));
            xdocument.Root.Add(new XElement("contactNamespace", config.ContractBaseNamespace));
            xdocument.Root.Add(new XElement("serviceNamespace", config.ServiceBaseNamespace));

            if (table != null && database != null)
            {
                var tableElement = new XElement("table");
                var dbTypeMapping = ServiceLocator.Current.GetInstance<DbTypeMapping>(database.Type.ToString());

                var arrays = table.Name.Split('.');

                tableElement.SetAttributeValue("table", table.Name.Contains(".") ? $"{arrays[0]}.{arrays[1]}" : $"{table.Name}");

                if (database.Type == DatabaseType.MSSQL)
                {
                    tableElement.SetAttributeValue("name", table.Name.Contains(".") ? $"[{arrays[0]}].[{arrays[1]}]" : $"[{table.Name}]");
                }
                else
                {
                    tableElement.SetAttributeValue("name", table.Name.Contains(".") ? $"{arrays[0]}.{arrays[1]}" : $"{table.Name}");
                }

                tableElement.SetAttributeValue("namespace", table.Namespace);
                tableElement.SetAttributeValue("isView", table.IsView);
                tableElement.SetAttributeValue("moduleName", table.ModuleName ?? string.Empty);
                tableElement.SetAttributeValue("moduleDescription", table.ModuleDescription ?? string.Empty);
                tableElement.SetAttributeValue("className", table.ClassName);
                tableElement.SetAttributeValue("camelClassName", table.ClassName.CamelNaming());
                tableElement.SetAttributeValue("pluralClassName", table.ClassName.PluralClassName());
                tableElement.SetAttributeValue("description", table.Description);
                tableElement.SetAttributeValue("hasCreate", table.HasCreate);
                tableElement.SetAttributeValue("hasUpdate", table.HasUpdate);
                tableElement.SetAttributeValue("hasCreateOrUpdate", table.HasCreateOrUpdate);
                tableElement.SetAttributeValue("hasRemove", table.HasRemove);
                tableElement.SetAttributeValue("hasSingleData", table.HasSingleData);
                tableElement.SetAttributeValue("hasSearchData", table.HasSearchData);

                foreach (var column in table.Columns)
                {
                    var columnElement = new XElement("column");

                    columnElement.SetAttributeValue("name", column.Name);
                    columnElement.SetAttributeValue("sqlType", column.SqlType);
                    columnElement.SetAttributeValue("length", column.Length);
                    columnElement.SetAttributeValue("nullable", column.Nullable);

                    var type = dbTypeMapping.GetBasicType("C#", column.SqlType);

                    columnElement.SetAttributeValue("basicType", (type == "string" && column.Length == 36) ? "Guid" : type);
                    columnElement.SetAttributeValue("isPrimaryKey", column.IsPrimaryKey);
                    columnElement.SetAttributeValue("isIdentity", column.IsIdentity);
                    columnElement.SetAttributeValue("description", column.Description.IsNullOrEmptyValue(column.PropertyName));
                    columnElement.SetAttributeValue("propertyName", column.PropertyName);
                    columnElement.SetAttributeValue("fieldName", column.FieldName);
                    columnElement.SetAttributeValue("isKeyWordSearch", column.IsKeyWordSearch);
                    columnElement.SetAttributeValue("isSearchCriteria", column.IsSearchCriteria);

                    tableElement.Add(columnElement);
                }

                xdocument.Root.Add(tableElement);
            }

            return xdocument;
        }
    }
}
