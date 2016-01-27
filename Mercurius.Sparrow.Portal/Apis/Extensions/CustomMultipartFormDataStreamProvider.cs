using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;

namespace Mercurius.Siskin.Portal.Apis.Extensions
{
    public class CustomMultipartFormDataStreamProvider : MultipartFormDataStreamProvider
    {
        #region 构造方法

        public CustomMultipartFormDataStreamProvider(string rootPath) : base(rootPath)
        {
        }

        #endregion

        public override string GetLocalFileName(HttpContentHeaders headers)
        {
            var fileName = headers.ContentDisposition.FileName.Replace("\"", "");

            return $"{Guid.NewGuid()}{Path.GetExtension(fileName)}";
        }
    }
}