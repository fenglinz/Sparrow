using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.WebPages;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.AspNetCore.Razor.TagHelpers;

namespace Mercurius.Sparrow.Backstage.TagHelpers
{
    /// <summary>
    /// 基于Bootstrap的标签助手。
    /// </summary>
    [HtmlTargetElement("form-group")]
    public class FormGroupTagHelper : BootstrapTagHelperBase
    {
        #region 属性

        /// <summary>
        /// 附加属性。
        /// </summary>
        public string AddOn { get; set; }

        #endregion

        #region 重写基类方法

        /// <summary>
        /// 构建标签。
        /// </summary>
        /// <param name="context">标签应用上下文</param>
        /// <param name="output">标签输出对象</param>
        public override void Process(TagHelperContext context, TagHelperOutput output)
        {
            if (!string.IsNullOrWhiteSpace(this.Layout))
            {
                var items = this.Layout.Replace('，', ',').Split(',');

                this._labelCols = items[0].AsInt();
                this._formCols = items[1].AsInt();
            }

            output.TagName = "div";
            output.TagMode = TagMode.StartTagAndEndTag;

            if (!output.Attributes.ContainsName("class"))
            {
                output.Attributes.Add("class", "form-group");
            }

            var content = $"<label class=\"control-label col-sm-{this._labelCols}\" for=\"{this.GetElementId()}\">{this.GetLabelContent()}</label>";

            content += $"<div class=\"col-sm-{this._formCols}\">";

            var form = $"<input type=\"text\" id=\"{this.GetElementId()}\" name=\"{this.GetElementName()}\" value=\"{this.GetValue(output.Attributes["format"]?.Value?.ToString())}\" class=\"form-control\" />";

            if (!string.IsNullOrWhiteSpace(this.AddOn))
            {
                content += "<div class=\"input-group\">";
                content += form;
                content += $"<span class=\"input-group-addon\">{this.AddOn}</span></div>";
            }
            else
            {
                content += form;
            }

            content += "</div>";

            output.Content.SetHtmlContent(content);
        }

        #endregion
    }
}
