using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.Storage.Entities
{
    /// <summary>
    /// 上传文件。
    /// </summary>
    [Table("Storage.File")]
    public class File : Entity
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
        /// 上传文件描述信息。
        /// </summary>
        public const string UploadFilesDescriptionFieldName = "UploadFilesDescription";

        #endregion

        #region 属性

        /// <summary>
        /// 编号。
        /// </summary>
        [Display(Name = "编号")]
        public virtual Guid Id { get; set; }

        /// <summary>
        /// 文件名。
        /// </summary>
        [Display(Name = "文件名")]
        [StringLength(1000, ErrorMessage = "文件名不能超过{1}个字符。")]
        public virtual string Name { get; set; }

        /// <summary>
        /// 文件大小。
        /// </summary>
        [Display(Name = "文件大小")]
        public virtual long Size { get; set; }

        /// <summary>
        /// 文件MD5值。
        /// </summary>
        [Display(Name = "文件MD5值")]
        [StringLength(250, ErrorMessage = "文件MD5值不能超过{1}个字符。")]
        public virtual string MD5 { get; set; }

        /// <summary>
        /// 文件MIME类型。
        /// </summary>
        [Display(Name = "文件MIME类型")]
        [StringLength(250, ErrorMessage = "文件MIME类型不能超过{1}个字符。")]
        public virtual string ContentType { get; set; }

        /// <summary>
        /// 文件保存路径。
        /// </summary>
        [Display(Name = "文件保存路径")]
        [StringLength(1000, ErrorMessage = "文件保存路径不能超过{1}个字符。")]
        public virtual string SavedPath { get; set; }

        /// <summary>
        /// 文件保存时间。
        /// </summary>
        [Display(Name = "文件保存时间")]
        public virtual DateTime SavedDateTime { get; set; }

        #endregion
    }
}
