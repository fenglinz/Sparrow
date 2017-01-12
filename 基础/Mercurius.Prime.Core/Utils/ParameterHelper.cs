using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Core.Utils
{
    /// <summary>
    /// 参数信息反射帮助类。
    /// </summary>
    public class ParameterHelper : PropertyHelper
    {
        #region 静态字段

        private static ConcurrentDictionary<Type, PropertyHelper[]> _reflectionCache = new ConcurrentDictionary<Type, PropertyHelper[]>();

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="property">属性元数据信息</param>
        public ParameterHelper(PropertyInfo property)
            : base(property)
        {
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取参数属性信息。
        /// </summary>
        /// <param name="instance">参数对象</param>
        /// <returns>属性信息帮助对象</returns>
        public static new PropertyHelper[] GetProperties(object instance)
        {
            return GetProperties(instance, CreateInstance, _reflectionCache);
        }

        #endregion

        #region 重写PropertyHelper方法

        /// <summary>
        /// 获取属性名称。
        /// </summary>
        public override string Name
        {
            get
            {
                return base.Name;
            }

            protected set
            {
                base.Name = value == null ? null : value.Replace('_', '-');
            }
        }

        #endregion

        #region 私有方法

        private static PropertyHelper CreateInstance(PropertyInfo property)
        {
            return new ParameterHelper(property);
        }

        #endregion
    }
}
