using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Entities.Core;
using Newtonsoft.Json;
using static Mercurius.Sparrow.Entities.Core.FileStorage;

namespace Mercurius.Sparrow.Services.Support
{
    /// <summary>
    /// 文件上传客户端。
    /// </summary>
    public class FileStorageClient : AbstractFileStorageClient
    {
        #region 静态变量

        private static readonly string FileNotExists = "无上传文件！";

        private static readonly string HeaderTemplate = "Content-Disposition: form-data; name=\"{0}\"; filename=\"{1}\"\r\nContent-Type: {2}\r\n\r\n";

        #endregion

        /// <summary>
        /// 上传文件。
        /// </summary>
        /// <param name="account">上传账号</param>
        /// <param name="file">上传文件地址</param>
        /// <param name="contentType">文档类型</param>
        /// <param name="replacedFile">替换的文件</param>
        /// <returns>上传后的文件地址</returns>
        public override Response<string> Upload(string account, string file, string contentType, string replacedFile = null)
        {
            if (!File.Exists(file))
            {
                return new Response<string> { ErrorMessage = FileNotExists };
            }

            var datas = new NameValueCollection();

            if (!string.IsNullOrWhiteSpace(replacedFile))
            {
                datas.Add("ReplacedFile", replacedFile);
            }

            var postedStream = File.Open(file, FileMode.Open, FileAccess.Read, FileShare.Read);

            return WriteUploadStream(account, file, contentType, postedStream, datas);
        }

        /// <summary>
        /// 上传文件。
        /// </summary>
        /// <param name="account">上传账号</param>
        /// <param name="request">Http请求对象</param>
        /// <returns>上传后的文件地址</returns>
        public override ResponseSet<string> Upload(string account, HttpRequestBase request)
        {
            var uploadItems = new List<UploadItem>();
            var modifyUploadedFiles = request.Params[ModifyUploadedFilesFieldName]?.Split(',').ToList();
            var uploadedFilesDescription = request.Params[UploadFilesDescriptionFieldName]?.Split(',').ToList();
            var uploadedFiles = request.Params[UploadedFilesFieldName]?.Split(',').Where(f => !string.IsNullOrWhiteSpace(f)).ToList();

            // 需要删除的文件。
            if (!uploadedFiles.IsEmpty())
            {
                var removeFiles = from f in uploadedFiles
                                  where
                                    modifyUploadedFiles.IsEmpty() || !modifyUploadedFiles.Contains(f)
                                  select new UploadItem { RemoveFilePath = f };

                uploadItems.AddRange(removeFiles);
            }

            for (var index = 0; index < request.Files.Count; index++)
            {
                var file = request.Files[index];

                uploadItems.Add(new UploadItem
                {
                    BusinessCategory = request.Params["BusinessCategory"],
                    BusinessSerialNumber = request.Params["BusinessSerialNumber"],
                    FileName = file.FileName,
                    ContentType = file.ContentType,
                    Description = uploadedFilesDescription?[index],
                    FileData = this.GetBase64String(file.InputStream),
                    SavedAsFilePath = modifyUploadedFiles?[index]
                });
            }

            return this.Upload(account, uploadItems.ToArray());
        }

        /// <summary>
        /// 上传文件(基于base64字符串)。
        /// </summary>
        /// <param name="account">上传账号</param>
        /// <param name="items">上传文件信息</param>
        /// <returns>上传后的文件地址</returns>
        public override ResponseSet<string> Upload(string account, params UploadItem[] items)
        {
            var request = (HttpWebRequest)WebRequest.Create($"{FileStorageUploadUrl}/{account}");

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

                var buffers = Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(items));

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
        /// <param name="filePaths">删除上传文件</param>
        /// <returns>删除结果</returns>
        public override Response Remove(params string[] filePaths)
        {
            var request = (HttpWebRequest)WebRequest.Create($"{FileStorageRemoveUrl}");

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

                var buffers = Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(filePaths));

                stream.Write(buffers, 0, buffers.Length);
            }

            var response = (HttpWebResponse)request.GetResponse();

            using (var stream = new StreamReader(response.GetResponseStream()))
            {
                return JsonConvert.DeserializeObject<Response>(stream.ReadToEnd());
            }
        }

        #region 私有方法

        /// <summary>
        /// 将文件流写入上传文件流。
        /// </summary>
        /// <param name="account">上传账号</param>
        /// <param name="fileName">文件名</param>
        /// <param name="contentType">文件类型</param>
        /// <param name="postedStream">上传文件流</param>
        /// <param name="datas">form表单数据集合</param>
        /// <returns>上传后的文件地址</returns>
        private Response<string> WriteUploadStream(string account, string fileName, string contentType, Stream postedStream, NameValueCollection datas = null)
        {
            var boundary = "---------------------------" + DateTime.Now.Ticks.ToString("x");
            var boundarybytes = Encoding.ASCII.GetBytes("\r\n--" + boundary + "\r\n");
            var endbytes = Encoding.ASCII.GetBytes("\r\n--" + boundary + "--\r\n");

            // 1.HttpWebRequest
            var request = (HttpWebRequest)WebRequest.Create($"{FileStorageUploadUrl}/{account}");
            request.ContentType = "multipart/form-data; boundary=" + boundary;
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
                // 1.1 key/value
                if (datas != null)
                {
                    var formdataTemplate = "Content-Disposition: form-data; name=\"{0}\"\r\n\r\n{1}";

                    foreach (string key in datas.Keys)
                    {
                        stream.Write(boundarybytes, 0, boundarybytes.Length);

                        var formitem = string.Format(formdataTemplate, key, datas[key]);
                        var formitembytes = Encoding.UTF8.GetBytes(formitem);

                        stream.Write(formitembytes, 0, formitembytes.Length);
                    }
                }

                // 1.2 file
                var buffer = new byte[4096];

                stream.Write(boundarybytes, 0, boundarybytes.Length);

                var header = string.Format(HeaderTemplate, "file", Path.GetFileName(fileName), contentType);
                var headerbytes = Encoding.UTF8.GetBytes(header);

                stream.Write(headerbytes, 0, headerbytes.Length);

                using (postedStream)
                {
                    int bytesRead;

                    while ((bytesRead = postedStream.Read(buffer, 0, buffer.Length)) != 0)
                    {
                        stream.Write(buffer, 0, bytesRead);
                    }
                }

                // 1.3 form end
                stream.Write(endbytes, 0, endbytes.Length);
            }

            // 2.WebResponse
            var response = (HttpWebResponse)request.GetResponse();

            using (var stream = new StreamReader(response.GetResponseStream()))
            {
                var rsp = JsonConvert.DeserializeObject<ResponseSet<string>>(stream.ReadToEnd());

                return rsp.HasData() ? new Response<string> { Data = rsp.Datas.First() } : new Response<string> { ErrorMessage = rsp.ErrorMessage };
            }
        }

        private string GetBase64String(Stream stream)
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
