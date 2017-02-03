﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Autofac;
using Mercurius.Kernel.Contracts.Storage.Entities;
using Mercurius.Kernel.Contracts.Storage.Services;

namespace Mercurius.Prime.Web.Helpers
{
    /// <summary>
    /// Url帮助器。
    /// </summary>
    public static class MercuriusUrlHelper
    {
        #region 静态变量

        private static readonly IFileStorageClient _FileStorageClient;

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static MercuriusUrlHelper()
        {
            using (var context = AutofacServiceLocator.Container.BeginLifetimeScope())
            {
                _FileStorageClient = context.Resolve<IFileStorageClient>();
            }
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取文件URL。
        /// </summary>
        /// <param name="url">Url帮助器</param>
        /// <param name="filePath">文件地址</param>
        /// <param name="mode">图片压缩模式</param>
        /// <returns>文件URL</returns>
        public static string GetFileUrl(this UrlHelper url, string filePath, CompressMode mode = CompressMode.Small)
        {
            return string.IsNullOrEmpty(filePath)
                ? string.Empty
                : url.Content(_FileStorageClient.GetFile(filePath, mode));
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="filePath"></param>
        /// <param name="mode"></param>
        /// <returns></returns>
        public static string GetFileUrl(string filePath, CompressMode mode = CompressMode.Small)
        {
            return string.IsNullOrEmpty(filePath) ? string.Empty : _FileStorageClient.GetFile(filePath, mode);
        }

        #endregion
    }
}