using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Mercurius.Infrastructure;

namespace Mercurius.Siskin.Contracts
{
    /// <summary>
    /// 服务执行响应信息。
    /// </summary>
    public class Response
    {
        #region 字段

        private string _errorMessage;

        #endregion

        #region 属性

        /// <summary>
        /// 获取或者设置是否成功。
        /// </summary>
        public bool IsSuccess { get; set; }

        /// <summary>
        /// 获取或者设置错误消息。
        /// </summary>
        public string ErrorMessage
        {
            get
            {
                return this._errorMessage;
            }

            set
            {
                if (this._errorMessage != value)
                {
                    this.IsSuccess = false;
                    this._errorMessage = value;
                }
            }
        }

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public Response()
        {
            this.IsSuccess = true;
        }

        #endregion

        #region 重写

        /// <summary>
        /// 重写ToString方法：自定义格式显示数据。
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            var result = string.Empty;

            result = this.IsSuccess ? "执行成功！" : $"发生异常\n异常详情：{this.ErrorMessage}";

            return result;
        }

        #endregion
    }

    /// <summary>
    /// 带有返回值的服务执行响应信息。
    /// </summary>
    /// <typeparam name="T">数据类型</typeparam>
    public class Response<T> : Response
    {
        #region 属性

        /// <summary>
        /// 获取或者设置返回的数据。
        /// </summary>
        public T Data { get; set; }

        #endregion

        #region 重写

        /// <summary>
        /// 重写ToString方法：自定义格式显示数据。
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            var result = string.Empty;

            result = this.IsSuccess ? (this.Data != null ? this.Data.ToString() : string.Empty) :
                $"执行失败\n失败详情：{this.ErrorMessage}";

            return result;
        }

        #endregion
    }

    /// <summary>
    /// 带有返回值的服务执行响应信息。
    /// </summary>
    /// <typeparam name="T">集合类型</typeparam>
    public class ResponseCollection<T> : Response
    {
        #region 属性

        /// <summary>
        /// 获取或者设置查询结果的总记录数。
        /// </summary>
        public int TotalRecords { get; set; }

        /// <summary>
        /// 获取或者设置返回的数据集合。
        /// </summary>
        public IList<T> Datas { get; set; }

        #endregion

        #region 重写

        /// <summary>
        /// 重写ToString方法：自定义格式显示数据。
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            var result = string.Empty;

            if (this.IsSuccess)
            {
                result = $"返回{this.Datas.Count}条记录！";
            }
            else
            {
                result = $"执行失败\n失败详情：{this.ErrorMessage}";
            }

            return result;
        }

        #endregion
    }

    public static class ResponseExtensions
    {
        #region 公开方法

        /// <summary>
        /// 判断是否有数据。
        /// </summary>
        /// <typeparam name="T">服务执行返回数据类型</typeparam>
        /// <param name="sources">服务执行响应信息</param>
        /// <returns>是否有数据</returns>
        public static bool HasData<T>(this ResponseCollection<T> sources)
        {
            return sources != null && !sources.Datas.IsEmpty();
        }

        /// <summary>
        /// 判断服务操作是否成功。
        /// </summary>
        /// <typeparam name="T">服务执行返回数据类型</typeparam>
        /// <param name="sources">服务执行响应信息</param>
        /// <returns>操作是否成功</returns>
        public static bool IsSuccess<T>(this ResponseCollection<T> sources)
        {
            return sources != null && sources.IsSuccess;
        }

        /// <summary>
        /// 获取错误信息。
        /// </summary>
        /// <param name="response">服务执行响应信息</param>
        /// <returns>错误信息</returns>
        public static string GetErrorMessage(this Response response)
        {
            return response == null ? "服务执行响应对象为null！" : response.ErrorMessage;
        }

        #endregion
    }
}
