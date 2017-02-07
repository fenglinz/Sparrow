using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Infrastructure
{
    /// <summary>
    /// 属性反射帮助类。
    /// </summary>
    public class PropertyHelper
    {
        #region 静态字段

        private static readonly MethodInfo CallPropertyGetterOpenGenericMethod = typeof(PropertyHelper).GetMethod("CallPropertyGetter", BindingFlags.NonPublic | BindingFlags.Static);
        private static readonly MethodInfo CallPropertySetterOpenGenericMethod = typeof(PropertyHelper).GetMethod("CallPropertySetter", BindingFlags.NonPublic | BindingFlags.Static);
        private static readonly MethodInfo CallPropertyGetterByReferenceOpenGenericMethod = typeof(PropertyHelper).GetMethod("CallPropertyGetterByReference", BindingFlags.NonPublic | BindingFlags.Static);

        private static ConcurrentDictionary<Type, PropertyHelper[]> _reflectionCache = new ConcurrentDictionary<Type, PropertyHelper[]>();

        #endregion

        #region 字段

        private Func<object, object> _valueGetter;

        #endregion

        #region 委托

        // Implementation of the fast getter.
        private delegate TValue ByRefFunc<TDeclaringType, out TValue>(ref TDeclaringType arg);

        #endregion

        #region 属性

        public virtual string Name { get; protected set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="property">属性元数据信息</param>
        public PropertyHelper(PropertyInfo property)
        {
            Contract.Assert(property != null);

            this.Name = property.Name;
            this._valueGetter = MakeFastPropertyGetter(property);
        }

        #endregion

        #region 静态公开方法

        /// <summary>
        /// Creates a single fast property getter. The result is not cached.
        /// </summary>
        /// <param name="propertyInfo">propertyInfo to extract the getter for.</param>
        /// <returns>a fast getter.</returns>
        /// <remarks>This method is more memory efficient than a dynamically compiled lambda, and about the same speed.</remarks>
        public static Func<object, object> MakeFastPropertyGetter(PropertyInfo propertyInfo)
        {
            Contract.Assert(propertyInfo != null);

            var getMethod = propertyInfo.GetGetMethod();

            Contract.Assert(getMethod != null);
            Contract.Assert(!getMethod.IsStatic);
            Contract.Assert(getMethod.GetParameters().Length == 0);

            // Instance methods in the CLR can be turned into static methods where the first parameter
            // is open over "this". This parameter is always passed by reference, so we have a code
            // path for value types and a code path for reference types.
            var typeInput = getMethod.ReflectedType;
            var typeOutput = getMethod.ReturnType;

            Delegate callPropertyGetterDelegate;
            if (typeInput.IsValueType)
            {
                // Create a delegate (ref TDeclaringType) -> TValue
                var propertyGetterAsFunc = getMethod.CreateDelegate(typeof(ByRefFunc<,>).MakeGenericType(typeInput, typeOutput));
                var callPropertyGetterClosedGenericMethod = CallPropertyGetterByReferenceOpenGenericMethod.MakeGenericMethod(typeInput, typeOutput);

                callPropertyGetterDelegate = Delegate.CreateDelegate(typeof(Func<object, object>), propertyGetterAsFunc, callPropertyGetterClosedGenericMethod);
            }
            else
            {
                // Create a delegate TDeclaringType -> TValue
                var propertyGetterAsFunc = getMethod.CreateDelegate(typeof(Func<,>).MakeGenericType(typeInput, typeOutput));
                var callPropertyGetterClosedGenericMethod = CallPropertyGetterOpenGenericMethod.MakeGenericMethod(typeInput, typeOutput);

                callPropertyGetterDelegate = Delegate.CreateDelegate(typeof(Func<object, object>), propertyGetterAsFunc, callPropertyGetterClosedGenericMethod);
            }

            return (Func<object, object>)callPropertyGetterDelegate;
        }

        /// <summary>
        /// Creates a single fast property setter. The result is not cached.
        /// </summary>
        /// <param name="propertyInfo">propertyInfo to extract the getter for.</param>
        /// <returns>a fast setter.</returns>
        /// <remarks>This method is more memory efficient than a dynamically compiled lambda, and about the same speed.</remarks>
        public static Action<TDeclaringType, object> MakeFastPropertySetter<TDeclaringType>(PropertyInfo propertyInfo)
            where TDeclaringType : class
        {
            Contract.Assert(propertyInfo != null);

            var setMethod = propertyInfo.GetSetMethod();

            Contract.Assert(setMethod != null);
            Contract.Assert(!setMethod.IsStatic);
            Contract.Assert(setMethod.GetParameters().Length == 1);
            Contract.Assert(!propertyInfo.ReflectedType.IsValueType);

            // Instance methods in the CLR can be turned into static methods where the first parameter
            // is open over "this". This parameter is always passed by reference, so we have a code
            // path for value types and a code path for reference types.
            var typeInput = propertyInfo.ReflectedType;
            var typeValue = setMethod.GetParameters()[0].ParameterType;

            // Create a delegate TValue -> "TDeclaringType.Property"
            var propertySetterAsAction = setMethod.CreateDelegate(typeof(Action<,>).MakeGenericType(typeInput, typeValue));
            var callPropertySetterClosedGenericMethod = CallPropertySetterOpenGenericMethod.MakeGenericMethod(typeInput, typeValue);
            var callPropertySetterDelegate = Delegate.CreateDelegate(typeof(Action<TDeclaringType, object>), propertySetterAsAction, callPropertySetterClosedGenericMethod);

            return (Action<TDeclaringType, object>)callPropertySetterDelegate;
        }

        /// <summary>
        /// Creates and caches fast property helpers that expose getters for every public get property on the underlying type.
        /// </summary>
        /// <param name="instance">the instance to extract property accessors for.</param>
        /// <returns>a cached array of all public property getters from the underlying type of this instance.</returns>
        public static PropertyHelper[] GetProperties(object instance)
        {
            return GetProperties(instance, CreateInstance, _reflectionCache);
        }

        #endregion

        #region 公开方法

        public object GetValue(object instance)
        {
            Contract.Assert(this._valueGetter != null, "Must call Initialize before using this object");

            return this._valueGetter(instance);
        }

        #endregion

        #region 受保护方法

        protected static PropertyHelper[] GetProperties(
            object instance,
            Func<PropertyInfo, PropertyHelper> createPropertyHelper,
            ConcurrentDictionary<Type, PropertyHelper[]> cache)
        {
            // Using an array rather than IEnumerable, as this will be called on the hot path numerous times.
            PropertyHelper[] helpers;

            Type type = instance.GetType();

            if (!cache.TryGetValue(type, out helpers))
            {
                // We avoid loading indexed properties using the where statement.
                // Indexed properties are not useful (or valid) for grabbing properties off an anonymous object.
                var properties = type.GetProperties(BindingFlags.Public | BindingFlags.Instance)
                                     .Where(prop => prop.GetIndexParameters().Length == 0 && prop.GetMethod != null);

                var newHelpers = new List<PropertyHelper>();

                foreach (var property in properties)
                {
                    var propertyHelper = createPropertyHelper(property);

                    newHelpers.Add(propertyHelper);
                }

                helpers = newHelpers.ToArray();
                cache.TryAdd(type, helpers);
            }

            return helpers;
        }

        #endregion

        #region 私有方法

        private static PropertyHelper CreateInstance(PropertyInfo property)
        {
            return new PropertyHelper(property);
        }

        private static object CallPropertyGetter<TDeclaringType, TValue>(Func<TDeclaringType, TValue> getter, object @this)
        {
            return getter((TDeclaringType)@this);
        }

        private static object CallPropertyGetterByReference<TDeclaringType, TValue>(ByRefFunc<TDeclaringType, TValue> getter, object @this)
        {
            var unboxed = (TDeclaringType)@this;

            return getter(ref unboxed);
        }

        private static void CallPropertySetter<TDeclaringType, TValue>(Action<TDeclaringType, TValue> setter, object @this, object value)
        {
            setter((TDeclaringType)@this, (TValue)value);
        }

        #endregion
    }
}
