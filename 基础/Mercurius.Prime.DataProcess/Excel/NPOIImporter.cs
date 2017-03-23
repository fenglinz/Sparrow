using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Mercurius.Prime.Core.Data;
using Mercurius.Prime.Core.Data.Excel;
using Microsoft.VisualBasic;
using NPOI.SS.UserModel;

namespace Mercurius.Prime.DataProcess.Excel
{
    /// <summary>
    /// 实现IImport接口(使用NPOI操作Excel)。
    /// </summary>
    public class NPOIImporter : IImporter
    {
        #region 字段

        /// <summary>
        /// 布尔值等效字符串。
        /// </summary>
        private static readonly Dictionary<string, bool> BooleanDictionary = new Dictionary<string, bool>
        {
            { "是", true },
            { "否", false },
            { "true", true },
            { "false", false },
            { "yes", true },
            { "no", false },
            { "1", true },
            { "0", false}
        };

        #endregion

        #region IImport接口实现

        /// <summary>
        /// 导入数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="input">输入流</param>
        /// <returns>导入的数据对象集合</returns>
        public IList<T> Import<T>(Stream input) where T : class, new()
        {
            var configuration = Util.ResolveConfiguration<T>();

            return this.Import<T>(input, configuration);
        }

        /// <summary>
        /// 导入数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="input">输入流</param>
        /// <param name="configuration">Excel导入导出配置信息</param>
        /// <returns>导入的数据对象集合</returns>
        public IList<T> Import<T>(Stream input, Configuration configuration) where T : class, new()
        {
            var result = new List<T>();
            var workbook = WorkbookFactory.Create(input);
            var sheets = this.GetValidSheets(workbook, configuration.Options);

            foreach (var sheet in sheets)
            {
                for (var rowIndex = 1; rowIndex <= sheet.LastRowNum; rowIndex++)
                {
                    var row = sheet.GetRow(rowIndex);

                    if (row == null)
                    {
                        continue;
                    }

                    var data = new T();

                    foreach (var item in configuration.Options)
                    {
                        var cell = row.Cells[item.CellIndex];
                        var value = GetCellValue(cell, item);

                        item.Property.SetValue(data, Conversion.CTypeDynamic(value, item.Property.PropertyType), null);
                    }

                    result.Add(data);
                }
            }

            return result;
        }

        /// <summary>
        /// 导入为XML格式的数据集合。
        /// </summary>
        /// <param name="input">输入流</param>
        /// <param name="options">导入导出配置项</param>
        /// <returns>XML格式的数据集合</returns>
        public IList<string> ImportAsXml(Stream input, IList<OptionItem> options)
        {
            var result = new List<string>();
            var workbook = WorkbookFactory.Create(input);
            var sheets = this.GetValidSheets(workbook, options);

            foreach (var sheet in sheets)
            {
                for (var rowIndex = 1; rowIndex <= sheet.LastRowNum; rowIndex++)
                {
                    var row = sheet.GetRow(rowIndex);

                    if (row == null)
                    {
                        continue;
                    }

                    var data = new StringBuilder("<ROOT>");

                    foreach (var item in options)
                    {
                        var cell = row.Cells[item.CellIndex];

                        var value = GetCellValue(cell, item);

                        data.AppendFormat("<{0}>{1}</{0}>", item.ColumnName, value);
                    }

                    data.Append("</ROOT>");
                    result.Add(data.ToString());
                }
            }

            return result;
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取单元格数据值。
        /// </summary>
        /// <param name="cell">单元格对象</param>
        /// <param name="optionItem">导入导出配置</param>
        /// <returns>单元格的值</returns>
        private static object GetCellValue(ICell cell, OptionItem optionItem)
        {
            object value = null;

            switch (optionItem.DataType)
            {
                case DataType.Boolean:
                    var result = false;
                    var temp = cell.StringCellValue;

                    if (!string.IsNullOrWhiteSpace(temp))
                    {
                        temp = temp.Trim().ToLower();
                        result = BooleanDictionary.ContainsKey(temp) && BooleanDictionary[temp];
                    }

                    value = result;

                    break;

                case DataType.DateTime:
                    if (cell.CellType == CellType.String)
                    {
                        value = cell.StringCellValue;
                    }
                    else
                    {
                        if (cell.NumericCellValue != 0)
                        {
                            value = DateTime.FromOADate(cell.NumericCellValue);
                        }
                    }

                    break;
                default:
                    switch (cell.CellType)
                    {
                        case CellType.Boolean:
                            value = cell.BooleanCellValue;

                            break;
                        case CellType.Error:
                            value = cell.ErrorCellValue;

                            break;
                        case CellType.Formula:
                            value = cell.CellFormula;

                            break;
                        case CellType.Numeric:
                            value = cell.NumericCellValue;

                            break;
                        case CellType.String:
                            value = cell.StringCellValue;

                            break;
                        case CellType.Unknown:
                            value = cell.RichStringCellValue;

                            break;
                    }

                    break;
            }

            return value;
        }

        /// <summary>
        /// 获取通过验证的Sheet集合。
        /// </summary>
        /// <param name="workbook">Excel文档对象</param>
        /// <param name="options">导入导出配置项</param>
        /// <returns>通过验证的Sheet集合</returns>
        private IList<ISheet> GetValidSheets(IWorkbook workbook, IList<OptionItem> options)
        {
            var result = new List<ISheet>();
            var sheetCount = workbook.NumberOfSheets;

            for (int index = 0; index < sheetCount; index++)
            {
                var isValid = true;
                var sheet = workbook.GetSheetAt(index);
                var headerRow = sheet.GetRow(0);

                if (headerRow == null || headerRow.Cells.Count < options.Count)
                {
                    continue;
                }

                foreach (var item in options)
                {
                    for (var cellIndex = headerRow.FirstCellNum; cellIndex < headerRow.LastCellNum; cellIndex++)
                    {
                        var cellString = headerRow.Cells[cellIndex].StringCellValue;

                        if (cellString == item.HeaderText)
                        {
                            item.CellIndex = cellIndex;

                            break;
                        }
                    }
                }

                if (isValid)
                {
                    result.Add(sheet);
                }
            }

            return result;
        }

        #endregion
    }
}
