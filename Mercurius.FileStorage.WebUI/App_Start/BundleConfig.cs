using System.Web;
using System.Web.Optimization;

namespace Mercurius.FileStorage.WebUI
{
    public class BundleConfig
    {
        // 有关绑定的详细信息，请访问 http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            bundles.Add(new ScriptBundle("~/bundles/ajax").Include(
                "~/Scripts/jquery.unobtrusive-ajax.js"));

            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new ScriptBundle("~/bundles/datetimepicker").Include(
                "~/Scripts/moment-with-locales.js",
                "~/Scripts/bootstrap-datetimepicker.js",
                "~/Scripts/locales/bootstrap-datepicker.zh-CN.js"));

            bundles.Add(new ScriptBundle("~/bundles/layer").Include(
                "~/Scripts/Layer/layer.js"));

            bundles.Add(new ScriptBundle("~/bundles/fileinput").Include(
                "~/Scripts/fileinput.js",
                "~/Scripts/fileinput_locale_zh.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));

            bundles.Add(new StyleBundle("~/DatetimePicker/css").Include(
                "~/Content/bootstrap-datetimepicker.css"));

            bundles.Add(new StyleBundle("~/fileinput/css").Include(
                "~/Content/bootstrap-fileinput/css/fileinput.css"));
        }
    }
}
