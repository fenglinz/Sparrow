using System.Collections.Specialized;
using Microsoft.Practices.EnterpriseLibrary.Validation;

namespace Mercurius.Sparrow.Entities
{
    /// <summary>
    /// 实体信息扩展。
    /// </summary>
    public static class DomainExtensions
    {
        /// <summary>
        /// 对象是否通过有效性验证。
        /// </summary>
        /// <param name="domain">实体对象</param>
        /// <returns>是否通过有效性验证</returns>
        public static bool IsValid(this Domain domain)
        {
            var validationResults = domain.Validate();

            if (validationResults == null)
            {
                return false;
            }

            return validationResults.IsValid;
        }

        /// <summary>
        /// 获取实体有效性验证的错误信息。
        /// </summary>
        /// <param name="domain">实体对象</param>
        /// <returns>错误信息集合</returns>
        public static NameValueCollection GetErrorMessage(this Domain domain)
        {
            var validationResults = domain.Validate();

            if (validationResults == null || validationResults.IsValid)
            {
                return null;
            }

            var result = new NameValueCollection();

            foreach (var item in validationResults)
            {
                result.Add(item.Key, item.Message);
            }

            return result;
        }

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
