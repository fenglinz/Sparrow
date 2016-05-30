using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using Mercurius.Infrastructure;
using Mercurius.CodeBuilder.Core.Database;
using Microsoft.Practices.ServiceLocation;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.CodeBuilder.Core
{
    public static class Conversions
    {
        public static XDocument ToXml(this DbTable table, ConnectedDatabase database, string rootNamespace, string author, DateTime buildDate, string copyrightOwner)
        {
            var xdocument = new XDocument(new XElement("root"));

            xdocument.Root.Add(new XElement("author", author));
            xdocument.Root.Add(new XElement("rootNamespace", rootNamespace));
            xdocument.Root.Add(new XElement("buildDate", buildDate.ToString("yyyy-MM-dd")));
            xdocument.Root.Add(new XElement("copyright", copyrightOwner));

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
                    columnElement.SetAttributeValue("basicType", dbTypeMapping.GetBasicType("C#", column.SqlType));
                    columnElement.SetAttributeValue("isPrimaryKey", column.IsPrimaryKey);
                    columnElement.SetAttributeValue("isIdentity", column.IsIdentity);
                    columnElement.SetAttributeValue("description", column.Description);
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
