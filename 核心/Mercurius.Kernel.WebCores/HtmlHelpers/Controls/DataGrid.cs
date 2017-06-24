using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Web.WebPages;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Services;
using static Mercurius.Prime.Core.SystemConfiguration;

namespace Mercurius.Kernel.WebCores.HtmlHelpers.Controls
{
    /// <summary>
    /// 行数据。
    /// </summary>
    /// <typeparam name="T">数据类型</typeparam>
    public class RowData<T>
    {
        #region 属性

        /// <summary>
        /// 行号。
        /// </summary>
        public int RowIndex { get; internal set; }

        /// <summary>
        /// 行数据。
        /// </summary>
        public T Data { get; internal set; }

        #endregion
    }

    /// <summary>
    /// 表格控件。
    /// </summary>
    public class DataGrid<T>
    {
        #region 字段

        private static readonly Dictionary<Type, PropertyInfo[]> _dictProperties;

        private readonly HtmlHelper _htmlHelper;
        private readonly IList<DataGridColumn<T>> _columns;

        private string _rowDataKey;
        private Func<T, object> _rowDataFunc;

        // 手风琴设置
        private Func<T, object> _accordionRowFunc;
        private string _accordionContainerClass;

        private string _id;
        private string _title;
        private bool _isReplace = false;
        private string _class = "";
        private string _classTemp = "grid";
        private string _styles;
        private Func<RowData<T>, object> _lineNumberFunc;

        private bool _isPagging;
        private string _controllerName;
        private string _actionName;
        private object _routeValues;
        private int? _pageSize;
        private int _showNumbers;
        private AjaxOptions _ajaxOptions;

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static DataGrid()
        {
            _dictProperties = new Dictionary<Type, PropertyInfo[]>();
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="htmlHelper">Html助手</param>
        public DataGrid(HtmlHelper htmlHelper)
        {
            this._htmlHelper = htmlHelper;
            this._columns = new List<DataGridColumn<T>>();
        }

        #endregion

        #region 设置表格基本属性

        /// <summary>
        /// 设置表格的id元素值。
        /// </summary>
        /// <param name="id">元素值</param>
        /// <returns>表格对象</returns>
        public DataGrid<T> Id(string id)
        {
            this._id = id;

            return this;
        }

        /// <summary>
        /// 设置表格标题。
        /// </summary>
        /// <param name="title">表格标题</param>
        /// <returns>表格对象</returns>
        public DataGrid<T> Title(string title)
        {
            this._title = title;

            return this;
        }

        /// <summary>
        /// 设置表格的css类样式。
        /// </summary>
        /// <param name="class">css类</param>
        /// <param name="isReplace">是否为替换</param>
        /// <returns>表格对象</returns>
        public DataGrid<T> Class(string @class, bool isReplace = false)
        {
            this._class = @class;
            this._isReplace = isReplace;

            return this;
        }

        /// <summary>
        /// 设置表格的style样式。
        /// </summary>
        /// <param name="style">样式</param>
        /// <returns>表格对象</returns>
        public DataGrid<T> Style(string style)
        {
            this._styles = style;

            return this;
        }

        #endregion

        #region 设置显示的列

        /// <summary>
        /// 设置显示行号。
        /// </summary>
        /// <param name="lineNumberFunc">设置自定义行号显示回调</param>
        /// <param name="title">标题</param>
        /// <param name="style">样式</param>
        /// <returns>表格对象</returns>
        public DataGrid<T> ShowLineNumber(
            Func<RowData<T>, object> lineNumberFunc = null,
            string title = "序号",
            string style = "width:70px")
        {
            this._lineNumberFunc = lineNumberFunc;

            if (this._columns.Count > 0 && this._columns[0].DisplayPropertyName == "$RowIndex")
            {
                this._columns[0].Title = title;
                this._columns[0].Style = style;
            }
            else
            {
                this._columns.Insert(0, new DataGridColumn<T>
                {
                    Title = title,
                    Style = style,
                    DisplayPropertyName = "$RowIndex",
                });
            }

            return this;
        }

        /// <summary>
        /// 设置显示行号。
        /// </summary>
        /// <param name="lineNumberFunc">设置自定义行号显示回调</param>
        /// <param name="titleFunc">自定义标题回调</param>
        /// <param name="style">样式</param>
        /// <returns>表格对象</returns>
        public DataGrid<T> ShowLineNumber(
            Func<RowData<T>, object> lineNumberFunc,
            Func<HttpRequestBase, object> titleFunc,
            string style = "width:70px"
            )
        {
            this._lineNumberFunc = lineNumberFunc;

            var title = (titleFunc != null ? (new HelperResult(w => w.Write(titleFunc(this._htmlHelper.ViewContext.HttpContext.Request))).ToHtmlString()) : "");

            if (this._columns.Count > 0 && this._columns[0].DisplayPropertyName == "$RowIndex")
            {
                this._columns[0].Title = title;
                this._columns[0].Style = style;
            }
            else
            {
                this._columns.Insert(0, new DataGridColumn<T>
                {
                    Title = title,
                    Style = style,
                    DisplayPropertyName = "$RowIndex",
                });
            }

            return this;
        }

        /// <summary>
        /// 设置表格行上的数据属性。
        /// </summary>
        /// <param name="dataKey">数据键</param>
        /// <param name="dataFunc">数据值回调</param>
        /// <returns>数据表对象</returns>
        public DataGrid<T> RowData(string dataKey, Func<T, object> dataFunc)
        {
            this._rowDataKey = dataKey;
            this._rowDataFunc = dataFunc;

            return this;
        }

        /// <summary>
        /// 设置表格列。
        /// </summary>
        /// <typeparam name="P">表格列属性类型</typeparam>
        /// <param name="expression">获取表格列属性的Lambda表达式</param>
        /// <param name="title">标题</param>
        /// <param name="width">宽</param>
        /// <param name="format">数据格式化字符串</param>
        /// <returns>数据表对象</returns>
        public DataGrid<T> Column<P>(
            Expression<Func<T, P>> expression,
            string title = null,
            uint? width = null,
            string format = null)
        {
            var propertyName = ExpressionHelper.GetExpressionText(expression);

            this._columns.Add(new DataGridColumn<T>
            {
                Title = title.IsNullOrEmptyValue(propertyName),
                DisplayPropertyName = propertyName,
                Style = width.HasValue ? $"width:{width}px" : "",
                DataFormatString = format
            });

            return this;
        }

        /// <summary>
        /// 添加自定义列的内容。
        /// </summary>
        /// <param name="callback">自定义内容回调</param>
        /// <param name="title">标题</param>
        /// <param name="width">宽度</param>
        /// <param name="class">自定义列样式</param>
        /// <returns>表格对象</returns>
        public DataGrid<T> CustomColumn(
            Func<T, object> callback,
            string title,
            uint? width = null,
            string @class = null)
        {
            this._columns.Add(new DataGridColumn<T>
            {
                Title = title,
                Style = width.HasValue ? $"width:{width}px" : "",
                Class = @class,
                CustomPart = callback
            });

            return this;
        }

        /// <summary>
        /// 添加自定义列的内容。
        /// </summary>
        /// <param name="callback">自定义内容回调</param>
        /// <param name="titleFunc">标题</param>
        /// <param name="width">宽度</param>
        /// <param name="class">表格样式</param>
        /// <returns>表格对象</returns>
        public DataGrid<T> CustomColumn(
            Func<T, object> callback,
            Func<HttpRequestBase, object> titleFunc,
            uint? width = null,
            string @class = null)
        {
            var title = new HelperResult(w => w.Write(titleFunc(this._htmlHelper.ViewContext.HttpContext.Request))).ToString();

            return this.CustomColumn(callback, title, width, @class);
        }

        #endregion

        /// <summary>
        /// 设置手风琴行。
        /// </summary>
        /// <param name="accordionRowFunc">手风琴行回调</param>
        /// <param name="containerClass">手风琴行附加样式类</param>
        /// <returns>数据表对象</returns>
        public DataGrid<T> AccordionRow(Func<T, object> accordionRowFunc, string containerClass = "")
        {
            this._class = "table-1b";
            this._accordionContainerClass = $"table-stretching{(string.IsNullOrWhiteSpace(containerClass) ? "" : " " + containerClass)}";
            this._accordionRowFunc = accordionRowFunc;

            return this;
        }

        #region 分页设置

        /// <summary>
        /// 分页设置。
        /// </summary>
        /// <param name="pageSize">分页大小</param>
        /// <param name="actionName">操作名称</param>
        /// <param name="controllerName">控制器名称</param>
        /// <param name="routeValues">参数列表</param>
        /// <param name="showNumbers">分页控件显示页码的个数</param>
        /// <param name="ajaxOptions">Ajax选项设置</param>
        /// <returns>分页的HTML代码</returns>
        public DataGrid<T> Paging(
            string actionName = null,
            string controllerName = null,
            object routeValues = null,
            int? pageSize = null,
            int showNumbers = 5,
            AjaxOptions ajaxOptions = null)
        {
            this._isPagging = true;
            this._actionName = actionName;
            this._controllerName = controllerName;
            this._routeValues = routeValues;
            this._pageSize = this._htmlHelper.ViewContext.HttpContext.Request.Params["pageSize"].AsInt(DefaultPageSize);
            this._showNumbers = showNumbers;
            this._ajaxOptions = ajaxOptions;

            return this;
        }

        #endregion

        #region 表格呈现

        /// <summary>
        /// 表格呈现。
        /// </summary>
        /// <param name="set">数据集合</param>
        /// <returns>表格HTML片段</returns>
        public IHtmlString Render(ResponseSet<T> set)
        {
            var type = typeof(T);

            if (!_dictProperties.ContainsKey(type))
            {
                _dictProperties.Add(type, type.GetProperties());
            }

            var properties = _dictProperties[type];

            this._id = this._id.IsNullOrEmptyValue(type.Name);

            if (this._columns.IsEmpty())
            {
                foreach (var prop in properties)
                {
                    var displayAttr = prop.GetCustomAttribute<DisplayAttribute>();

                    this._columns.Add(new DataGridColumn<T>
                    {
                        Title = displayAttr == null ? prop.Name : displayAttr.Name,
                        DisplayPropertyName = prop.Name
                    });
                }
            }

            var tableTag = new TagBuilder("table");
            tableTag.Attributes.Add("id", this._id);

            // 添加样式类。
            tableTag.AddCssClass(this._isReplace ? this._class : $"{this._classTemp} {this._class}");

            if (!this._styles.IsNullOrEmpty())
            {
                tableTag.Attributes.Add("style", this._styles);
            }

            var tableHeadTag = GetTableHead();
            var tableBodyTag = new TagBuilder("tbody");

            if (set.HasError())
            {
                tableBodyTag.InnerHtml = $"<tr><td colspan=\"{this._columns.Count}\" class=\"text-danger\">{set.ErrorMessage}</td></tr>";
            }
            else if (set.HasData())
            {
                tableBodyTag.InnerHtml = CreateDatasBody(set, properties);
            }
            else
            {
                tableBodyTag.InnerHtml = $"<tr><td colspan=\"{this._columns.Count}\" class=\"empty-data\">无符合条件的数据！</td></tr>";
            }

            tableTag.InnerHtml += tableHeadTag;
            tableTag.InnerHtml += this._accordionRowFunc == null ? tableBodyTag.ToString() : tableBodyTag.InnerHtml;

            //var datasInfoTag = new TagBuilder("h2");

            //datasInfoTag.AddCssClass("h2_1");
            //datasInfoTag.InnerHtml = $"您当前共有<span>{set?.TotalRecords ?? 0}</span>项{this._title}";

            if (this._isPagging)
            {
                var pagging = this._htmlHelper.Paging(
                    set?.TotalRecords ?? 0,
                    this._actionName,
                    this._controllerName,
                    this._routeValues,
                    this._pageSize,
                    this._showNumbers,
                    this._ajaxOptions);

                var div = new TagBuilder("div");
                // div.InnerHtml += datasInfoTag;
                div.InnerHtml += tableTag;
                div.InnerHtml += pagging;

                return new MvcHtmlString(div.InnerHtml);
            }

            return new MvcHtmlString(tableTag.ToString());
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取表格的标题。
        /// </summary>
        /// <returns>表格标题HTML片段</returns>
        private TagBuilder GetTableHead()
        {
            var tableHeadTag = new TagBuilder("thead")
            {
                InnerHtml = "<tr>"
            };

            // 设置标题。
            foreach (var item in this._columns.Where(c => !c.IsHide))
            {
                tableHeadTag.InnerHtml += $"<td style=\"{item.Style}\">{item.Title}</td>";
            }

            tableHeadTag.InnerHtml += "</tr>";

            return tableHeadTag;
        }

        private string CreateDatasBody(ResponseSet<T> set, PropertyInfo[] properties)
        {
            var index = 1;
            var divTag = new TagBuilder("div");
            var startIndex = this._isPagging ? ((this._htmlHelper.GetCurrentIndex() - 1) * this._pageSize.Value) : 0;

            // 数据显示。
            foreach (var data in set.Datas)
            {
                var dataTag = new StringBuilder("<tr");

                if (this._rowDataFunc != null)
                {
                    dataTag.AppendFormat(" {0}='{1}'>", this._rowDataKey, this._htmlHelper.Raw(this._rowDataFunc(data)));
                }
                else
                {
                    dataTag.Append(">");
                }

                foreach (var column in this._columns)
                {
                    if (column.DisplayPropertyName == "$RowIndex")
                    {
                        if (this._lineNumberFunc == null)
                        {
                            dataTag.Append($"<td class=\"text-center\">{startIndex + index}</td>");
                        }
                        else
                        {
                            var helperResult = new HelperResult(w => w.Write(this._lineNumberFunc(new RowData<T> { Data = data, RowIndex = startIndex + index })));

                            dataTag.Append($"<td class=\"text-center\">{helperResult.ToHtmlString()}</td>");
                        }
                    }
                    else if (column.CustomPart != null)
                    {
                        dataTag.Append($"<td {(column.Class.IsNullOrEmpty() ? "" : "class=\"" + column.Class + "\"")} style=\"{column.Style}\">{new HelperResult(w => w.Write(column.CustomPart.Invoke(data)))}</td>");
                    }
                    else
                    {
                        var property = GetProperty(properties, column.DisplayPropertyName);
                        var value = property.GetValue(data);

                        dataTag.Append($"<td{(column.IsHide ? " style=\"display:none\"" : "")}>{(column.DataFormatString.IsNullOrEmpty() ? value : string.Format(column.DataFormatString, value))}</td>");
                    }
                }

                dataTag.Append("</tr>");

                index++;

                if (this._accordionRowFunc != null)
                {
                    var helperResult = new HelperResult(writer => writer.Write(this._accordionRowFunc(data)));

                    var bodyTag = new TagBuilder("tbody");
                    var accordionTag = new TagBuilder("tr");

                    accordionTag.InnerHtml = $"<td colspan=\"{this._columns.Count}\"><div class=\"{this._accordionContainerClass}\">";
                    accordionTag.InnerHtml += helperResult;
                    accordionTag.InnerHtml += "</div><span class=\"table_more\"></span></td>";

                    bodyTag.InnerHtml += dataTag;
                    bodyTag.InnerHtml += accordionTag;

                    divTag.InnerHtml += bodyTag;
                }
                else
                {
                    divTag.InnerHtml += dataTag;
                }
            }

            return divTag.InnerHtml;
        }
        /// <summary>
        /// 获取属性。
        /// </summary>
        /// <param name="properties">属性集合</param>
        /// <param name="name">属性名称</param>
        /// <returns>属性对象</returns>
        private PropertyInfo GetProperty(PropertyInfo[] properties, string name)
        {
            return properties.FirstOrDefault(p => p.Name == name);
        }

        #endregion
    }
}
