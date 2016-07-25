using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Entities.Storage;
using Newtonsoft.Json;
using static Mercurius.Sparrow.Entities.Storage.File;

namespace Mercurius.Sparrow.Services.Storage
{
    /// <summary>
    /// 文件上传客户端。
    /// </summary>
    public class FileStorageClient : AbstractFileStorageClient
    {
        /// <summary>
        /// 上传文件。
        /// </summary>
        /// <param name="account">上传账号</param>
        /// <param name="request">Http请求对象</param>
        /// <returns>上传后的文件地址</returns>
        public override ResponseSet<string> Upload(string account, HttpRequestBase request)
        {
            var fileUpload = new FileUpload
            {
                Category = request.Params["BusinessCategory"],
                SerialNumber = request.Params["BusinessSerialNumber"]
            };

            var modifyUploadedFiles = request.Params[ModifyUploadedFilesFieldName]?.Split(',').ToList();
            var uploadedFilesDescription = request.Params[UploadFilesDescriptionFieldName]?.Split(',').ToList();

            for (var index = 0; index < request.Files.Count; index++)
            {
                var file = request.Files[index];

                fileUpload.Items.Add(new FileUploadItem
                {
                    Source = request.Params["Category"].AsInt32(1),
                    FileName = file.FileName,
                    ContentType = file.ContentType,
                    Description = uploadedFilesDescription?[index],
                    FileData = GetBase64String(file.InputStream),
                    BusinessFileId = modifyUploadedFiles?[index].AsGuid()
                });
            }

            return this.Upload(account, fileUpload);
        }

        /// <summary>
        /// 上传文件(基于base64字符串)。
        /// </summary>
        /// <param name="account">上传账号</param>
        /// <param name="fileUpload">上传文件信息</param>
        /// <returns>上传后的文件地址</returns>
        public override ResponseSet<string> Upload(string account, FileUpload fileUpload)
        {
            var request = (HttpWebRequest)WebRequest.Create($"{FileUploadUrl}/{account}");

            request.ContentType = "application/json";
            request.Method = "POST";
            request.KeepAlive = true;
            request.Credentials = CredentialCache.DefaultCredentials;

            var token = this.GetToken();

            if (token != null)
            {
                request.Headers.Add(HttpRequestHeader.Authorization, $"{token.TokenType} {token.AccessToken}");
            }

            using (var stream = request.GetRequestStream())
            {

                var buffers = Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(fileUpload));

                stream.Write(buffers, 0, buffers.Length);
            }

            var response = (HttpWebResponse)request.GetResponse();

            using (var stream = new StreamReader(response.GetResponseStream()))
            {
                return JsonConvert.DeserializeObject<ResponseSet<string>>(stream.ReadToEnd());
            }
        }

        /// <summary>
        /// 删除上传文件。
        /// </summary>
        /// <param name="account">删除者账号</param>
        /// <param name="category">业务分类</param>
        /// <param name="serialNumber">业务流水号</param>
        /// <returns>删除结果</returns>
        public override Response Remove(string account, string category, string serialNumber)
        {
            var url = string.Format(FileRemoveUrl, account, category, serialNumber);
            var request = (HttpWebRequest)WebRequest.Create(url);

            request.ContentType = "application/json";
            request.Method = "POST";
            request.KeepAlive = true;
            request.ContentLength = 0; // 无请求内容时，必须设置为0.
            request.Credentials = CredentialCache.DefaultCredentials;

            var token = this.GetToken();

            if (token != null)
            {
                request.Headers.Add(HttpRequestHeader.Authorization, $"{token.TokenType} {token.AccessToken}");
            }

            var response = (HttpWebResponse)request.GetResponse();

            using (var stream = new StreamReader(response.GetResponseStream()))
            {
                return JsonConvert.DeserializeObject<Response>(stream.ReadToEnd());
            }
        }

        #region 私有方法

        private static string GetBase64String(Stream stream)
        {
            if (stream == null || stream.Length == 0 || !stream.CanRead)
            {
                return null;
            }

            using (var stringReader = new BinaryReader(stream))
            {
                using (stream)
                {
                    var buffers = stringReader.ReadBytes((int)stream.Length);

                    return Convert.ToBase64String(buffers);
                }
            }
        }

        #endregion
    }
}
