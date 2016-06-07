using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.SS.Util;

namespace Mercurius.Infrastructure.Ado
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
        public void Export(IList<Table> tables, Stream stream)
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
                    font.Boldweight = 700;
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
            bookmarkSheet.SetColumnWidth(1, 60 * 256);
            bookmarkSheet.SetColumnWidth(2, 45 * 256);
            bookmarkSheet.SetColumnWidth(3, 45 * 256);

            // 首行冻结。
            bookmarkSheet.CreateFreezePane(0, 1);

            var schemas = tables.GroupBy(t => t.Schema);

            foreach (var schema in schemas)
            {
                var rowIndex = 0;
                var sheetName = string.IsNullOrWhiteSpace(schema.Key) ? "公共" : schema.Key;
                var sheet = workbook.CreateSheet(sheetName);

                // 添加表格定义。
                foreach (var table in schema)
                {
                    // 在目录Sheet中添加表的目录信息。
                    var bookmarkRow = bookmarkSheet.CreateRow(bookmarkIndex);

                    bookmarkRow.HeightInPoints = 22;
                    bookmarkRow.CreateCell(0, centerCellStyle).SetCellValue(bookmarkIndex++);
                    bookmarkRow.CreateCell(1, hyperlinkCellStyle).SetCellValue($"{table.Name}");
                    bookmarkRow.CreateCell(2, leftCellStyle).SetCellValue(table.Comments);
                    bookmarkRow.CreateCell(3, leftCellStyle).SetCellValue("");

                    bookmarkRow.Cells[1].Hyperlink = new HSSFHyperlink(HyperlinkType.Document)
                    {
                        Address = $"#{sheetName}!A{rowIndex + 3}"
                    };
                    bookmarkRow.Cells[1].CellStyle.FillForegroundColor = IndexedColors.Blue.Index;

                    // 添加表说明。
                    var tableRow = sheet.CreateRow(rowIndex);

                    // 合并单元格。
                    var reginIndex = sheet.AddMergedRegion(new CellRangeAddress(rowIndex, rowIndex, 0, 6));
                    tableRow.Height = 38 * 20;
                    tableRow.CreateCell(0, tableCellStyle).SetCellValue($"{table.Comments}表({table.Name})");

                    rowIndex++;

                    // 添加标题。
                    titleRow = sheet.CreateRow(rowIndex++);

                    titleRow.Height = 28 * 20;
                    titleRow.CreateCell(0, titleCellStyle).SetCellValue("序号");
                    titleRow.CreateCell(1, titleCellStyle).SetCellValue("名称");
                    titleRow.CreateCell(2, titleCellStyle).SetCellValue("类型");
                    titleRow.CreateCell(3, titleCellStyle).SetCellValue("长度");
                    titleRow.CreateCell(4, titleCellStyle).SetCellValue("约束");
                    titleRow.CreateCell(5, titleCellStyle).SetCellValue("描述");
                    titleRow.CreateCell(6, titleCellStyle).SetCellValue("备注");

                    var columnIndex = 1;

                    // 添加表的列定义。
                    foreach (var column in table.Columns)
                    {
                        var row = sheet.CreateRow(rowIndex++);

                        row.Height = 22 * 20;
                        row.CreateCell(0, centerCellStyle).SetCellValue(columnIndex++);
                        row.CreateCell(1, leftCellStyle).SetCellValue(column.Name);
                        row.CreateCell(2, leftCellStyle).SetCellValue(column.DataType);
                        row.CreateCell(3, leftCellStyle).SetCellValue(column.DataLength);
                        row.CreateCell(4, leftCellStyle).SetCellValue(column.IsIdentity ? "主键" : column.IsNullable ? "可空" : "非空");
                        row.CreateCell(5, leftCellStyle).SetCellValue(column.Description);
                        row.CreateCell(6, centerCellStyle).SetCellValue("");
                    }

                    // 设置列宽。
                    sheet.SetColumnWidth(0, 8 * 256);
                    sheet.SetColumnWidth(1, 40 * 256);
                    sheet.SetColumnWidth(2, 18 * 256);
                    sheet.SetColumnWidth(3, 12 * 256);
                    sheet.SetColumnWidth(4, 12 * 256);
                    sheet.SetColumnWidth(5, 45 * 256);
                    sheet.SetColumnWidth(6, 45 * 256);

                    rowIndex += 3;
                }
            }

            using (stream)
            {
                workbook.Write(stream);
            }
        }
    }
}
