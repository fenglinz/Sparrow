using System.Collections.Specialized;
using Mercurius.Prime.Core.Entity;
using Microsoft.Practices.EnterpriseLibrary.Validation;

namespace Mercurius.Prime.Core
{
    /// <summary>
    /// 实体信息扩展。
    /// </summary>
    public static class EntityExtensions
    {
        /// <summary>
        /// 输入验证。
        /// </summary>
        /// <param name="target">需要验证的数据</param>
        /// <returns>是否通过验证</returns>
        private static ValidationResults Validate(this object target)
        {
            if (target == null)
            {
                return null;
            }

            var validator = ValidationFactory.CreateValidator(target.GetType());

            return validator.Validate(target);
        }
    }
}
