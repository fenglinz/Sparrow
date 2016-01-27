using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Entities.Core;
using Newtonsoft.Json;

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
        /// <param name="postedFile">上传文件流</param>
        /// <param name="replacedFile">替换的文件</param>
        /// <returns>上传后的文件地址</returns>
        public override Response<string> Upload(string account, HttpPostedFileBase postedFile, string replacedFile = null)
        {
            if (postedFile == null)
            {
                return new Response<string> { ErrorMessage = FileNotExists };
            }

            var datas = new NameValueCollection();

            if (!string.IsNullOrWhiteSpace(replacedFile))
            {
                datas.Add("ReplacedFile", replacedFile);
            }

            return WriteUploadStream(account, postedFile.FileName, postedFile.ContentType, postedFile.InputStream, datas);
        }

        /// <summary>
        /// 批量上传文件。
        /// </summary>
        /// <param name="account">上传账号</param>
        /// <param name="postedFiles">上传文件流集合</param>
        /// <param name="replacedFiles">替换的文件</param>
        /// <returns>上传后的文件地址集合</returns>
        public override ResponseCollection<string> Upload(string account, HttpFileCollectionBase postedFiles, params string[] replacedFiles)
        {
            if (postedFiles.IsEmpty())
            {
                return new ResponseCollection<string> { ErrorMessage = FileNotExists };
            }

            var datas = new NameValueCollection();

            if (!replacedFiles.IsEmpty())
            {
                datas.Add("ReplacedFile", replacedFiles.Contract());
            }

            return WriteUploadStream(account, postedFiles, datas);
        }

        /// <summary>
        /// 上传文件(基于base64字符串)
        /// </summary>
        /// <param name="account">上传账号</param>
        /// <param name="items">上传文件信息</param>
        /// <returns>上传后的文件地址</returns>
        public override ResponseCollection<string> UploadWithBase64(string account, params UploadItem[] items)
        {
            var request = (HttpWebRequest)WebRequest.Create($"{FileStorageUploadWithBase64Url}/{account}");

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
                return JsonConvert.DeserializeObject<ResponseCollection<string>>(stream.ReadToEnd());
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
                var rsp = JsonConvert.DeserializeObject<ResponseCollection<string>>(stream.ReadToEnd());

                return rsp.HasData() ? new Response<string> { Data = rsp.Datas.First() } : new Response<string> { ErrorMessage = rsp.ErrorMessage };
            }
        }

        /// <summary>
        /// HttpUploadFile
        /// </summary>
        /// <param name="account">上传者账号</param>
        /// <param name="postedFiles">上传文件集合</param>
        /// <param name="datas">form表单数据集合</param>
        /// <returns>上传的文件路径</returns>
        private ResponseCollection<string> WriteUploadStream(string account, HttpFileCollectionBase postedFiles, NameValueCollection datas = null)
        {
            var boundary = "---------------------------" + DateTime.Now.Ticks.ToString("x");
            var boundarybytes = Encoding.ASCII.GetBytes("\r\n--" + boundary + "\r\n");
            var endbytes = Encoding.ASCII.GetBytes("\r\n--" + boundary + "--\r\n");

            //1.HttpWebRequest
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
                var headerTemplate = "Content-Disposition: form-data; name=\"{0}\"; filename=\"{1}\"\r\nContent-Type: {2}\r\n\r\n";
                var buffer = new byte[4096];

                for (var index = 0; index < postedFiles.Count; index++)
                {
                    var postedFile = postedFiles[index];

                    stream.Write(boundarybytes, 0, boundarybytes.Length);

                    var header = string.Format(headerTemplate, "file", Path.GetFileName(postedFile.FileName), postedFile.ContentType);
                    var headerbytes = Encoding.UTF8.GetBytes(header);

                    stream.Write(headerbytes, 0, headerbytes.Length);

                    using (var fileStream = postedFile.InputStream)
                    {
                        int bytesRead;

                        while ((bytesRead = fileStream.Read(buffer, 0, buffer.Length)) != 0)
                        {
                            stream.Write(buffer, 0, bytesRead);
                        }
                    }
                }

                // 1.3 form end
                stream.Write(endbytes, 0, endbytes.Length);
            }

            // 2.WebResponse
            var response = (HttpWebResponse)request.GetResponse();
            using (var stream = new StreamReader(response.GetResponseStream()))
            {
                return JsonConvert.DeserializeObject<ResponseCollection<string>>(stream.ReadToEnd());
            }
        }

        #endregion
    }
}
