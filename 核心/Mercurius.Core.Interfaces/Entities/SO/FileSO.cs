using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mercurius.EntityBase;

namespace Mercurius.Core.Interfaces.Entities.SO
{
    /// <summary>
    /// 上传文件查询条件。
    /// </summary>
    public class FileSO : SearchObject
    {
        #region 属性

        /// <summary>
        /// 文件名。
        /// </summary>
        public string FileName { get; set; }

        /// <summary>
        /// 文件类型。
        /// </summary>
        public string ContentType { get; set; }

        /// <summary>
        /// 上传者。
        /// </summary>
        public string UploadUserName { get; set; }

        /// <summary>
        /// 开始上传日期。
        /// </summary>
        public DateTime? StartUploadDate { get; set; }

        /// <summary>
        /// 截止上传日期。
        /// </summary>
        public DateTime? EndUploadDate { get; set; }

        #endregion
    }
}
