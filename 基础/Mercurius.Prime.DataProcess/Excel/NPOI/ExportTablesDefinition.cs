﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Mercurius.Prime.Core;
using Mercurius.Prime.Data.Ado;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.SS.Util;

namespace Mercurius.Prime.DataProcess.Excel
{
    /// <summary>
    /// 导出表的定义。
    /// </summary>
    public class ExportTablesDefinition
    {
        /// <summary>
        /// 导出表定义。
        /// </summary>
        /// <param name="tables">表信息</param>
        /// <param name="stream">IO流</param>
        public void Export(IList<Data.Ado.Table> tables, Stream stream)
        {
            if (tables == null)
            {
                throw new ArgumentNullException(nameof(tables));
            }

            if (tables.IsEmpty())
            {
                throw new ArgumentException("导出的表不能为空！", nameof(tables));
            }

            if (stream == null)
            {
                throw new ArgumentNullException(nameof(stream));
            }

            var workbook = new HSSFWorkbook();

            // 标题单元格样式。
            var tableCellStyle = workbook.NewCellStyle(fontCallback: font => font.FontHeightInPoints = 18, borderStyle: BorderStyle.None);
            var titleCellStyle = workbook.NewCellStyle(
                style =>
                {
                    style.FillPattern = FillPattern.SolidForeground;
                    style.FillForegroundColor = IndexedColors.DarkBlue.Index;
                }, font =>
                {
                    font.IsBold = true;
                    font.FontHeightInPoints = 14;
                    font.Color = IndexedColors.White.Index;
                });

            var leftCellStyle = workbook.NewCellStyle(
                style =>
                {
                    style.Indention = 1;
                    style.Alignment = HorizontalAlignment.Left;
                });
            var centerCellStyle = workbook.NewCellStyle();

            var pkLeftCellStyle = workbook.NewCellStyle(
                style =>
                {
                    style.Indention = 1;
                    style.Alignment = HorizontalAlignment.Left;
                    style.FillPattern = FillPattern.SolidForeground;
                    style.FillForegroundColor = IndexedColors.Yellow.Index;
                });

            var pkCenterCellStyle = workbook.NewCellStyle(
                style =>
                {
                    style.Indention = 1;
                    style.Alignment = HorizontalAlignment.Center;
                    style.FillPattern = FillPattern.SolidForeground;
                    style.FillForegroundColor = IndexedColors.Yellow.Index;
                });

            var hyperlinkCellStyle = workbook.NewCellStyle(
                style =>
                {
                    style.Indention = 1;
                    style.Alignment = HorizontalAlignment.Left;
                }
                , font =>
                {
                    font.Color = IndexedColors.DarkBlue.Index;
                    font.Underline = FontUnderlineType.Single;
                });

            // 目录Sheet。
            var bookmarkIndex = 1;
            var bookmarkSheet = workbook.CreateSheet("目录");
            var titleRow = bookmarkSheet.CreateRow(0);

            titleRow.HeightInPoints = 32;
            titleRow.CreateCell(0, titleCellStyle).SetCellValue("序号");
            titleRow.CreateCell(1, titleCellStyle).SetCellValue("表名称");
            titleRow.CreateCell(2, titleCellStyle).SetCellValue("描述");
            titleRow.CreateCell(3, titleCellStyle).SetCellValue("备注");

            bookmarkSheet.SetColumnWidth(0, 10 * 256);
            bookmarkSheet.SetColumnWidth(1, 75 * 256);
            bookmarkSheet.SetColumnWidth(2, 45 * 256);
            bookmarkSheet.SetColumnWidth(3, 45 * 256);

            // 首行冻结。
            bookmarkSheet.CreateFreezePane(0, 1);

            var schemas = tables.GroupBy(t => t.Schema);

            foreach (var schema in schemas)
            {
                var sheetName = string.IsNullOrWhiteSpace(schema.Key) ? "公共" : schema.Key;
                var sheet = workbook.CreateSheet(sheetName);

                // 添加标题。
                titleRow = sheet.CreateRow(0);

                titleRow.Height = 26 * 20;
                titleRow.CreateCell(0, titleCellStyle).SetCellValue("序号");
                titleRow.CreateCell(1, titleCellStyle).SetCellValue("中文表名");
                titleRow.CreateCell(2, titleCellStyle).SetCellValue("字段中文名");
                titleRow.CreateCell(3, titleCellStyle).SetCellValue("字段英文名");
                titleRow.CreateCell(4, titleCellStyle).SetCellValue("字段类型");
                titleRow.CreateCell(5, titleCellStyle).SetCellValue("主键");
                titleRow.CreateCell(6, titleCellStyle).SetCellValue("长度");
                titleRow.CreateCell(7, titleCellStyle).SetCellValue("精度");
                titleRow.CreateCell(8, titleCellStyle).SetCellValue("备注");
                titleRow.CreateCell(9, titleCellStyle).SetCellValue("英文表名");

                var rowIndex = 1;

                // 设置首行冻结。
                sheet.CreateFreezePane(0, 1);

                // 添加表格定义。
                foreach (var table in schema)
                {
                    // 在目录Sheet中添加表的目录信息。
                    var bookmarkRow = bookmarkSheet.CreateRow(bookmarkIndex);

                    bookmarkRow.HeightInPoints = 24;
                    bookmarkRow.CreateCell(0, centerCellStyle).SetCellValue(bookmarkIndex++);
                    bookmarkRow.CreateCell(1, hyperlinkCellStyle).SetCellValue($"{table.Name}");
                    bookmarkRow.CreateCell(2, leftCellStyle).SetCellValue(table.Comments);
                    bookmarkRow.CreateCell(3, leftCellStyle).SetCellValue("");

                    bookmarkRow.Cells[1].Hyperlink = new HSSFHyperlink(HyperlinkType.Document)
                    {
                        Address = $"#{sheetName}!A{rowIndex + 3}"
                    };
                    bookmarkRow.Cells[1].CellStyle.FillForegroundColor = IndexedColors.Blue.Index;

                    var columnIndex = 1;

                    // 添加表的列定义。
                    foreach (var column in table.Columns)
                    {
                        var row = sheet.CreateRow(rowIndex++);

                        row.Height = 20 * 20;
                        row.CreateCell(0, column.IsPrimaryKey ? pkCenterCellStyle: centerCellStyle).SetCellValue(columnIndex++);
                        row.CreateCell(1, column.IsPrimaryKey ? pkLeftCellStyle: leftCellStyle).SetCellValue(table.Comments.IsNullOrEmptyValue(table.Name));
                        row.CreateCell(2, column.IsPrimaryKey ? pkLeftCellStyle : leftCellStyle).SetCellValue(column.Description.IsNullOrEmptyValue(column.Name));
                        row.CreateCell(3, column.IsPrimaryKey ? pkLeftCellStyle : leftCellStyle).SetCellValue(column.Name);
                        row.CreateCell(4, column.IsPrimaryKey ? pkLeftCellStyle : leftCellStyle).SetCellValue(column.DataType);
                        row.CreateCell(5, column.IsPrimaryKey ? pkCenterCellStyle : centerCellStyle).SetCellValue(column.IsPrimaryKey ? "Y" : "");
                        row.CreateCell(6, column.IsPrimaryKey ? pkLeftCellStyle : leftCellStyle).SetCellValue(column.DataLength.HasValue ? column.DataLength.Value.ToString() : "");
                        row.CreateCell(7, column.IsPrimaryKey ? pkLeftCellStyle : leftCellStyle).SetCellValue("");
                        row.CreateCell(8, column.IsPrimaryKey ? pkLeftCellStyle : leftCellStyle).SetCellValue(string.Empty);
                        row.CreateCell(9, column.IsPrimaryKey ? pkLeftCellStyle : leftCellStyle).SetCellValue(table.Name);
                    }

                    // 合并单元格。
                    var reginIndex = sheet.AddMergedRegion(new CellRangeAddress(rowIndex, rowIndex, 0, 9));

                    // 添加表说明。
                    var tableRow = sheet.CreateRow(rowIndex);

                    tableRow.Height = 24 * 20;
                    tableRow.CreateCell(0, leftCellStyle).SetCellValue(string.Empty);

                    // 设置列宽。
                    sheet.SetColumnWidth(0, 10 * 256);
                    sheet.SetColumnWidth(1, 40 * 256);
                    sheet.SetColumnWidth(2, 22 * 256);
                    sheet.SetColumnWidth(3, 22 * 256);
                    sheet.SetColumnWidth(4, 30 * 256);
                    sheet.SetColumnWidth(5, 10 * 256);
                    sheet.SetColumnWidth(6, 10 * 256);
                    sheet.SetColumnWidth(7, 10 * 256);
                    sheet.SetColumnWidth(8, 30 * 256);
                    sheet.SetColumnWidth(9, 50 * 256);

                    rowIndex++;
                }
            }

            using (stream)
            {
                workbook.Write(stream);
            }
        }
    }
}
