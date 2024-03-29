﻿using System;
using System.Collections.Generic;
using System.Linq;
using Mercurius.Prime.Core;

namespace Mercurius.Prime.Data.Service
{
    /// <summary>
    /// 服务执行响应信息。
    /// </summary>
    public class Response
    {
        #region Fields

        private string _errorMessage;

        #endregion

        #region Properties

        /// <summary>
        /// 返回时间
        /// </summary>
        public DateTime At { get; set; } = DateTime.Now;

        /// <summary>
        /// 是否成功。
        /// </summary>
        public bool IsSuccess { get; set; }

        /// <summary>
        /// 错误消息。
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
                    this._errorMessage = value;
                    this.IsSuccess = value.IsEmpty();
                }
            }
        }

        #endregion

        #region Constructor

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public Response()
        {
            this.IsSuccess = true;
        }

        #endregion

        #region Overrides

        /// <summary>
        /// 重写ToString方法：自定义格式显示数据。
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            return this.IsSuccess ? "执行成功！" : $"发生异常\n异常详情：{this.ErrorMessage}";
        }

        #endregion
    }

    /// <summary>
    /// 带有返回值的服务执行响应信息。
    /// </summary>
    /// <typeparam name="T">数据类型</typeparam>
    public class Response<T> : Response
    {
        #region Properties

        /// <summary>
        /// 返回的数据。
        /// </summary>
        public T Data { get; set; }

        #endregion

        #region Overrides

        /// <summary>
        /// 重写ToString方法：自定义格式显示数据。
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            return this.IsSuccess ? (this.Data != null ? this.Data.ToString() : string.Empty) : $"执行失败\n失败详情：{this.ErrorMessage}";
        }

        #endregion
    }

    /// <summary>
    /// 带有返回值的服务执行响应信息。
    /// </summary>
    /// <typeparam name="T">集合类型</typeparam>
    public class ResponseSet<T> : Response
    {
        #region Properties

        /// <summary>
        /// 查询结果的总记录数。
        /// </summary>
        public int TotalRecords { get; set; }

        /// <summary>
        /// 返回的数据集合。
        /// </summary>
        public IEnumerable<T> Datas { get; set; }

        #endregion

        #region Overrides

        /// <summary>
        /// 重写ToString方法：自定义格式显示数据。
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            return this.IsSuccess ? $"返回{this.Datas.Count()}条记录！" : $"执行失败\n失败详情：{this.ErrorMessage}";
        }

        #endregion
    }
}
