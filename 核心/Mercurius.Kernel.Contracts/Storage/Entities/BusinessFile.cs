﻿using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.Storage.Entities
{
    /// <summary>
    /// 业务文件存储。
    /// </summary>
    [Table("Storage.BusinessFile")]
    public class BusinessFile
    {
        #region 属性

        /// <summary>
        /// 编号。
        /// </summary>
        [Display(Name = "编号")]
        public virtual Guid Id { get; set; }

        /// <summary>
        /// 业务分类。
        /// </summary>
        [Display(Name = "业务分类")]
        [StringLength(250, ErrorMessage = "业务分类不能超过{1}个字符。")]
        public virtual string Category { get; set; }

        /// <summary>
        /// 业务流水号。
        /// </summary>
        [Display(Name = "业务流水号")]
        [StringLength(36, ErrorMessage = "业务流水号不能超过{1}个字符。")]
        public virtual string SerialNumber { get; set; }

        /// <summary>
        /// 来源(1：附件、2：富文本编辑器)。
        /// </summary>
        [Display(Name = "来源")]
        public virtual int Source { get; set; } = 1;

        /// <summary>
        /// 文件存储编号。
        /// </summary>
        [Display(Name = "文件存储编号")]
        public virtual Guid? FileId { get; set; }

        /// <summary>
        /// 文件描述。
        /// </summary>
        [Display(Name = "文件描述")]
        [StringLength(250, ErrorMessage = "文件描述不能超过{1}个字符。")]
        public virtual string Description { get; set; }

        /// <summary>
        /// 排序号。
        /// </summary>
        [Display(Name = "排序号")]
        public virtual int Sort { get; set; }

        /// <summary>
        /// 上传用户编号。
        /// </summary>
        [Display(Name = "上传用户编号")]
        [StringLength(36, ErrorMessage = "上传用户编号不能超过{1}个字符。")]
        public virtual string UploadUserId { get; set; }

        /// <summary>
        /// 上传时间。
        /// </summary>
        [Display(Name = "上传时间")]
        public virtual DateTime UploadDateTime { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 业务文件关联的文件信息。
        /// </summary>
        public virtual File File { get; set; }

        /// <summary>
        /// 是否为业务数据创建前添加。
        /// </summary>
        public bool IsBeforeBusinessData { get; set; }

        #endregion
    }
}
