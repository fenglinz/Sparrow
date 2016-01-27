using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Web.Mvc.Html;
using System.Web.Routing;
using System.Web.WebPages;
using Mercurius.Sparrow.Entities;

namespace Mercurius.FileStorage.WebUI.Extensions
{
    /// <summary>
    /// 分页扩展。
    /// </summary>
    public static class PagingExtensions
    {
        #region 常量

        private const string PagerRouteName = "PageIndex";

        #endregion

        #region 公开方法

        /// <summary>
        /// 显示分页。
        /// </summary>
        /// <param name="html">HTML呈现器</param>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="pageSize">分页大小</param>
        /// <param name="actionName">操作名称</param>
        /// <param name="controllerName">控制器名称</param>
        /// <param name="routeValues">参数列表</param>
        /// <param name="showNumbers">分页控件显示页码的个数</param>
        /// <param name="ajaxOptions">Ajax选项设置</param>
        /// <returns>分页的HTML代码</returns>
        public static MvcHtmlString Paging(
            this HtmlHelper html,
            int totalRecords,
            string actionName = null,
            string controllerName = null,
            object routeValues = null,
            int? pageSize = null,
            int showNumbers = 5,
            AjaxOptions ajaxOptions = null)
        {
            var htmlString = new StringBuilder();

            htmlString.Append("<div class=\"pager-container\">");

            pageSize = pageSize ?? SearchObject.DefalutPageSize;

            var currentIndex = html.GetCurrentIndex();
            var pageCount = totalRecords % pageSize.Value == 0 ?
                totalRecords / pageSize.Value : (totalRecords / pageSize.Value) + 1;

            var routeDatas = html.ViewContext.RouteData.Values;

            actionName = actionName ?? Convert.ToString(routeDatas["action"]);
            controllerName = controllerName ?? Convert.ToString(routeDatas["controller"]);

            if (pageCount > 1)
            {
                htmlString.Append($"<span>总共有{totalRecords}条数据&nbsp;&nbsp;当前{currentIndex}/{pageCount}页</span>");
            }
            else
            {
                htmlString.Append($"<span>总共有{totalRecords}条数据</span></div>");

                return MvcHtmlString.Create(htmlString.ToString());
            }

            RouteValueDictionary routeDict;

            if (routeValues is RouteValueDictionary)
            {
                routeDict = routeValues as RouteValueDictionary;
            }
            else
            {
                routeDict = new RouteValueDictionary(routeValues);
            }

            if (routeDict.ContainsKey("pageSize"))
            {
                routeDict["pageSize"] = pageSize;
            }
            else
            {
                routeDict.Add("pageSize", pageSize);
            }

            htmlString.Append("<ul class=\"pagination\">");

            if (pageCount <= showNumbers)
            {
                for (var i = 1; i <= pageCount; i++)
                {
                    htmlString.Append(
                        html.CreateActionLink(
                            pageCount,
                            i,
                            i.ToString(CultureInfo.InvariantCulture),
                            actionName,
                            controllerName,
                            routeDict,
                            ajaxOptions));
                }
            }
            else
            {
                // 当前页号不是第一页时，显示"首页"、"上一页"菜单。
                if (currentIndex > 1)
                {
                    htmlString.Append(
                        html.CreateActionLink(pageCount, 1, "首页", actionName, controllerName, routeDict, ajaxOptions));
                    htmlString.Append(
                        html.CreateActionLink(
                            pageCount,
                            (currentIndex - 1) <= 1 ? 1 : currentIndex - 1,
                            "上一页",
                            actionName,
                            controllerName,
                            routeDict,
                            ajaxOptions));
                }

                // 计算分页栏上的起始页码。
                int startIndex;
                currentIndex = currentIndex > pageCount ? pageCount : currentIndex;

                if (currentIndex % showNumbers == 0)
                {
                    startIndex = (currentIndex / showNumbers - 1) * showNumbers;
                }
                else
                {
                    startIndex = (currentIndex / showNumbers) * showNumbers;
                }

                // 当前页号大于分页栏上显示的页码数时，起始页码前显示一个"..."。
                if (currentIndex > showNumbers)
                {
                    htmlString.Append(
                        html.CreateActionLink(
                            pageCount,
                            startIndex,
                            "...",
                            actionName,
                            controllerName,
                            routeDict,
                            ajaxOptions));
                }

                // 显示页码。
                var index = startIndex + 1;
                for (; index <= startIndex + showNumbers; index++)
                {
                    if (index > pageCount)
                    {
                        break;
                    }

                    htmlString.Append(
                        html.CreateActionLink(
                            pageCount,
                            index,
                            index.ToString(CultureInfo.InvariantCulture),
                            actionName,
                            controllerName,
                            routeDict,
                            ajaxOptions));
                }

                // 在不能显示最后一页的页码时，分页栏页码的后面显示一个"..."。
                if (startIndex + showNumbers < pageCount)
                {
                    htmlString.Append(
                        html.CreateActionLink(
                            pageCount,
                            index < pageCount ? index : pageCount,
                            "...",
                            actionName,
                            controllerName,
                            routeDict,
                            ajaxOptions));
                }

                // 当前页号小于总页数时，显示"下一页"、"尾页"菜单。
                if (currentIndex < pageCount)
                {
                    htmlString.Append(
                        html.CreateActionLink(
                            pageCount,
                            currentIndex + 1 >= pageCount ? pageCount : currentIndex + 1,
                            "下一页",
                            actionName,
                            controllerName,
                            routeDict,
                            ajaxOptions));
                    htmlString.Append(
                        html.CreateActionLink(
                            pageCount,
                            pageCount,
                            "尾页",
                            actionName,
                            controllerName,
                            routeDict,
                            ajaxOptions));
                }
            }

            htmlString.Append("</ul></div>");

            return MvcHtmlString.Create(htmlString.ToString());
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 取得当前页数。
        /// </summary>
        /// <param name="html">HTML呈现器</param>
        /// <returns>当前页数</returns>
        private static int GetCurrentIndex(this HtmlHelper html)
        {
            int currentIndex;

            if (html.ViewContext.RouteData.Values.ContainsKey(PagerRouteName))
            {
                currentIndex = Convert.ToString(html.ViewContext.RouteData.Values[PagerRouteName]).AsInt(1);
            }
            else if (html.ViewContext.RequestContext.HttpContext.Request[PagerRouteName].IsInt())
            {
                currentIndex = html.ViewContext.RequestContext.HttpContext.Request[PagerRouteName].AsInt();
            }
            else
            {
                currentIndex = Convert.ToString(html.ViewContext.ViewData[PagerRouteName]).AsInt(1);
            }

            currentIndex = currentIndex <= 0 ? 1 : currentIndex;

            return currentIndex;
        }

        /// <summary>
        /// 生成分页栏上的菜单。
        /// </summary>
        /// <param name="html">HTML呈现器</param>
        /// <param name="pageCount">总页数</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="linkText">菜单文本</param>
        /// <param name="actionName">重定向操作名称</param>
        /// <param name="controllerName">重定向控制器名称</param>
        /// <param name="routeValues">路由参数</param>
        /// <param name="ajaxOptions">Ajax选项设置</param>
        /// <returns>HTML片段</returns>
        private static string CreateActionLink(
            this HtmlHelper html,
            int pageCount,
            int pageIndex,
            string linkText,
            string actionName,
            string controllerName,
            RouteValueDictionary routeValues,
            AjaxOptions ajaxOptions)
        {
            if (routeValues.ContainsKey(PagerRouteName))
            {
                routeValues[PagerRouteName] = pageIndex;
            }
            else
            {
                routeValues.Add(PagerRouteName, pageIndex);
            }

            IHtmlString link;
            var currentIndex = html.GetCurrentIndex();
            currentIndex = currentIndex > pageCount ? pageCount : currentIndex;

            if (currentIndex == pageIndex)
            {
                return
                    $"<li class=\"active\"><a href=\"#\">{pageIndex} <span class=\"sr-only\">(current)</span></a></li>";
            }

            if (ajaxOptions != null)
            {
                var ajax = new AjaxHelper(html.ViewContext, html.ViewDataContainer);

                link = ajax.ActionLink(linkText, actionName, controllerName, routeValues, ajaxOptions, null);
            }
            else
            {
                link = html.ActionLink(linkText, actionName, controllerName, routeValues, null);
            }

            return "<li>" + link.ToHtmlString() + "</li>";
        }

        #endregion
    }
}