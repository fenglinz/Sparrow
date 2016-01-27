using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using NPOI.HSSF.UserModel;
using NPOI.HSSF.Util;
using NPOI.SS.UserModel;

namespace Mercurius.Infrastructure.Data.Excel
{
	/// <summary>
	/// Excel数据导出(采用NPOI的方式)。
	/// </summary>
	public class NPOIExporter : IExporter
	{
		#region 静态变量

		private static readonly int SheetRoowsLimit = 60000;

		#endregion

		#region IExporter接口实现

		/// <summary>
		/// 导出数据模板。
		/// </summary>
		/// <typeparam name="T">导出数据的类型</typeparam>
		/// <param name="output">输出流</param>
		public void ExportDataTemplate<T>(Stream output) where T : class, new()
		{
			var configuration = Util.ResolveConfiguration<T>();

			this.ExportDataTemplate(output, configuration);
		}

		/// <summary>
		/// 导出数据模板。
		/// </summary>
		/// <param name="output">输出流</param>
		/// <param name="configuration">导出设置</param>
		public void ExportDataTemplate(Stream output, Configuration configuration)
		{
			if (output == null)
			{
				throw new ArgumentNullException(nameof(output));
			}

			if (configuration == null)
			{
				throw new ArgumentNullException(nameof(configuration));
			}

			var workbook = new HSSFWorkbook();
			var sheet = workbook.CreateSheet(configuration.SheetName);

			// 添加标题行。
			this.CreateHeaderRow(sheet, configuration.Options);

			// 设置首行冻结。
			sheet.CreateFreezePane(0, 1);

			// 保存。
			workbook.Write(output);
		}

		/// <summary>
		/// 导出数据。
		/// </summary>
		/// <typeparam name="T">数据类型</typeparam>
		/// <param name="sources">数据源</param>
		/// <param name="output">输出流</param>
		public void Export<T>(IEnumerable<T> sources, Stream output) where T : class, new()
		{
			var configuration = Util.ResolveConfiguration<T>();

			this.Export(sources, output, configuration);
		}

		/// <summary>
		/// 导出数据。
		/// </summary>
		/// <typeparam name="T">数据类型</typeparam>
		/// <param name="sources">数据源</param>
		/// <param name="output">输出流</param>
		/// <param name="configuration">导出设置</param>
		public void Export<T>(IEnumerable<T> sources, Stream output, Configuration configuration) where T : class, new()
		{
			if (sources.IsEmpty())
			{
				return;
			}

			if (output == null)
			{
				throw new ArgumentNullException(nameof(output));
			}

			if (configuration == null)
			{
				throw new ArgumentNullException(nameof(configuration));
			}

			var workbook = new HSSFWorkbook();
			var sheetSize = sources.Count() % SheetRoowsLimit == 0 ? sources.Count() / SheetRoowsLimit : (sources.Count() / SheetRoowsLimit) + 1;

			for (var i = 0; i < sheetSize; i++)
			{
				var sheetName = sheetSize == 1 ? configuration.SheetName : $"{configuration.SheetName}{i}";
				var sheet = workbook.CreateSheet(sheetName);

				// 添加标题行。
				this.CreateHeaderRow(sheet, configuration.Options);

				var rowIndex = 1;
				var metadata = Util.GetPropertyMetadatas<T>();
				var currentSheetSources = sources.Skip(i * SheetRoowsLimit).Take(SheetRoowsLimit);

				foreach (var data in currentSheetSources)
				{
					var cellIndex = 0;
					var row = sheet.CreateRow(rowIndex++);

					foreach (var option in configuration.Options)
					{
						var value = metadata[cellIndex].Property.GetValue(data, null);

						if (!string.IsNullOrWhiteSpace(option.DataFormat))
						{
							value = value != null ? string.Format(option.DataFormat, value) : string.Empty;
						}

						row.CreateCell(cellIndex++).SetCellValue(Convert.ToString(value));
					}
				}

				// 设置首行冻结。
				sheet.CreateFreezePane(0, 1);
			}

			// 保存。
			workbook.Write(output);
		}

		#endregion

		#region 私有方法

		/// <summary>
		/// 创建标题行。
		/// </summary>
		/// <param name="sheet">Sheet</param>
		/// <param name="options">导入导出配置项</param>
		/// <returns>标题行对象</returns>
		private IRow CreateHeaderRow(ISheet sheet, IList<OptionItem> options)
		{
			var index = 0;
			var headerFont = sheet.Workbook.CreateFont();
			var headerCellStyle = sheet.Workbook.CreateCellStyle();

			// 标题字体。
			headerFont.FontName = "Arial";
			headerFont.FontHeightInPoints = 13;
			headerFont.Boldweight = 700;
			headerFont.Color = HSSFColor.White.Index;

			// 标题样式。
			headerCellStyle.WrapText = false;
			headerCellStyle.SetFont(headerFont);

			// 设置标题单元格样式：纯色填充时FillForegroundColor值必须
			// 和FillBackgroundColor值一致，且必须FillPattern设置为非NO_FILL。
			headerCellStyle.FillPattern = FillPattern.SolidForeground;
			headerCellStyle.FillForegroundColor = HSSFColor.DarkBlue.Index;
			//headerCellStyle.FillBackgroundColor = 15;
			headerCellStyle.BorderBottom = BorderStyle.Double;

			// 设置单元格的水平对齐、垂直对齐方式。
			headerCellStyle.Alignment = HorizontalAlignment.Center;
			headerCellStyle.VerticalAlignment = VerticalAlignment.Center;

			// 在Excel中添加行。
			var headerRow = sheet.CreateRow(0);

			foreach (var item in options)
			{
				headerRow.CreateCell(index, CellType.String).SetCellValue(item.HeaderText);
				headerRow.Cells[index].CellStyle = headerCellStyle;

				sheet.AutoSizeColumn(index++);
			}

			headerRow.Height = 500;

			return headerRow;
		}

		#endregion
	}
}
