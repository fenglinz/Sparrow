using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;

namespace Mercurius.Sparrow.Mvc.Extensions.Controls
{
    /// <summary>
    /// 自定义控件。
    /// </summary>
    public class CustomControl : FormBase
    {
        #region 字段

        private Func<PropertyMetadata, object> _formPartFunc;

        #endregion

        public CustomControl FormPart(Func<PropertyMetadata, object> formPart)
        {
            this._formPartFunc = formPart;

            return this;
        }

        public CustomControl(Screen screen, PropertyMetadata metadata) : base(screen, metadata)
        {
            this._class = string.Empty;
        }

        protected override TagBuilder CreateForm()
        {
            var container = new TagBuilder("div");
            var helperResult = new HelperResult(writer => writer.Write(this._formPartFunc(this._metadata)));

            container.InnerHtml = helperResult.ToHtmlString();

            return container;
        }
    }
}