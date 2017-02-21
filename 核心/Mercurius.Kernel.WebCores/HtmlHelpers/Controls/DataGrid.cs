using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
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
    /// 表格控件。
    /// </summary>
    public class DataGrid<T>
    {
        #region 字段

        private static readonly Dictionary<Type, PropertyInfo[]> _dictProperties;

        private readonly IList<string> _rowDatas;
        private readonly IList<DataGridColumn<T>> _columns;
        private readonly HtmlHelper<ResponseSet<T>> _htmlHelper;

        private string _id;
        private string _class;
        private string _styles;
        private bool _isShowLineNumber;

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
        public DataGrid(HtmlHelper<ResponseSet<T>> htmlHelper)
        {
            this._htmlHelper = htmlHelper;
            this._rowDatas = new List<string>();
            this._columns = new List<DataGridColumn<T>>();
        }

        #endregion

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
        /// 设置表格的css类样式。
        /// </summary>
        /// <param name="class">css类</param>
        /// <returns>表格对象</returns>
        public DataGrid<T> Class(string @class)
        {
            this._class = @class;

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

        /// <summary>
        /// 设置是否显示行数。
        /// </summary>
        /// <param name="isShow">是否显示</param>
        /// <returns>表格对象</returns>
        public DataGrid<T> ShowLineNumber(bool isShow = true)
        {
            this._isShowLineNumber = isShow;

            return this;
        }

        /// <summary>
        /// 设置表格行上的数据属性。
        /// </summary>
        /// <typeparam name="P">属性名称</typeparam>
        /// <param name="expression">显示的属性值的Lambda表达式</param>
        /// <returns>数据表对象</returns>
        public DataGrid<T> RowData<P>(Expression<Func<T, P>> expression)
        {
            var propertyName = ExpressionHelper.GetExpressionText(expression);

            this._rowDatas.Add(propertyName);

            return this;
        }

        /// <summary>
        /// 设置单元格。
        /// </summary>
        /// <typeparam name="P">单元格属性类型</typeparam>
        /// <param name="expression">获取单元格属性的Lambda表达式</param>
        /// <param name="title">标题</param>
        /// <param name="width">宽</param>
        /// <param name="formatString">数据格式化字符串</param>
        /// <returns>数据表对象</returns>
        public DataGrid<T> Column<P>(Expression<Func<T, P>> expression, string title = null, uint? width = null, string formatString = null)
        {
            var propertyName = ExpressionHelper.GetExpressionText(expression);

            this._columns.Add(new DataGridColumn<T>
            {
                Title = title.IsNullOrWhiteSpace() ? propertyName : title,
                DisplayPropertyName = propertyName,
                Style = $"width:{width}px",
                DataFormatString = formatString
            });

            return this;
        }

        /// <summary>
        /// 添加自定义列的内容。
        /// </summary>
        /// <param name="titleFunc">标题</param>
        /// <param name="width">宽度</param>
        /// <param name="callback">自定义内容回调</param>
        /// <returns>表格对象</returns>
        public DataGrid<T> CustomColumn(
            Func<HttpRequestBase, object> titleFunc,
            uint width, Func<T, object> callback, string @class = null)
        {
            var title = new HelperResult(w => w.Write(titleFunc(this._htmlHelper.ViewContext.HttpContext.Request))).ToString();

            return this.CustomColumn(title, width, callback, @class);
        }

        /// <summary>
        /// 添加自定义列的内容。
        /// </summary>
        /// <param name="title">标题</param>
        /// <param name="width">宽度</param>
        /// <param name="callback">自定义内容回调</param>
        /// <returns>表格对象</returns>
        public DataGrid<T> CustomColumn(string title,
            uint width, Func<T, object> callback, string @class = null)
        {
            this._columns.Add(new DataGridColumn<T>
            {
                Title = title,
                Style = $"width:{width}px",
                Class = @class,
                CustomPart = callback
            });

            return this;
        }

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
            this._pageSize = pageSize ?? DefaultPageSize;
            this._showNumbers = showNumbers;
            this._ajaxOptions = ajaxOptions;

            return this;
        }

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

            this._id = this._id.IsNullOrWhiteSpace() ? type.Name : this._id;

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

            // 显示序号的处理。
            if (this._isShowLineNumber)
            {
                this._columns.Insert(0, new DataGridColumn<T>
                {
                    Title = "序号",
                    Style = "width:70px",
                    DisplayPropertyName = "$RowIndex"
                });
            }

            var tableTag = new TagBuilder("table");
            tableTag.AddCssClass(this._class.IsNullOrWhiteSpace() ? "grid" : this._class);
            tableTag.Attributes.Add("id", this._id);

            if (!this._styles.IsNullOrWhiteSpace())
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
            tableTag.InnerHtml += tableBodyTag;

            if (this._isPagging)
            {
                var pagging = this._htmlHelper.Paging(
                    set.TotalRecords, this._actionName,
                    this._controllerName, this._routeValues,
                    this._pageSize, this._showNumbers, this._ajaxOptions);

                var div = new TagBuilder("div");
                div.InnerHtml += tableTag;
                div.InnerHtml += pagging;

                return new MvcHtmlString(div.InnerHtml);
            }

            return new MvcHtmlString(tableTag.ToString());
        }

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
                var dataTag = new TagBuilder("tr");

                if (!this._rowDatas.IsEmpty())
                {
                    foreach (var item in this._rowDatas)
                    {
                        dataTag.Attributes.Add($"data-{item}", Convert.ToString(GetProperty(properties, item).GetValue(data)));
                    }
                }

                foreach (var column in this._columns)
                {
                    if (column.DisplayPropertyName == "$RowIndex")
                    {
                        dataTag.InnerHtml += $"<td class=\"text-center\">{startIndex + index}</td>";
                    }
                    else if (column.CustomPart != null)
                    {
                        dataTag.InnerHtml += $"<td {(column.Class.IsNullOrWhiteSpace() ? "\"\"" : "class=" + column.Class)} style=\"{column.Style}\">{new HelperResult(w => w.Write(column.CustomPart.Invoke(data)))}</td>";
                    }
                    else
                    {
                        var property = GetProperty(properties, column.DisplayPropertyName);
                        var value = property.GetValue(data);

                        dataTag.InnerHtml +=
                            $"<td{(column.IsHide ? " style=\"display:none\"" : "")}>{(column.DataFormatString.IsNullOrWhiteSpace() ? value : string.Format(column.DataFormatString, value))}</td>";
                    }
                }

                index++;

                divTag.InnerHtml += dataTag;
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
