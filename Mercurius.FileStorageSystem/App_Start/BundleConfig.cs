using System.Web;
using System.Web.Optimization;

namespace Mercurius.FileStorageSystem
{
    /// <summary>
    /// js、css压缩处理。
    /// </summary>
    public class BundleConfig
    {
        /// <summary>
        /// 注册js、css压缩。
        /// </summary>
        /// <param name="bundles">压缩集合</param>
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/logon").Include(
                "~/Scripts/jquery-{version}.js",
                "~/Scripts/bootstrap.js",
                "~/Scripts/respond.js",
                "~/Scripts/Dialog/dialog.js",
                "~/Scripts/layer.js",
                "~/Scripts/mercurius.common.js"));

            bundles.Add(new ScriptBundle("~/bundles/main").Include(
                "~/Scripts/jquery-{version}.js",
                "~/Scripts/bootstrap.js",
                "~/Scripts/respond.js",
                "~/Scripts/jquery.validate*",
                "~/Scripts/jquery.unobtrusive-ajax.js",
                "~/Scripts/moment-with-locales.js",
                "~/Scripts/bootstrap-datetimepicker.js",
                "~/Scripts/locales/bootstrap-datepicker.zh-CN.js",
                "~/Scripts/Dialog/dialog.js",
                "~/Scripts/layer.js",
                "~/Scripts/mercurius.common.js"));

            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/fileinput").Include(
                "~/Scripts/bootstrap-fileinput/fileinput.js",
                "~/Scripts/bootstrap-fileinput/fileinput_locale_zh.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/bootstrap.css",
                "~/Content/ui-dialog.css",
                "~/Content/bootstrap-datetimepicker.css",
                "~/Content/layer.css",
                "~/Content/layer.moon.css",
                "~/Content/Common.css"));

            // 登录页面的CSS
            bundles.Add(new StyleBundle("~/Content/logon/css").Include(
                "~/Content/bootstrap.css",
                "~/Content/ui-dialog.css",
                "~/Content/layer.css",
                "~/Content/layer.moon.css",
                "~/Content/Common.css",
                "~/Content/LogOn.css"));

            bundles.Add(new StyleBundle("~/fileinput/css").Include(
                "~/Content/bootstrap-fileinput/css/fileinput.css"));

            BundleTable.EnableOptimizations = false;
        }
    }
}
