using System;
using Mercurius.Prime.Core;

namespace Mercurius.Prime.Data.Service
{
    /// <summary>
    /// 返回信息扩展方法。
    /// </summary>
    public static class ResponseExtensions
    {
        #region 公开方法

        /// <summary>
        /// 将分页数据转换为集合响应信息
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="pagedList"></param>
        /// <returns></returns>
        public static ResponseSet<TResponse> AsResponseSet<TEntity, TResponse>(this PagedList<TEntity> pagedList)
        {
            return pagedList == null ? null : new ResponseSet<TResponse>
            {
                At = DateTime.Now,
                Datas = pagedList.Datas.As<TEntity, TResponse>(),
                TotalRecords = pagedList.TotalRecords
            };
        }

        /// <summary>
        /// 判断是否有数据。
        /// </summary>
        /// <typeparam name="T">服务执行返回数据类型</typeparam>
        /// <param name="sources">服务执行响应信息</param>
        /// <returns>是否有数据</returns>
        public static bool HasData<T>(this ResponseSet<T> sources)
        {
            return sources != null && !sources.Datas.IsEmpty();
        }

        /// <summary>
        /// 判断服务操作是否有错误。
        /// </summary>
        /// <typeparam name="T">服务执行返回数据类型</typeparam>
        /// <param name="sources">服务执行响应信息</param>
        /// <returns>是否有错误</returns>
        public static bool HasError<T>(this ResponseSet<T> sources)
        {
            return sources != null && !sources.IsSuccess;
        }

        /// <summary>
        /// 获取错误信息。
        /// </summary>
        /// <param name="response">服务执行响应信息</param>
        /// <returns>错误信息</returns>
        public static string GetErrorMessage(this Response response)
        {
            return response == null ? string.Empty : response.ErrorMessage;
        }

        #endregion
    }
}
