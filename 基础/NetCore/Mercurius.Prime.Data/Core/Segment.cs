using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Data
{
    /// <summary>
    /// sql片段类型。
    /// </summary>
    internal class Segment
    {
        #region 属性

        /// <summary>
        /// 字段前缀
        /// </summary>
        internal string Prefix { get; set; }

        /// <summary>
        /// 字段名称
        /// </summary>
        public string Column { get; set; }

        /// <summary>
        /// 查询参数名称(Compare为None时无效)
        /// </summary>
        public string Parameter { get; set; }

        /// <summary>
        /// 比较类型
        /// </summary>
        public CompareType Compare { get; set; }

        /// <summary>
        /// sql表达式(Compare值为None时有效)
        /// </summary>
        public string SqlExpression { get; set; }

        /// <summary>
        /// 是否有效回调函数.
        /// </summary>
        public Func<bool> EffectiveFunc { get; set; }

        /// <summary>
        /// 连接方式
        /// </summary>
        public ConcatType Concat { get; set; } = ConcatType.And;

        /// <summary>
        /// 片段组
        /// </summary>
        public ComplexesSegment Complexes { get; set; }

        #endregion
    }

    /// <summary>
    /// 复合条件SQL片段类型
    /// </summary>
    internal class ComplexesSegment : IEnumerable<Segment>
    {
        #region 字段

        private IList<Segment> _items = new List<Segment>();

        #endregion

        #region IEnumerable<Segment>接口实现

        public IEnumerator<Segment> GetEnumerator()
        {
            foreach (var item in this._items)
            {
                yield return item;
            }
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            foreach (var item in this._items)
            {
                yield return item;
            }
        }

        #endregion

        #region 公开方法

        public ComplexesSegment Add(params Segment[] segments)
        {
            foreach (var item in segments)
            {
                this._items.Add(item);
            }

            return this;
        }

        #endregion
    }
}
