using System;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Mercurius.Prime.Core.WebApi;
using Mercurius.Kernel.Contracts.Storage.Entities;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Core;
using static Mercurius.Prime.Core.SystemConfiguration;
using static Mercurius.Kernel.Contracts.Storage.Entities.File;

namespace Mercurius.Sparrow.Services.Storage
{
    /// <summary>
    /// 文件上传Web Api客户端。
    /// </summary>
    public class FileStorageClient : WebApiClientSupport
    {
        #region 静态变量

        /// <summary>
        /// 文件上传Web Api地址。
        /// </summary>
        private static readonly string FileUploadUrl = "api/File/Upload";

        /// <summary>
        /// 删除上传文件的Web Api地址。
        /// </summary>
        private static readonly string FileRemoveUrl = "api/File/Remove/{0}/{1}/{2}";

        /// <summary>
        /// 修改计算机密钥的Web Api地址。
        /// </summary>
        private static readonly string ChangeMachineKeyUrl = "api/Config/{0}";

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

            return $"{FileStorageRomoteUrl}File/Index/{id}?mode={mode}";
        }

        /// <summary>
        /// 上传文件。
        /// </summary>
        /// <param name="account">上传账号</param>
        /// <param name="request">Http请求对象</param>
        /// <returns>上传后的文件地址</returns>
        public ResponseSet<string> Upload(string account, HttpRequestBase request)
        {
            var source = request.Params["Category"].AsInt32(1);

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
                    Source = source,
                    FileName = file.FileName,
                    ContentType = file.ContentType,
                    Description = uploadedFilesDescription?[index],
                    FileData = file.InputStream.GetBase64String(),
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
        public ResponseSet<string> Upload(string account, FileUpload fileUpload)
        {
            return this.Post<ResponseSet<string>>($"{FileUploadUrl}/{account}", fileUpload);
        }

        /// <summary>
        /// 删除上传文件。
        /// </summary>
        /// <param name="account">删除者账号</param>
        /// <param name="category">业务分类</param>
        /// <param name="serialNumber">业务流水号</param>
        /// <returns>删除结果</returns>
        public Response Remove(string account, string category, string serialNumber)
        {
            var url = string.Format(FileRemoveUrl, account, category, serialNumber);

            return this.Post<Response>(url);
        }

        /// <summary>
        /// 获取计算机密钥。
        /// </summary>
        /// <param name="account">用户账号</param>
        /// <returns>计算机密钥</returns>
        public Response<MachineKey> GetMachineKey(string account)
        {
            var url = $"api/Config/{account}";

            return this.Get<Response<MachineKey>>(url);
        }

        /// <summary>
        /// 修改机器密钥。
        /// </summary>
        /// <param name="account">用户账号</param>
        /// <param name="machineKey">计算机密钥</param>
        /// <returns>修改后结果提示</returns>
        public Response ChangeMachineKey(string account, MachineKey machineKey)
        {
            var url = string.Format(ChangeMachineKeyUrl, account);

            this.Cache?.Remove(TokenCacheKey);

            return this.Post<Response>(url, machineKey);
        }

        #endregion
    }
}
