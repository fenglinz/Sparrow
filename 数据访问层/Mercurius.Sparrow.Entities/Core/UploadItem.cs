﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mercurius.Sparrow.Entities.Core
{
    /// <summary>
    /// 上传文件项。
    /// </summary>
    public class UploadItem
    {
        #region 属性

        /// <summary>
        /// 文件名(含扩展名)。
        /// </summary>
        public string FileName { get; set; }

        /// <summary>
        /// 文件类型。
        /// </summary>
        public string ContentType { get; set; }

        /// <summary>
        /// 文件内容(以Base64编码)
        /// </summary>
        public string FileData { get; set; }

        /// <summary>
        /// 文件描述。
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// 已保存的文件路径。
        /// </summary>
        public string SavedAsFilePath { get; set; }

        /// <summary>
        /// 删除的文件路径。
        /// </summary>
        public string RemoveFilePath { get; set; }

        #endregion
    }
}