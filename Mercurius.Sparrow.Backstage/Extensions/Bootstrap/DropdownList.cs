using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;
using Autofac;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Autofac;
using Mercurius.Sparrow.Contracts.Core;

namespace Mercurius.Sparrow.Mvc.Extensions
{
    /// <summary>
    /// 下拉框。
    /// </summary>
    public class DropdownList
    {
        #region 字段

        private static readonly IDictionaryService _dictionaryService;

        private HtmlHelper _html;

        private ModelPropertyMetadata _metadata;

        private string _dictionaryKey;

        private bool _includeAll = false;

        private object _attributes;

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static DropdownList()
        {
            using (var container = AutofacConfig.Container.BeginLifetimeScope())
            {
                _dictionaryService = container.Resolve<IDictionaryService>();
            }
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        private DropdownList()
        {
        }

        #endregion

        #region 公开方法

        internal static DropdownList Create(HtmlHelper html, ModelPropertyMetadata metadata)
        {
            return new DropdownList
            {
                _html = html,
                _metadata = metadata
            };
        }

        internal static DropdownList Create(HtmlHelper html, string name)
        {
            return new DropdownList
            {
                _html = html,
                _metadata = html.Resolve(name)
            };
        }

        public static DropdownList Create<T, P>(HtmlHelper<T> html, Expression<Func<T, P>> expression)
        {
            return new DropdownList
            {
                _html = html,
                _metadata = html.Resolve(expression)
            };
        }

        public DropdownList Datas(params string[] datas)
        {
            return this;
        }

        public DropdownList Key(string key)
        {
            this._dictionaryKey = key;

            return this;
        }

        public DropdownList IncludeAll(bool includeAll)
        {
            this._includeAll = includeAll;

            return this;
        }

        public DropdownList Attributes(object attributes)
        {
            this._attributes = attributes;

            return this;
        }

        /// <summary>
        /// 创建下拉框。
        /// </summary>
        /// <returns>下拉框HTML编码字符串</returns>
        public IHtmlString Render()
        {
            var tagBuilder = new TagBuilder("select");
            var value = Convert.ToString(this._metadata.Value);

            tagBuilder.Attributes.Add("id", this._metadata.ElementId);
            tagBuilder.Attributes.Add("name", this._metadata.FullName);
            tagBuilder.AddCssClass("form-control");
            tagBuilder.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(this._attributes), true);

            if (this._includeAll)
            {
                var allTag = new TagBuilder("option");

                allTag.SetInnerText("全部");
                allTag.Attributes.Add("value", string.Empty);

                tagBuilder.InnerHtml += allTag;
            }

            var rsp = _dictionaryService.GetCategoryItems(this._dictionaryKey);

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

                            if (value == item.Value)
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

                        if (value == item.Value)
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
    }
}