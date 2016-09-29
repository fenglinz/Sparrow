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
    /// 多选项的列表。
    /// </summary>
    public class MultipleList
    {
        #region 字段

        /// <summary>
        /// 字典服务业务逻辑接口。
        /// </summary>
        private static readonly IDictionaryService _dictionaryService;

        /// <summary>
        /// HTML呈现助手。
        /// </summary>
        private HtmlHelper _html;

        /// <summary>
        /// 视图模型属性的元数据信息。
        /// </summary>
        private PropertyMetadata _metadata;

        /// <summary>
        /// 字典键。
        /// </summary>
        private string _dictionaryKey;

        /// <summary>
        /// 值。
        /// </summary>
        private string _value;

        /// <summary>
        /// 是否包含[全部]选项。
        /// </summary>
        private bool _includeAll = false;

        /// <summary>
        /// 下拉框HTML属性。
        /// </summary>
        private object _attributes;

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static MultipleList()
        {
            using (var container = AutofacConfig.Container.BeginLifetimeScope())
            {
                _dictionaryService = container.Resolve<IDictionaryService>();
            }
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        private MultipleList()
        {
        }

        #endregion

        #region 静态方法

        /// <summary>
        /// 创建下拉控件。
        /// </summary>
        /// <param name="html">HTML呈现助手</param>
        /// <param name="name">名称</param>
        /// <returns>下拉框控件</returns>
        internal static MultipleList Create(HtmlHelper html, string name)
        {
            return new MultipleList
            {
                _html = html,
                _metadata = html.Resolve(name)
            };
        }

        /// <summary>
        /// 创建下拉框控件。
        /// </summary>
        /// <param name="html">HTML呈现助手</param>
        /// <param name="metadata">属性元数据信息</param>
        /// <returns>下拉框控件</returns>
        internal static MultipleList Create(HtmlHelper html, PropertyMetadata metadata)
        {
            return new MultipleList
            {
                _html = html,
                _metadata = metadata
            };
        }

        /// <summary>
        /// 创建下拉框。
        /// </summary>
        /// <typeparam name="T">视图模型类型</typeparam>
        /// <typeparam name="P">属性类型</typeparam>
        /// <param name="html">HTML呈现助手</param>
        /// <param name="expression">属性选择Lambda表达式</param>
        /// <returns>下拉框控件</returns>
        internal static MultipleList Create<T, P>(HtmlHelper<T> html, Expression<Func<T, P>> expression)
        {
            return new MultipleList
            {
                _html = html,
                _metadata = html.Resolve(expression)
            };
        }

        #endregion

        #region 设置基本信息

        /// <summary>
        /// 添加下拉框数据项。
        /// </summary>
        /// <param name="datas">数据项</param>
        /// <returns>下拉框控件</returns>
        public MultipleList Datas(params string[] datas)
        {
            return this;
        }

        /// <summary>
        /// 设置下拉框数据的字典键。
        /// </summary>
        /// <param name="key">字典键</param>
        /// <returns>下拉框控件</returns>
        public MultipleList Key(string key)
        {
            this._dictionaryKey = key;

            return this;
        }


        public MultipleList Value(string value)
        {
            this._value = value;

            return this;
        }

        /// <summary>
        /// 下拉框中是否包含[全部]选项。
        /// </summary>
        /// <param name="includeAll">是否包含[全部]选项</param>
        /// <returns>下拉框控件</returns>
        public MultipleList IncludeAll(bool includeAll)
        {
            this._includeAll = includeAll;

            return this;
        }

        /// <summary>
        /// 设置下拉框的HTML属性。
        /// </summary>
        /// <param name="attributes">HTML属性</param>
        /// <returns>下拉框对象</returns>
        public MultipleList Attributes(object attributes)
        {
            this._attributes = attributes;

            return this;
        }

        #endregion

        #region HTML呈现

        public IHtmlString CheckBoxs()
        {


            return null;
        }

        /// <summary>
        /// 创建下拉框。
        /// </summary>
        /// <returns>下拉框HTML编码字符串</returns>
        public IHtmlString DropdownList()
        {
            var tagBuilder = new TagBuilder("select");
            var value = string.IsNullOrWhiteSpace(this._value) ? Convert.ToString(this._metadata.Value) : this._value;

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