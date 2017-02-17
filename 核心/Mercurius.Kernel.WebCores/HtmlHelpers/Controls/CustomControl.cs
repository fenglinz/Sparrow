using System;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;

namespace Mercurius.Kernel.WebCores.HtmlHelpers.Controls
{
    /// <summary>
    /// 自定义表单控件。
    /// </summary>
    public class CustomControl : FormBase
    {
        #region 字段

        /// <summary>
        /// 自定义区域设置回调函数。
        /// </summary>
        private Func<PropertyMetadata, object> _formPartFunc;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="screen">屏幕枚举</param>
        /// <param name="metadata">视图模型的属性元数据信息</param>
        public CustomControl(Screen screen, PropertyMetadata metadata) : base(screen, metadata)
        {
            this.Class = string.Empty;
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 设置自定义表单区域。
        /// </summary>
        /// <param name="formPart">表单区域设置回调函数</param>
        /// <returns>自定义表单控件</returns>
        public CustomControl FormPart(Func<PropertyMetadata, object> formPart)
        {
            this._formPartFunc = formPart;

            return this;
        }

        #endregion

        #region 重写基类方法

        /// <summary>
        /// 控件呈现。
        /// </summary>
        /// <returns>Html片段</returns>
        public override IHtmlString Render()
        {
            var container = new TagBuilder("div");
            var label = this.CreateLabel();
            var form = this.CreateForm();

            container.InnerHtml += label;

            if (this.FormCols > 0)
            {
                var formContainer = new TagBuilder("div");

                formContainer.AddCssClass($"col-sm-{this.FormCols}");

                formContainer.InnerHtml += form.InnerHtml;
                container.InnerHtml += formContainer;
            }
            else
            {
                container.InnerHtml += form.InnerHtml;
            }

            return new MvcHtmlString(container.InnerHtml);
        }

        /// <summary>
        /// 创建表单。
        /// </summary>
        /// <returns>表单信息</returns>
        protected override TagBuilder CreateForm()
        {
            var container = new TagBuilder("div");
            var helperResult = new HelperResult(writer => writer.Write(this._formPartFunc(this._metadata)));

            container.InnerHtml = helperResult.ToHtmlString();

            return container;
        }

        #endregion
    }
}