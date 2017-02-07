using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NPOI.SS.UserModel;

namespace Mercurius.Infrastructure
{
    /// <summary>
    /// NPOI扩展方法。
    /// </summary>
    public static class NPOIExtensions
    {
        #region 创建单元格

        /// <summary>
        /// 创建单元格。
        /// </summary>
        /// <param name="row">行对象</param>
        /// <param name="index">单元格索引</param>
        /// <param name="style">单元格样式</param>
        /// <returns>单元格对象</returns>
        public static ICell CreateCell(this IRow row, int index, ICellStyle style)
        {
            return CreateCell(row, index, c => c.CellStyle = style);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="row"></param>
        /// <param name="index"></param>
        /// <param name="callback"></param>
        /// <returns></returns>
        public static ICell CreateCell(this IRow row, int index, Action<ICell> callback)
        {
            if (row == null)
            {
                throw new ArgumentNullException(nameof(row));
            }

            if (index < 0)
            {
                throw new ArgumentException("单元格索引不能小于0！", nameof(index));
            }

            var cell = row.CreateCell(index);

            callback(cell);

            return cell;
        }

        #endregion

        #region 单元格样式处理

        /// <summary>
        /// 创建单元格样式。
        /// </summary>
        /// <param name="workbook">工作表对象</param>
        /// <param name="styleCallback">单元格样式设置回调</param>
        /// <param name="fontCallback">字体设置回调</param>
        /// <param name="borderStyle">边框样式</param>
        /// <returns>单元格样式对象</returns>
        public static ICellStyle NewCellStyle(this IWorkbook workbook,
            Action<ICellStyle> styleCallback = null, Action<IFont> fontCallback = null, BorderStyle borderStyle = BorderStyle.Thin)
        {
            var font = workbook.CreateFont();
            var style = workbook.CreateCellStyle();

            font.FontName = "Courier New";
            font.FontHeightInPoints = 14;

            style.WrapText = true;
            style.Alignment = HorizontalAlignment.Center;
            style.VerticalAlignment = VerticalAlignment.Center;

            style.BorderLeft = borderStyle;
            style.BorderTop = borderStyle;
            style.BorderRight = borderStyle;
            style.BorderBottom = borderStyle;

            fontCallback?.Invoke(font);
            styleCallback?.Invoke(style);

            style.SetFont(font);

            return style;
        }

        #endregion
    }
}
