﻿using System.Web;
using System.Web.Optimization;

namespace Mercurius.Sparrow.Backstage
{
    /// <summary>
    /// JS/CSS压缩处理。
    /// </summary>
    public class BundleConfig
    {
        /// <summary>
        /// JS/CSS压缩处理。
        /// </summary>
        /// <param name="bundles"></param>
        public static void RegisterBundles(BundleCollection bundles)
        {
            // 主框架js.
            bundles.Add(new ScriptBundle("~/bundles/main").Include(
                "~/Scripts/jquery-{version}.js",
                "~/Scripts/jquery.unobtrusive-ajax.js",
                "~/Scripts/bootstrap.js",
                "~/Scripts/ace-elements.js",
                "~/Scripts/ace.js",
                "~/Scripts/MessageBox/msgbox.js",
                "~/Scripts/jquery.pullbox.js",
                "~/Scripts/Dialog/dialog-plus.js",
                "~/Scripts/Layer/layer.js",
                "~/Scripts/mercurius.common.js",
                "~/Scripts/Main.js"));

            // 工作界面公共JS。
            bundles.Add(new ScriptBundle("~/bundles/common").Include(
                "~/Scripts/jquery-{version}.js",
                "~/Scripts/sea.js",
                "~/Scripts/jquery.unobtrusive-ajax.js",
                "~/Scripts/bootstrap.js",
                "~/Scripts/moment-with-locales.js",
                "~/Scripts/bootstrap-datetimepicker.js",
                "~/Scripts/locales/bootstrap-datepicker.zh-CN.js",
                "~/Scripts/Dialog/dialog.js",
                "~/Scripts/Layer/layer.js",
                "~/Scripts/mercurius.common.js"));

            // 验证JS。
            bundles.Add(new ScriptBundle("~/bundles/validate").Include(
                        "~/Scripts/Validator/JValidator.js"));

            // 树形表格JS。
            bundles.Add(new ScriptBundle("~/bundles/treetable").Include("~/Scripts/TreeTable/jquery.treeTable.js"));

            // 树形视图JS。
            bundles.Add(new ScriptBundle("~/bundles/tree").Include("~/Scripts/jquery.treeview.js"));

            // Modernizr JS。
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include("~/Scripts/modernizr-*"));

            // highchart JS
            bundles.Add(new ScriptBundle("~/bundles/chart").Include(
                "~/Scripts/Highcharts-4.0.3/js/highcharts.js",
                "~/Scripts/Highcharts-4.0.3/js/themes/dark-blue.js"));

			// 文件上传
			bundles.Add(new ScriptBundle("~/bundles/upload").Include(
                "~/Scripts/Bootstrap-FileInput/fileinput.js",
                "~/Scripts/Bootstrap-FileInput/fileinput_locale_zh.js"
                ));

            // 公共CSS。
            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/bootstrap.css",
                "~/Content/bootstrap-theme.css",
                "~/Content/bootstrap-datetimepicker.css",
                "~/Content/font-awesome.css",
                "~/Content/ui-dialog.css",
                "~/Content/Common.css"));

            // 树形表格CSS。
            bundles.Add(new StyleBundle("~/Content/treetable/css").Include(
                "~/Content/TreeTable/jquery.treeTable.css",
                "~/Content/TreeTable/jquery.treetable.theme.default.css",
                "~/Content/TreeTable/custom.css"));

            // 树形视图CSS。
            bundles.Add(new StyleBundle("~/Content/tree/css").Include("~/Content/Tree/jquery.treeview.css"));

            // 登录页面的CSS。
            bundles.Add(new StyleBundle("~/Content/logon/css").Include("~/Content/LogOn/LogOn.css"));

            // 主页面CSS。
            bundles.Add(new StyleBundle("~/Content/main/css").Include(
                "~/Content/bootstrap.css",
                "~/Content/font-awesome.css",
                "~/Content/ace-fonts.css",
                "~/Content/ace.css",
                "~/Content/ace-skins.css",
                "~/Content/ui-dialog.css",
                "~/Content/MessageBox/msgbox.css",
				"~/Content/Common.css"));

			// 文件上传css
			bundles.Add(new StyleBundle("~/Content/upload/css").Include(
                "~/Content/bootstrap-fileinput/css/fileinput.css"
                ));

            //BundleTable.EnableOptimizations = true;
        }
    }
}