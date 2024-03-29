﻿using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Mercurius.Kernel.Contracts.Core.Entities;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Ado;

namespace Mercurius.Sparrow.Backstage.Areas.Dynamic.Models.Configuration
{
    /// <summary>
    /// 添加或编辑动态页面配置模型。
    /// </summary>
    public class CreateOrUpdateConfigModel
    {
        #region 字段

        private IList<Dictionary> _dictionaries;

        #endregion

        #region 属性

        /// <summary>
        /// 表信息。
        /// </summary>
        public Table Table { get; set; }

        /// <summary>
        /// 表的所有列信息。
        /// </summary>
        public IEnumerable<CreateOrUpdateColumn> Columns { get; set; }

        /// <summary>
        /// 字典信息。
        /// </summary>
        public IList<Dictionary> Dictionaries
        {
            get { return this._dictionaries; }
            set
            {
                if (this._dictionaries != value)
                {
                    value.ForEach(d => d.Value = d.Key);

                    this._dictionaries = value;
                }
            }
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取字典分类信息下拉框数据源。
        /// </summary>
        /// <param name="selectedValue">选定的值</param>
        /// <returns>下拉框数据源</returns>
        public IList<SelectListItem> GetDictionaryList(string selectedValue = null)
        {
            var items = new List<SelectListItem>();

            if (!this.Dictionaries.IsEmpty())
            {
                items.Add(new SelectListItem
                {
                    Text = "无",
                    Value = string.Empty
                });

                items.AddRange(this.Dictionaries.Select(item => new SelectListItem
                {
                    Text = item.Key,
                    Value = item.Key,
                    Selected = item.Key == selectedValue
                }));
            }

            return items;
        }

        #endregion
    }
}