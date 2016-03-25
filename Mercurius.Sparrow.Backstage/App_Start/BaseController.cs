using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure.Dynamic;
using Autofac;
using static Mercurius.Sparrow.Autofac.AutofacConfig;

namespace Mercurius.Sparrow.Backstage
{
    /// <summary>
    /// 基本系统控制器。
    /// </summary>
    public abstract class BaseController : Controller
    {
        #region 属性

        /// <summary>
        /// 动态查询对象。
        /// </summary>
        public DynamicQuery DynamicQuery { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public BaseController()
        {
            this.DynamicQuery = Container.Resolve<DynamicQuery>();
        }

        #endregion

        #region 受保护方法

        /// <summary>
        /// 将错误详情转换为HTML信息。
        /// </summary>
        /// <param name="collection">错误详情</param>
        /// <returns>HTML信息</returns>
        protected string ConvertToHtml(NameValueCollection collection)
        {
            var result = string.Empty;

            if (collection != null && collection.Count > 0)
            {
                var builder = new StringBuilder();

                builder.Append("<ul>");

                foreach (var item in collection.AllKeys)
                {
                    builder.AppendFormat("<li>{0}</li>", collection[item]);
                }

                builder.Append("</ul>");

                result = builder.ToString();
            }

            return result;
        }

        /// <summary>
        /// 执行弹出框提醒JavaScript代码。
        /// </summary>
        /// <param name="message">提醒消息</param>
        /// <param name="type">弹出框类型</param>
        /// <param name="timeout">弹出框显示时间</param>
        /// <returns>JavaScript操作结果</returns>
        protected JavaScriptResult Alert(string message, AlertType type = AlertType.Info, int timeout = 2500)
        {
            return this.JavaScript($"mercurius.ShowTipsMessage('{message}','{timeout}','{(int) type}');");
        }

        /// <summary>
        /// 执行弹出框提醒并刷新当前窗体JavaScript代码。
        /// </summary>
        /// <param name="message">提醒消息</param>
        /// <param name="type">弹出框类型</param>
        /// <param name="timeout">弹出框显示时间</param>
        /// <returns>JavaScript操作结果</returns>
        protected JavaScriptResult AlertWithRefresh(string message, AlertType type = AlertType.Info, int timeout = 2500)
        {
            return this.JavaScript($"mercurius.ShowTipsMessage('{message}','{timeout}','{(int) type}');mercurius.Reloading()");
        }

        /// <summary>
        /// 执行关闭弹出框并显示提醒的JavaScript。
        /// </summary>
        /// <param name="message">提醒消息</param>
        /// <param name="timeout">弹出框显示时间</param>
        /// <param name="callback">调用主页面的方法</param>
        /// <returns>JavaScript操作结果</returns>
        protected JavaScriptResult CloseDialogWithAlert(
            string message, int timeout = 2500, string callback = "top.main.mercurius.Reloading()")
        {
            return this.JavaScript($"mercurius.ShowTipsMessage('{message}','{timeout}','4');{callback};mercurius.CloseDialog();");
        }

        #endregion
    }

    /// <summary>
    /// 弹出框类型枚举。
    /// </summary>
    public enum AlertType
    {
        /// <summary>
        /// 警告。
        /// </summary>
        Waring = 3,

        /// <summary>
        /// 信息。
        /// </summary>
        Info = 4,

        /// <summary>
        /// 错误。
        /// </summary>
        Error = 5
    }
}
