using System;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;
using Mercurius.Prime.Core.Ado;

namespace Mercurius.Prime.Core.Entities
{
    /// <summary>
    /// 领域信息基类。
    /// </summary>
    [Serializable]
    public abstract class Entity
    {
        #region 属性

        /// <summary>
        /// 行号。
        /// </summary>
        [Column(IsIgnore = true)]
        public virtual int RowIndex { get; set; }

        #endregion
    }
}
