using System;
using System.Linq;
using System.Xml.Linq;
using CommonServiceLocator;
using Mercurius.CodeBuilder.Core.Config;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.Prime.Core;
using DatabaseType = Mercurius.Prime.Data.Database;

namespace Mercurius.CodeBuilder.Core
{
    public static class Conversions
    {
        public static XDocument ToXml(this DbTable table, Configuration config, Item item)
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
            xdocument.Root.Add(new XElement("webApiPrefix", config.WebApiPrefix));

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
                tableElement.SetAttributeValue("moduleName", table.ModuleName.Inline());
                tableElement.SetAttributeValue("moduleDescription", table.ModuleDescription.Inline());
                tableElement.SetAttributeValue("className", table.ClassName);
                tableElement.SetAttributeValue("realClassName", table.GetClassName());
                tableElement.SetAttributeValue("camelClassName", table.ClassName.CamelNaming());
                tableElement.SetAttributeValue("pluralClassName", table.ClassName.PluralClassName());
                tableElement.SetAttributeValue("description", table.Description.Inline());
                tableElement.SetAttributeValue("isEditOnly", table.IsEntityOnly);
                tableElement.SetAttributeValue("hasCreate", table.HasCreate && !table.IsEntityOnly);
                tableElement.SetAttributeValue("hasUpdate", table.HasUpdate && !table.IsEntityOnly);
                tableElement.SetAttributeValue("hasCreateOrUpdate", table.HasCreateOrUpdate && !table.IsEntityOnly);
                tableElement.SetAttributeValue("hasRemove", table.HasRemove && !table.IsEntityOnly);
                tableElement.SetAttributeValue("hasSingleData", table.HasSingleData && !table.IsEntityOnly);
                tableElement.SetAttributeValue("hasGetAll", table.HasGetAll && !table.IsEntityOnly);
                tableElement.SetAttributeValue("hasSearchData", table.HasSearchData && !table.IsEntityOnly);
                tableElement.SetAttributeValue("hasCreateWebApi", table.HasCreateWebApi);

                foreach (var column in table.Columns)
                {
                    var columnElement = new XElement("column");

                    columnElement.SetAttributeValue("name", column.Name);
                    columnElement.SetAttributeValue("sqlType", column.SqlType);
                    columnElement.SetAttributeValue("length", column.Length);
                    columnElement.SetAttributeValue("nullable", column.Nullable);

                    var type = dbTypeMapping.GetBasicType(config.Language, column.SqlType);

                    columnElement.SetAttributeValue("validLength", column.Length.HasValue && string.Compare(column.BasicType, "string", true) == 0);
                    columnElement.SetAttributeValue("basicType", (type.LanguageType == "string" && column.Length == 36) ? "Guid" : type.LanguageType);
                    columnElement.SetAttributeValue("jdbcType", type.JdbcType);
                    columnElement.SetAttributeValue("parameterType", type.ParameterType);
                    if (!column.BasicType.Equals("string", StringComparison.OrdinalIgnoreCase) ||
                        column.PropertyName.EndsWith("guid", StringComparison.OrdinalIgnoreCase) ||
                        column.PropertyName.EndsWith("id", StringComparison.OrdinalIgnoreCase))
                    {
                        columnElement.SetAttributeValue("mustEqual", true);
                    }
                    else
                    {
                        columnElement.SetAttributeValue("mustEqual", false);
                    }

                    var description = column.Description.IsNullOrEmptyValue(column.PropertyName).Replace('（', '(').Replace('）', ')').Inline();

                    columnElement.SetAttributeValue("isPrimaryKey", column.IsPrimaryKey);
                    columnElement.SetAttributeValue("isIdentity", column.IsIdentity);
                    columnElement.SetAttributeValue("isNewGuid", column.IsNewGuid);

                    var temp = description.IndexOf('(');

                    columnElement.SetAttributeValue("shortDesc", description.Substring(0, temp == -1 ? description.Length : temp));
                    columnElement.SetAttributeValue("description", description);
                    columnElement.SetAttributeValue("propertyName", column.PropertyName);
                    columnElement.SetAttributeValue("fieldName", column.FieldName);
                    columnElement.SetAttributeValue("isKeyWordSearch", column.IsKeyWordSearch);
                    columnElement.SetAttributeValue("isSearchCriteria", column.IsSearchCriteria);
                    columnElement.SetAttributeValue("isAddColumn", column.IsAddColumn);
                    columnElement.SetAttributeValue("isUpdateColumn", column.IsUpdateColumn);

                    // 属性忽略处理
                    if (!item.IgnoreProperties.IsEmpty())
                    {
                        columnElement.SetAttributeValue("igdto", item.IsIgnoreProperty(column.FieldName));
                    }

                    // 关联字段处理
                    if (item.AssociationProperties.IsEmpty())
                    {
                        columnElement.SetAttributeValue("isAssociate", false);
                    }
                    else
                    {
                        var rs = item.GetAssociationProperty(column.FieldName);

                        if (rs.Item1)
                        {
                            var needAdded = rs.Item1;

                            if (table.Columns.Any(c => string.Compare(c.FieldName, rs.Item3, true) == 0))
                            {
                                needAdded = false;
                            }
                            else
                            {
                                columnElement.SetAttributeValue("isAssociate", rs.Item1);
                                columnElement.SetAttributeValue("associateDesc", column.Description?.ToLower().Replace(rs.Item2.ToLower(), "名称"));
                                columnElement.SetAttributeValue("associateField", rs.Item3);
                                columnElement.SetAttributeValue("associatePropName", rs.Item3.PascalNaming());
                            }
                        }
                    }

                    tableElement.Add(columnElement);
                }

                xdocument.Root.Add(tableElement);
            }

            return xdocument;
        }
    }
}
