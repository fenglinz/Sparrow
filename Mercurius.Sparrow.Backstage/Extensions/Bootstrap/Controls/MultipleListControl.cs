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

namespace Mercurius.Sparrow.Mvc.Extensions.Controls
{
    /// <summary>
    /// 多选项的列表。
    /// </summary>
    public class MultipleListControl : FormBase
    {
        #region 字段

        /// <summary>
        /// 字典服务业务逻辑接口。
        /// </summary>
        private static readonly IDictionaryService _dictionaryService;

        /// <summary>
        /// 字典键。
        /// </summary>
        private string _dictionaryKey;

        /// <summary>
        /// 值。
        /// </summary>
        private string _value;

        private IList<TextValue> _items;

        /// <summary>
        /// 是否包含[全部]选项。
        /// </summary>
        private bool _includeAll = false;

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static MultipleListControl()
        {
            using (var container = AutofacConfig.Container.BeginLifetimeScope())
            {
                _dictionaryService = container.Resolve<IDictionaryService>();
            }
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        public MultipleListControl(Screen screen, PropertyMetadata metadata) : base(screen, metadata)
        {
        }

        #endregion

        #region 设置基本信息

        /// <summary>
        /// 添加下拉框数据项。
        /// </summary>
        /// <param name="datas">数据项</param>
        /// <returns>下拉框控件</returns>
        public MultipleListControl Datas(params string[] datas)
        {
            this._items = new List<TextValue>();

            foreach (var data in datas)
            {
                this._items.Add(new TextValue(data));
            }

            return this;
        }

        /// <summary>
        /// 设置下拉框数据的字典键。
        /// </summary>
        /// <param name="key">字典键</param>
        /// <returns>下拉框控件</returns>
        public MultipleListControl Key(string key)
        {
            this._dictionaryKey = key;

            return this;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public MultipleListControl Value(string value)
        {
            this._value = value;

            return this;
        }

        /// <summary>
        /// 下拉框中是否包含[全部]选项。
        /// </summary>
        /// <param name="includeAll">是否包含[全部]选项</param>
        /// <returns>下拉框控件</returns>
        public MultipleListControl IncludeAll(bool includeAll)
        {
            this._includeAll = includeAll;

            return this;
        }

        #endregion

        /// <summary>
        /// 创建下拉框。
        /// </summary>
        /// <returns>下拉框HTML编码字符串</returns>
        protected override TagBuilder CreateForm()
        {
            var tagBuilder = new TagBuilder("select");
            var value = string.IsNullOrWhiteSpace(this._value) ? Convert.ToString(this._metadata.Value) : this._value;

            tagBuilder.Attributes.Add("id", this._metadata.ElementId);
            tagBuilder.Attributes.Add("name", this._metadata.FullName);

            if (this._includeAll)
            {
                var allTag = new TagBuilder("option");

                allTag.SetInnerText("全部");
                allTag.Attributes.Add("value", string.Empty);

                tagBuilder.InnerHtml += allTag;
            }

            if (this._items.IsEmpty())
            {
                var rsp = _dictionaryService.GetCategoryItems(this._dictionaryKey);

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
            else
            {
                foreach (var item in this._items)
                {
                    var optionTag = new TagBuilder("option");

                    optionTag.SetInnerText(item.Text);
                    optionTag.Attributes.Add("value", item.Value);

                    if (value == item.Value)
                    {
                        optionTag.Attributes.Add("selected", "selected");
                    }

                    tagBuilder.InnerHtml += optionTag;
                }
            }

            return tagBuilder;
        }
    }
}