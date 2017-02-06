using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Autofac;
using Mercurius.Kernel.Contracts.Storage.Entities;
using Mercurius.Kernel.Implementations.Storage.WebApi;
using Mercurius.Sparrow.Autofac;
using static Mercurius.Sparrow.Backstage.Constants;

namespace Mercurius.Sparrow.Backstage
{
    /// <summary>
    /// Url帮助器。
    /// </summary>
    public static class MercuriusUrlHelper
    {
        #region 公开方法

        /// <summary>
        /// 判断是否拥有控制台管理权限。
        /// </summary>
        /// <param name="request">Http请求对象</param>
        /// <returns>是否拥有权限</returns>
        public static bool HasConsoleRight(this HttpRequestBase request)
        {
            var token = request.Cookies[ConsoleManagerToken]?.Value;

            if (string.IsNullOrWhiteSpace(token))
            {
                return false;
            }

            if (!System.IO.File.Exists(ConsoleManagerStoragePath))
            {
                return false;
            }

            using (var reader = new StreamReader(ConsoleManagerStoragePath))
            {
                var accountToken = reader.ReadLine();

                return accountToken == token;
            }
        }

        #endregion
    }
}