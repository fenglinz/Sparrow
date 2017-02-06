using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;
using Autofac;
using Mercurius.Kernel.Contracts.Core.Services;
using Mercurius.Kernel.Contracts.RBAC.Entities;
using Mercurius.Kernel.Contracts.RBAC.Services;
using Mercurius.Kernel.Contracts.Storage.Entities;
using Mercurius.Kernel.Contracts.Storage.Services;
using Mercurius.Prime.Core;
using Mercurius.Sparrow.Autofac;
using static Mercurius.Sparrow.Backstage.Constants;

namespace Mercurius.Sparrow.Mvc.Extensions
{
    /// <summary>
    /// HtmlHelper扩展。
    /// </summary>
    public static class HtmlHelperExtensions
    {
        #region 字段

        private static readonly IPermissionService _permissionService;
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
                _systemSettingService = container.Resolve<ISystemSettingService>();
                _globalizationService = container.Resolve<IGlobalizationService>();
            }
        }

        #endregion

        #region 获取路径

        /// <summary>
        /// 获取网站根路径。
        /// </summary>
        /// <param name="html">HTML呈现助手</param>
        /// <returns>网站根路径</returns>
        public static string GetBaseUrl(this HtmlHelper html)
        {
            var request = html.ViewContext.HttpContext.Request;

            return request.ApplicationPath == "/" ? string.Empty : request.ApplicationPath;
        }

        /// <summary>
        /// 获取绝对路径。
        /// </summary>
        /// <param name="html">HTML呈现助手</param>
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
        /// <param name="html">HTML呈现助手</param>
        /// <returns>产品名称</returns>
        public static string GetProductName(this HtmlHelper html)
        {
            var setting = _systemSettingService.GetSetting("ProductName");

            return (setting == null || setting.Data == null) ? string.Empty : setting.Data.Value;
        }

        /// <summary>
        /// 获取产品版本。
        /// </summary>
        /// <param name="html">HTML呈现助手</param>
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
        /// 判断是否拥有控制台管理权限。
        /// </summary>
        /// <param name="request">Http请求对象</param>
        /// <returns>是否拥有权限</returns>
        public static bool HasConsoleRight(this HttpRequestBase request)
        {
            var token = request.Cookies[ConsoleManagerToken]?.Value;

            if (string.IsNullOrWhiteSpace(token))
            {
                return false;
            }
            
            if (!System.IO.File.Exists(ConsoleManagerStoragePath))
            {
                return false;
            }

            using (var reader = new StreamReader(ConsoleManagerStoragePath))
            {
                var accountToken = reader.ReadLine();

                return accountToken == token;
            }
        }

        /// <summary>
        /// 显示可访问的按钮脚本。
        /// </summary>
        /// <param name="html">HTML呈现助手</param>
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
        /// <param name="html">HTML呈现助手</param>
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

        #region 获取全球化资源

        /// <summary>
        /// 获取界面资源值。
        /// </summary>
        /// <param name="html">HTML呈现助手</param>
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
        /// <param name="html">HTML呈现助手</param>
        /// <param name="key">键</param>
        /// <returns>全局资源值</returns>
        public static string GetGlobalValue(this HtmlHelper html, string key)
        {
            return _globalizationService.GetGlobalResource(key);
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