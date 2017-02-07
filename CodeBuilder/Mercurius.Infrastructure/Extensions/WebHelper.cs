using System;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Web;
using System.Web.Security;

namespace Mercurius.Infrastructure
{
    /// <summary>
    /// Web应用程序帮助类。
    /// </summary>
    public static class WebHelper
    {
        #region 公开方法

        /// <summary>
        /// 判断给定的IP地址是否为内网IP。
        /// </summary>
        /// <param name="ipAddress">IP地址</param>
        /// <returns>是否为内网IP</returns>
        public static bool IsInnerIPAddress(this string ipAddress)
        {
            ipAddress = ipAddress == "::1" ? "127.0.0.1" : ipAddress;

            var ipNumber = ipAddress.AsNumber();

            // 私有IP：
            // A类:10.0.0.0-10.255.255.255
            // B类:172.16.0.0-172.31.255.255 
            // C类:192.168.0.0-192.168.255.255   
            // 当然，还有127这个网段是环回地址
            var aBegin = AsNumber("10.0.0.0");
            var aEnd = AsNumber("10.255.255.255");
            var bBegin = AsNumber("172.16.0.0");
            var bEnd = AsNumber("172.31.255.255");
            var cBegin = AsNumber("192.168.0.0");
            var cEnd = AsNumber("192.168.255.255");

            return InRange(ipNumber, aBegin, aEnd) ||
                InRange(ipNumber, bBegin, bEnd) ||
                InRange(ipNumber, cBegin, cEnd) ||
                ipAddress.Equals("127.0.0.1");
        }

        /// <summary>
        /// 获取当前Http请求的Url。
        /// </summary>
        /// <param name="request">Http请求对象</param>
        /// <returns>Http请求的Url</returns>
        public static string GetCurrentNavigateUrl(this HttpRequestBase request)
        {
            var result = string.Empty;
            var area = string.Empty;
            var routeData = request.RequestContext.RouteData;
            var controllerName = routeData.Values["controller"];
            var actionName = routeData.Values["action"];

            if (routeData.DataTokens.ContainsKey("area"))
            {
                area = Convert.ToString(routeData.DataTokens["area"]);
            }

            result = string.IsNullOrWhiteSpace(area) ? $"/{controllerName}/{actionName}" : $"/{area}/{controllerName}/{actionName}";

            return result;
        }

        /// <summary>
        /// 获取客户端的IP地址。
        /// </summary>
        /// <returns>客户端IP地址</returns>
        public static string GetClientIPAddress()
        {
            string result;

            if (HttpContext.Current != null)
            {
                var request = HttpContext.Current.Request;

                // 获取真实IP地址(如使用代理，则获取到真正的IP地址；否则，获取的IP地址为空)。
                result = request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                result = string.IsNullOrWhiteSpace(result) ? request.ServerVariables["REMOTE_ADDR"] : request.UserHostAddress;

                result = string.IsNullOrWhiteSpace(result) ? "127.0.0.1" : result;
            }
            else
            {
                var ip = Dns.GetHostEntry(Dns.GetHostName()).AddressList.FirstOrDefault(a => a.AddressFamily == AddressFamily.InterNetwork);

                result = ip != null ? ip.ToString() : string.Empty;
            }

            return result;
        }

        /// <summary>
        /// 获取登录用户Id。
        /// </summary>
        /// <returns>登录用户Id</returns>
        public static string GetLogOnUserId()
        {
            if (HttpContext.Current == null)
            {
                return null;
            }

            if (HttpContext.Current.User == null || HttpContext.Current.User.Identity == null)
            {
                return null;
            }

            var identity = HttpContext.Current.User.Identity;

            return identity.IsAuthenticated ? identity.Name.Split(',').FirstOrDefault() : null;
        }

        /// <summary>
        /// 获取登录账户。
        /// </summary>
        /// <returns>登录账户</returns>
        public static string GetLogOnAccount()
        {
            if (HttpContext.Current == null)
            {
                return null;
            }

            if (HttpContext.Current.User == null || HttpContext.Current.User.Identity == null)
            {
                return null;
            }

            var identity = HttpContext.Current.User.Identity;

            return identity.IsAuthenticated ? identity.Name.Split(',')[1] : null;
        }

        /// <summary>
        /// 获取登录名称。
        /// </summary>
        /// <returns>登录名称</returns>
        public static string GetLogOnName()
        {
            if (HttpContext.Current == null)
            {
                return null;
            }

            if (HttpContext.Current.User == null || HttpContext.Current.User.Identity == null)
            {
                return null;
            }

            var identity = HttpContext.Current.User.Identity;

            return identity.IsAuthenticated ? identity.Name.Split(',').LastOrDefault() : null;
        }

        /// <summary>
        /// 设置身份认证票证。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="account">账号</param>
        /// <param name="name">姓名</param>
        /// <param name="createPersistentCookie">是否创建持久Cookie</param>
        public static void SetAuthCookie(string userId, string account, string name = null, bool createPersistentCookie = true)
        {
            if (HttpContext.Current == null)
            {
                return;
            }

            FormsAuthentication.SetAuthCookie($"{userId},{account},{name}", createPersistentCookie);
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 将IP地址转换为数字。
        /// </summary>
        /// <param name="ipAddress">IP地址</param>
        /// <returns>数字</returns>
        private static long AsNumber(this string ipAddress)
        {
            var ips = ipAddress.Split('.');

            return int.Parse(ips[0]) * (256 ^ 3) + int.Parse(ips[1]) * (256 ^ 2) + int.Parse(ips[2]) * 256 + int.Parse(ips[3]);
        }

        /// <summary>
        /// 判断一个数字在某个范围内。
        /// </summary>
        /// <param name="value">需要判断的数字</param>
        /// <param name="begin">开始</param>
        /// <param name="end">结束</param>
        /// <returns>在范围内</returns>
        private static bool InRange(long value, long begin, long end)
        {
            return (value >= begin) && (value <= end);
        }

        #endregion
    }
}
