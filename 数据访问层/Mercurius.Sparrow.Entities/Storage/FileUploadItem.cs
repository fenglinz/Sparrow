using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Mercurius.Infrastructure;

namespace Mercurius.Sparrow.Entities.Storage
{
    /// <summary>
    /// 上传文件项。
    /// </summary>
    public class FileUploadItem
    {
        #region 属性

        /// <summary>
        /// 来源(1:附件;2:富文本图片)。
        /// </summary>
        public int Source { get; set; } = 1;

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
        /// 业务文件编号。
        /// </summary>
        public Guid? BusinessFileId { get; set; }

        #endregion
    }
}