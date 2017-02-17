using System;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;

namespace Mercurius.FileStorageSystem.Apis.Extensions
{
    /// <summary>
    /// 自定义文件上传处理程序。
    /// </summary>
    public class CustomMultipartFormDataStreamProvider : MultipartFormDataStreamProvider
    {
        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        /// <param name="rootPath">文件保存目录</param>
        public CustomMultipartFormDataStreamProvider(string rootPath) : base(rootPath)
        {
        }

        #endregion

        /// <summary>
        /// 获取保存到本地的文件名。
        /// </summary>
        /// <param name="headers">文件上传Http头</param>
        /// <returns>保存在本地的文件名</returns>
        public override string GetLocalFileName(HttpContentHeaders headers)
        {
            var fileName = headers.ContentDisposition.FileName.Replace("\"", "");

            return $"{Guid.NewGuid()}{Path.GetExtension(fileName)}";
        }

        #region 私有方法

        /// <summary>
        /// 解析文件名。
        /// </summary>
        /// <param name="fileName">原始文件名</param>
        /// <returns>文件名</returns>
        private string ResolveFileName(string fileName)
        {
            if (string.IsNullOrWhiteSpace(fileName))
            {
                return fileName;
            }

            if (fileName.StartsWith("\"") && fileName.EndsWith("\"") && fileName.Length > 1)
            {
                return fileName.Substring(1, fileName.Length - 2);
            }

            return fileName;
        }

        #endregion
    }
}