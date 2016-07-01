using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.Core
{
    /// <summary>
    /// 上传文件。
    /// </summary>
    [Table("FileStorage")]
    public class FileStorage : Domain
    {
        #region 常量

        /// <summary>
        /// 保存已上传文件的元素名。
        /// </summary>
        public const string UploadedFilesFieldName = "UploadedFiles";

        /// <summary>
        /// 保存修改后的文件的元素名。
        /// </summary>
        public const string ModifyUploadedFilesFieldName = "ModifyUploadedFiles";

        /// <summary>
        /// 已经上传的文件的元素名。
        /// </summary>
        public const string UploadedFileFieldName = "UploadedFile";

        /// <summary>
        /// 新上传的文件的元素名。
        /// </summary>
        public const string NewUploadFileFieldName = "NewUploadFile";

        /// <summary>
        /// 上传文件描述信息。
        /// </summary>
        public const string UploadFilesDescriptionFieldName = "UploadFilesDescription";

        #endregion

        #region 属性

        /// <summary>
        /// 编号。
        /// </summary>
        [Display(Name = "编号")]
        public virtual int Id { get; set; }

        /// <summary>
        /// 文件名。
        /// </summary>
        [Display(Name = "文件名")]
        [StringLength(1000, ErrorMessage = "文件名不能超过{1}个字符。")]
        public virtual string FileName { get; set; }

        /// <summary>
        /// 文件MIME类型。
        /// </summary>
        [Display(Name = "文件MIME类型")]
        [StringLength(250, ErrorMessage = "文件MIME类型不能超过{1}个字符。")]
        public virtual string ContentType { get; set; }

        /// <summary>
        /// 文件大小。
        /// </summary>
        [Display(Name = "文件大小")]
        public virtual long? FileSize { get; set; }

        /// <summary>
        /// 文件标题。
        /// </summary>
        [Display(Name = "文件标题")]
        [StringLength(250, ErrorMessage = "文件标题不能超过{1}个字符。")]
        public virtual string Description { get; set; }

        /// <summary>
        /// 文件保存路径。
        /// </summary>
        [Display(Name = "文件保存路径")]
        [StringLength(1000, ErrorMessage = "文件保存路径不能超过{1}个字符。")]
        public virtual string SaveAsPath { get; set; }

        /// <summary>
        /// 扫描状态。
        /// </summary>
        [Display(Name = "扫描状态")]
        public virtual int? ScanStatus { get; set; }

        /// <summary>
        /// 上传者编号。
        /// </summary>
        [Display(Name = "上传者编号")]
        [StringLength(36, ErrorMessage = "上传者编号不能超过{1}个字符。")]
        public virtual string UploadUserId { get; set; }

        /// <summary>
        /// 上传时间。
        /// </summary>
        [Display(Name = "上传时间")]
        public virtual DateTime UploadDateTime { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 上传者姓名。
        /// </summary>
        public string UploadUserName { get; set; }

        #endregion
    }
}
