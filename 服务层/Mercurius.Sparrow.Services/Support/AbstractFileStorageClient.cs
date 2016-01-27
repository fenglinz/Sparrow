using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.IO;
using System.Net;
using System.Web;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Entities.WebApi;
using Newtonsoft.Json;

namespace Mercurius.Sparrow.Services.Support
{
    /// <summary>
    /// 文件上传客户端。
    /// </summary>
    public abstract class AbstractFileStorageClient
    {
        #region 静态变量

        /// <summary>
        /// Web API Token信息。
        /// </summary>
        private static Token _token;

        /// <summary>
        /// 文件上传token账号。
        /// </summary>
        private static readonly string Account = ConfigurationManager.AppSettings["FileStorage.Token.Account"];

        /// <summary>
        /// 文件上传token密码
        /// </summary>
        private static readonly string Password = ConfigurationManager.AppSettings["FileStorage.Token.Password"];

        /// <summary>
        /// 文件上传远程地址。
        /// </summary>
        private static readonly string FileStorageRemoteUrl = ConfigurationManager.AppSettings["FileStorage.RomoteUrl"];

        /// <summary>
        /// 文件上传token认证地址。
        /// </summary>
        private static readonly string TokenEndpointPath = $"{FileStorageRemoteUrl}{ConfigurationManager.AppSettings["FileStorage.Token.TokenEndpointPath"]}";

        /// <summary>
        /// 文件上传Web API地址。
        /// </summary>
        protected static readonly string FileStorageUploadUrl = $"{FileStorageRemoteUrl}{ConfigurationManager.AppSettings["FileStorage.UploadUrl"]}";

        /// <summary>
        /// base64方式上传Web API地址。
        /// </summary>
        protected static readonly string FileStorageUploadWithBase64Url = $"{FileStorageRemoteUrl}{ConfigurationManager.AppSettings["FileStorage.UploadWithBase64Url"]}";

        /// <summary>
        /// 删除上传文件的Web API地址。
        /// </summary>
        protected static readonly string FileStorageRemoveUrl = $"{FileStorageRemoteUrl}{ConfigurationManager.AppSettings["FileStorage.Remove"]}";

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取文件实际地址。
        /// </summary>
        /// <param name="path">文件地址</param>
        /// <param name="mode">图片压缩模式</param>
        /// <returns>图像地址</returns>
        public string GetFile(string path, CompressMode mode = CompressMode.Small)
        {
            if (string.IsNullOrWhiteSpace(path))
            {
                return null;
            }

            var id = Convert.ToBase64String(Encoding.UTF8.GetBytes(path));

            return $"{FileStorageRemoteUrl}File/Index/{id}?mode={mode}";
        }

        #endregion

        /// <summary>
        /// 上传文件。
        /// </summary>
        /// <param name="account">上传账号</param>
        /// <param name="file">上传文件地址</param>
        /// <param name="contentType">文档类型</param>
        /// <param name="replacedFile">替换的文件</param>
        /// <returns>上传后的文件地址</returns>
        public abstract Response<string> Upload(string account, string file, string contentType, string replacedFile = null);

        /// <summary>
        /// 上传文件。
        /// </summary>
        /// <param name="account">上传账号</param>
        /// <param name="postedFile">上传文件流</param>
        /// <param name="replacedFile">替换的文件</param>
        /// <returns>上传后的文件地址</returns>
        public abstract Response<string> Upload(string account, HttpPostedFileBase postedFile, string replacedFile = null);

        /// <summary>
        /// 批量上传文件。
        /// </summary>
        /// <param name="account">上传账号</param>
        /// <param name="postedFiles">上传文件流集合</param>
        /// <param name="replacedFiles">替换的文件集合</param>
        /// <returns>上传后的文件地址集合</returns>
        public abstract ResponseCollection<string> Upload(string account, HttpFileCollectionBase postedFiles, params string[] replacedFiles);

        /// <summary>
        /// 上传文件(基于base64字符串)
        /// </summary>
        /// <param name="account">上传账号</param>
        /// <param name="items">上传文件信息</param>
        /// <returns>上传后的文件地址</returns>
        public abstract ResponseCollection<string> UploadWithBase64(string account, params UploadItem[] items);

        /// <summary>
        /// 删除上传文件。
        /// </summary>
        /// <param name="filePaths">删除上传文件</param>
        /// <returns>删除结果</returns>
        public abstract Response Remove(params string[] filePaths);

        #region 受保护方法

        /// <summary>
        /// 获取token。
        /// </summary>
        /// <returns>token信息</returns>
        protected Token GetToken()
        {
            if (_token == null)
            {
                var httpRequest = (HttpWebRequest)WebRequest.Create(TokenEndpointPath);

                httpRequest.Method = "POST";
                httpRequest.Accept = "application/json";
                httpRequest.ContentType = "application/x-www-form-urlencoded";

                var tokenRequest = $"grant_type=password&username={Account}&password={Password}";
                var buffers = Encoding.UTF8.GetBytes(tokenRequest);

                httpRequest.ContentLength = buffers.Length;

                var stream = httpRequest.GetRequestStream();

                stream.Write(buffers, 0, buffers.Length);

                using (var httpResponse = (HttpWebResponse)httpRequest.GetResponse())
                {
                    var streamReader = new StreamReader(httpResponse.GetResponseStream());

                    _token = JsonConvert.DeserializeObject<Token>(streamReader.ReadToEnd());
                }
            }

            return _token;
        }

        #endregion
    }
}
