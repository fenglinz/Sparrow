using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;
using Autofac;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Autofac;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Contracts.Storage;
using Mercurius.Sparrow.Entities.RBAC;
using Mercurius.Sparrow.Entities.Storage;

namespace Mercurius.Sparrow.Mvc.Extensions
{
    /// <summary>
    /// HtmlHelper扩展。
    /// </summary>
    public static class HtmlHelperExtensions
    {
        #region 字段

        private static readonly IPermissionService _permissionService;
        private static readonly IDictionaryService _dictionaryService;
        private static readonly IFileService _fileStorageService;
        private static readonly ISystemSettingService _systemSettingService;
        private static readonly IGlobalizationService _globalizationService;

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static HtmlHelperExtensions()
        {
            using (var container = AutofacConfig.Container.BeginLifetimeScope())
            {
                _fileStorageService = container.Resolve<IFileService>();
                _permissionService = container.Resolve<IPermissionService>();
                _dictionaryService = container.Resolve<IDictionaryService>();
                _systemSettingService = container.Resolve<ISystemSettingService>();
                _globalizationService = container.Resolve<IGlobalizationService>();
            }
        }

        #endregion

        #region 获取路径

        /// <summary>
        /// 获取网站根路径。
        /// </summary>
        /// <param name="html">HTML呈现器</param>
        /// <returns>网站根路径</returns>
        public static string GetBaseUrl(this HtmlHelper html)
        {
            var request = html.ViewContext.HttpContext.Request;

            return request.ApplicationPath == "/" ? string.Empty : request.ApplicationPath;
        }

        /// <summary>
        /// 获取绝对路径。
        /// </summary>
        /// <param name="html">HTML呈现器</param>
        /// <param name="actionName">执行方法</param>
        /// <param name="controllerName">控制器</param>
        /// <param name="area">区域</param>
        /// <returns>绝对路径</returns>
        public static string GetAbsoluteUrl(this HtmlHelper html, string actionName, string controllerName = null, string area = null)
        {
            var result = html.GetBaseUrl();

            if (html.ViewContext.RouteData.DataTokens.ContainsKey("area"))
            {
                area = Convert.ToString(html.ViewContext.RouteData.DataTokens["area"]);
            }

            controllerName = controllerName ?? html.ViewContext.RouteData.Values["controller"].ToString();

            result = string.IsNullOrWhiteSpace(area) ?
                $"{result}{controllerName}/{actionName}"
                : $"{result}{area}/{controllerName}/{actionName}";

            return result;
        }

        #endregion

        #region 获取产品信息

        /// <summary>
        /// 获取产品名称。
        /// </summary>
        /// <param name="html">HTML呈现器</param>
        /// <returns>产品名称</returns>
        public static string GetProductName(this HtmlHelper html)
        {
            var setting = _systemSettingService.GetSetting("ProductName");

            return (setting == null || setting.Data == null) ? string.Empty : setting.Data.Value;
        }

        /// <summary>
        /// 获取产品版本。
        /// </summary>
        /// <param name="html">HTML呈现器</param>
        /// <returns>产品版本</returns>
        public static string GetProductVersion(this HtmlHelper html)
        {
            var setting = _systemSettingService.GetSetting("ProductVersion");

            return (setting == null || setting.Data == null) ? string.Empty : setting.Data.Value;
        }

        #endregion

        #region 获取上传文件列表

        /// <summary>
        /// 获取业务流水下的文件信息。
        /// </summary>
        /// <param name="category">业务分类</param>
        /// <param name="serialNumber">业务流水号</param>
        /// <returns>上传文件列表</returns>
        public static IList<BusinessFile> GetBusinessFiles(string category, string serialNumber)
        {
            return _fileStorageService.GetBusinessFiles(category, serialNumber).Datas;
        }

        #endregion

        #region 权限

        /// <summary>
        /// 显示可访问的按钮脚本。
        /// </summary>
        /// <param name="html">HTML呈现器</param>
        /// <param name="button">button名称</param>
        /// <param name="scriptContext">脚本回调</param>
        /// <returns>经过编码的字符串</returns>
        public static IHtmlString RenderButtonScript(this HtmlHelper html, string button, Func<SystemMenu, object> scriptContext)
        {
            var rspAccessButtons = _permissionService.GetAccessibleButtons(
                WebHelper.GetLogOnUserId(),
                html.ViewContext.RequestContext.HttpContext.Request.GetCurrentNavigateUrl());

            if (rspAccessButtons.IsSuccess && !rspAccessButtons.Datas.IsEmpty())
            {
                var accessButton = rspAccessButtons.Datas.FirstOrDefault(s => s.Name == button);

                if (accessButton != null)
                {
                    var helperResult = new HelperResult(writer => writer.Write(scriptContext(accessButton)));

                    return html.Raw(helperResult);
                }
            }

            return new HtmlString(string.Empty);
        }

        /// <summary>
        /// 获取当前用户在当前界面可访问的按钮。
        /// </summary>
        /// <param name="html">HTML呈现器</param>
        /// <param name="leftPart">附加HTML标签区域</param>
        /// <returns>经过HTML编码的字符串</returns>
        public static IHtmlString RenderAccessibleButtons(this HtmlHelper html, Func<IList<SystemMenu>, object> leftPart = null)
        {
            var tagBuilder = new TagBuilder("div");

            tagBuilder.AddCssClass("toolbar panel panel-default");

            var contentBuilder = new TagBuilder("div");
            contentBuilder.AddCssClass("panel-heading");

            var rspAccessButtons = _permissionService.GetAccessibleButtons(
                WebHelper.GetLogOnUserId(),
                html.ViewContext.RequestContext.HttpContext.Request.GetCurrentNavigateUrl());

            var leftTag = new TagBuilder("div");
            leftTag.AddCssClass("left");

            if (leftPart != null)
            {
                var helperResult = new HelperResult(writer => writer.Write(leftPart(rspAccessButtons.Datas)));

                leftTag.InnerHtml = helperResult.ToHtmlString();
            }

            var rightTag = new TagBuilder("div");
            rightTag.AddCssClass("right btn-group");

            if (rspAccessButtons.IsSuccess)
            {
                if (!rspAccessButtons.Datas.IsEmpty())
                {
                    foreach (var item in rspAccessButtons.Datas)
                    {
                        rightTag.InnerHtml += $"<a href=\"#\" onclick=\"{item.NavigateUrl}()\" class=\"btn btn-default\"><i class=\"{item.Image}\"></i>&nbsp;{item.Title}</a>";
                    }
                }
            }

            contentBuilder.InnerHtml += leftTag.ToString();
            contentBuilder.InnerHtml += rightTag.ToString();
            tagBuilder.InnerHtml += contentBuilder.ToString();

            return new MvcHtmlString(tagBuilder.ToString());
        }

        #endregion

        #region 字典列表

        /// <summary>
        /// 创建下拉框。
        /// </summary>
        /// <typeparam name="T">视图模型类型</typeparam>
        /// <typeparam name="P">属性类型</typeparam>
        /// <param name="html">HTML呈现器</param>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <param name="category">字典分类</param>
        /// <param name="includeAll">是否包含所有选项</param>
        /// <param name="htmlAttributes">下拉框HTML属性</param>
        /// <returns>下拉框HTML片段</returns>
        public static IHtmlString CreateDropdownListFor<T, P>(
            this HtmlHelper<T> html, Expression<Func<T, P>> expression,
            string category, bool includeAll = true, dynamic htmlAttributes = null)
        {
            var name = ExpressionHelper.GetExpressionText(expression);
            var value = html.ViewData.Model == null ? null : html.ViewData.ModelMetadata.ModelType.GetProperty(name).GetValue(html.ViewData.Model);

            return CreateDropdownList(html, name, category, Convert.ToString(value), includeAll, htmlAttributes);
        }

        /// <summary>
        /// 创建下拉框。
        /// </summary>
        /// <param name="html">HTML控件</param>
        /// <param name="name">名称</param>
        /// <param name="category">下拉框数据分类</param>
        /// <param name="defaultValue">默认值</param>
        /// <param name="includeAll">是否包含“全部”选项</param>
        /// <param name="htmlAttributes">HTML属性</param>
        /// <returns>下拉框HTML编码字符串</returns>
        public static IHtmlString CreateDropdownList(
            this HtmlHelper html,
            string name,
            string category,
            string defaultValue = null,
            bool includeAll = true,
            dynamic htmlAttributes = null)
        {
            var tagBuilder = new TagBuilder("select");

            tagBuilder.Attributes.Add("id", name);
            tagBuilder.Attributes.Add("name", name);
            tagBuilder.AddCssClass("form-control");
            tagBuilder.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes), true);

            if (includeAll)
            {
                var allTag = new TagBuilder("option");

                allTag.SetInnerText("全部");
                allTag.Attributes.Add("value", string.Empty);

                tagBuilder.InnerHtml += allTag;
            }

            var rsp = _dictionaryService.GetCategoryItems(category);

            if (rsp.IsSuccess && !rsp.Datas.IsEmpty())
            {
                var groups = rsp.Datas.Where(d => d.Type == 1);

                if (!groups.IsEmpty())
                {
                    foreach (var group in groups)
                    {
                        var optgroup = new TagBuilder("optgroup");

                        optgroup.Attributes.Add("label", group.Key);

                        var items = rsp.Datas.Where(d => d.ParentId == group.Id);

                        foreach (var item in items)
                        {
                            var optionTag = new TagBuilder("option");

                            optionTag.SetInnerText(item.Key);
                            optionTag.Attributes.Add("value", item.Value);
                            optionTag.Attributes.Add("data-group", group.Key);

                            if (defaultValue == item.Value)
                            {
                                optionTag.Attributes.Add("selected", "selected");
                            }

                            optgroup.InnerHtml += optionTag;
                        }

                        tagBuilder.InnerHtml += optgroup;
                    }
                }
                else
                {
                    foreach (var item in rsp.Datas)
                    {
                        var optionTag = new TagBuilder("option");

                        optionTag.SetInnerText(item.Key);
                        optionTag.Attributes.Add("value", item.Value);

                        if (defaultValue == item.Value)
                        {
                            optionTag.Attributes.Add("selected", "selected");
                        }

                        tagBuilder.InnerHtml += optionTag;
                    }
                }
            }

            return new MvcHtmlString(tagBuilder.ToString());
        }

        #endregion

        #region 获取全球化资源

        /// <summary>
        /// 获取界面资源值。
        /// </summary>
        /// <param name="html">HTML呈现器</param>
        /// <param name="key">字典名</param>
        /// <param name="viewName">视图名</param>
        /// <returns>资源值</returns>
        public static string GetLocalValue(this HtmlHelper html, string key, string viewName = null)
        {
            var area = Convert.ToString(html.ViewContext.RequestContext.RouteData.DataTokens["area"]);
            var controller = html.ViewContext.RequestContext.RouteData.Values["controller"].ToString();

            if (string.IsNullOrWhiteSpace(viewName))
            {
                var viewPath = (html.ViewContext.View as RazorView).ViewPath;

                viewName = viewPath.Substring(viewPath.LastIndexOf('/') + 1).Replace(".cshtml", string.Empty);
            }

            var resources = _globalizationService.GetResources(controller, viewName, area);

            return resources.ContainsKey(key) ? resources[key] : key;
        }

        /// <summary>
        /// 获取全局资源。
        /// </summary>
        /// <param name="html">HTML呈现器</param>
        /// <param name="key">键</param>
        /// <returns>全局资源值</returns>
        public static string GetGlobalValue(this HtmlHelper html, string key)
        {
            return _globalizationService.GetGlobalResource(key);
        }

        #endregion

        #region CheckBoxs

        /// <summary>
        /// 生成复选框列表。
        /// </summary>
        /// <typeparam name="TModel">视图模型类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="html">HTML控件呈现器</param>
        /// <param name="expression">属性表达式</param>
        /// <param name="items">数据源</param>
        /// <param name="htmlAttributes">复选框列表容器HTML属性</param>
        /// <param name="showMoreNumbers">显示更多标签的列表数</param>
        /// <returns>复选框列表控件HTML代码</returns>
        public static MvcHtmlString CheckBoxsFor<TModel, TProperty>(
            this HtmlHelper<TModel> html, Expression<Func<TModel, TProperty>> expression,
            string[] items, object htmlAttributes = null, int? showMoreNumbers = null)
        {
            var name = ExpressionHelper.GetExpressionText(expression);
            var checkedValues = html.ViewData.Model == null ? null : html.ViewData.ModelMetadata.ModelType.GetProperty(name).GetValue(html.ViewData.Model);

            return CheckBoxs(html, name, items.ToDictionary(), checkedValues, htmlAttributes, showMoreNumbers);
        }

        /// <summary>
        /// 生成复选框列表。
        /// </summary>
        /// <typeparam name="TModel">视图模型类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="html">HTML控件呈现器</param>
        /// <param name="expression">属性表达式</param>
        /// <param name="items">数据源</param>
        /// <param name="htmlAttributes">复选框列表容器HTML属性</param>
        /// <param name="showMoreNumbers">显示更多标签的列表数</param>
        /// <returns>复选框列表控件HTML代码</returns>
        public static MvcHtmlString CheckBoxsFor<TModel, TProperty>(
            this HtmlHelper<TModel> html, Expression<Func<TModel, TProperty>> expression,
            IDictionary<string, object> items, object htmlAttributes = null, int? showMoreNumbers = null)
        {
            var name = ExpressionHelper.GetExpressionText(expression);
            var checkedValues = html.ViewData.Model == null ? null : html.ViewData.ModelMetadata.ModelType.GetProperty(name).GetValue(html.ViewData.Model);

            return CheckBoxs(html, name, items, checkedValues, htmlAttributes, showMoreNumbers);
        }

        /// <summary>
        /// 从字典生成复选框列表。
        /// </summary>
        /// <typeparam name="TModel">视图模型类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="html">HTML控件呈现器</param>
        /// <param name="expression">属性表达式</param>
        /// <param name="category">字典分类</param>
        /// <param name="htmlAttributes">复选框列表容器HTML属性</param>
        /// <param name="showMoreNumbers">显示更多标签的列表数</param>
        /// <returns>复选框列表控件HTML代码</returns>
        public static MvcHtmlString CheckBoxsFor<TModel, TProperty>(
            this HtmlHelper<TModel> html, Expression<Func<TModel, TProperty>> expression,
            string category, object htmlAttributes = null, int? showMoreNumbers = null)
        {
            var name = ExpressionHelper.GetExpressionText(expression);
            var checkedValues = html.ViewData.Model == null ? null : html.ViewData.ModelMetadata.ModelType.GetProperty(name).GetValue(html.ViewData.Model);

            return CheckBoxs(html, name, category, checkedValues, htmlAttributes, showMoreNumbers);
        }

        /// <summary>
        /// 从字典生成复选框列表。
        /// </summary>
        /// <param name="html">HTML控件呈现器</param>
        /// <param name="name">属性名</param>
        /// <param name="category">字典分类</param>
        /// <param name="checkedValues">选中的项</param>
        /// <param name="htmlAttributes">复选框列表容器HTML属性</param>
        /// <param name="showMoreNumbers">显示更多标签的列表数</param>
        /// <returns>复选框列表控件HTML代码</returns>
        public static MvcHtmlString CheckBoxs(this HtmlHelper html, string name, string category,
            object checkedValues = null, object htmlAttributes = null, int? showMoreNumbers = null)
        {
            if (string.IsNullOrWhiteSpace(category))
            {
                return null;
            }

            var rspDictionaries = _dictionaryService.GetCategoryItems(category);

            if (!rspDictionaries.HasData())
            {
                return null;
            }

            return CheckBoxs(html, name, rspDictionaries.Datas.ToDictionary(d => d.Key, d => (object)d.Value), checkedValues, htmlAttributes, showMoreNumbers);
        }

        /// <summary>
        /// 生成复选框列表。
        /// </summary>
        /// <param name="html">HTML控件呈现器</param>
        /// <param name="name">属性名称</param>
        /// <param name="items">数据源</param>
        /// <param name="checkedValues">选中的值</param>
        /// <param name="htmlAttributes">复选框列表容器HTML属性</param>
        /// <param name="showMoreNumbers">显示更多标签的列表数</param>
        /// <returns>复选框列表控件HTML代码</returns>
        public static MvcHtmlString CheckBoxs(
            this HtmlHelper html, string name, string[] items,
            object checkedValues = null, object htmlAttributes = null, int? showMoreNumbers = null)
        {
            return CheckBoxs(html, name, items.ToDictionary(), checkedValues, htmlAttributes, showMoreNumbers);
        }

        /// <summary>
        /// 生成复选框列表。
        /// </summary>
        /// <param name="html">HTML控件呈现器</param>
        /// <param name="name">属性名</param>
        /// <param name="items">数据源</param>
        /// <param name="checkedValues">选中的值</param>
        /// <param name="htmlAttributes">复选框列表容器HTML属性</param>
        /// <param name="showMoreNumbers">显示更多标签的列表数</param>
        /// <returns>复选框列表控件HTML代码</returns>
        public static MvcHtmlString CheckBoxs(
            this HtmlHelper html, string name, IDictionary<string, object> items,
            object checkedValues = null, object htmlAttributes = null, int? showMoreNumbers = null)
        {
            if (items.IsEmpty())
            {
                return null;
            }

            var index = 1;

            if (showMoreNumbers.HasValue && items.Count > showMoreNumbers)
            {
                var container = new TagBuilder("div");
                container.AddCssClass("has-more-checkbox");

                var showItems = items.Take(showMoreNumbers.Value);
                var showCheckboxsContainer = new TagBuilder("div");

                showCheckboxsContainer.AddCssClass("checkbox-container");

                if (htmlAttributes != null)
                {
                    showCheckboxsContainer.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes), true);
                }

                foreach (var item in showItems)
                {
                    showCheckboxsContainer.InnerHtml += $"<label><input id=\"chk{name}{index++}\" name=\"{name}\" type=\"checkbox\" value=\"{item.Value}\"{checkedValues?.ToString().GetChecked(item.Value)} />{item.Key}</label>";
                }

                container.InnerHtml += showCheckboxsContainer;

                var moreCheckboxsContainer = new TagBuilder("div");

                moreCheckboxsContainer.Attributes.Add("id", name + "More");
                moreCheckboxsContainer.AddCssClass("checkbox-container more-checkbox");

                if (htmlAttributes != null)
                {
                    moreCheckboxsContainer.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes), true);
                }

                var moreItems = items.Skip(showMoreNumbers.Value);

                foreach (var item in moreItems)
                {
                    moreCheckboxsContainer.InnerHtml += $"<label><input id=\"chk{name}{index++}\" name=\"{name}\" type=\"checkbox\" value=\"{item.Value}\"{checkedValues?.ToString().GetChecked(item.Value)} />{item.Key}</label>";
                }

                container.InnerHtml += moreCheckboxsContainer;

                container.InnerHtml += $"<span class=\"more\" onclick=\"if ({"$"}(this).text() == '更多+'){"{ $"}('#{name + "More"}').show();{'$'}(this).text('隐藏-');{'}'}else{"{ $"}('#{name + "More"}').hide();{'$'}(this).text('更多+');{'}'}\">更多+</span>";

                return new MvcHtmlString(container.ToString());
            }
            else
            {
                var checkboxsContainer = new TagBuilder("div");

                checkboxsContainer.AddCssClass("checkbox-container");

                if (htmlAttributes != null)
                {
                    checkboxsContainer.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes), true);
                }

                foreach (var item in items)
                {
                    checkboxsContainer.InnerHtml += $"<label><input id=\"chk{name}{index++}\" name=\"{name}\" type=\"checkbox\" value=\"{item.Value}\"{checkedValues?.ToString().GetChecked(item.Value)} />{item.Key}</label>";
                }

                return new MvcHtmlString(checkboxsContainer.ToString());
            }
        }

        #endregion

        #region 私有方法

        private static IDictionary<string, object> ToDictionary(this string[] items)
        {
            if (items.IsEmpty())
            {
                return null;
            }

            var result = new Dictionary<string, object>();

            foreach (var item in items)
            {
                if (!result.ContainsKey(item))
                {
                    result.Add(item, item);
                }
            }

            return result;
        }

        private static string GetChecked(this string checkedValues, object item)
        {
            if (string.IsNullOrWhiteSpace(checkedValues) || item == null)
            {
                return null;
            }

            var items = checkedValues.Split(',');

            return items.Contains(item.ToString()) ? " checked" : null;
        }

        #endregion
    }
}