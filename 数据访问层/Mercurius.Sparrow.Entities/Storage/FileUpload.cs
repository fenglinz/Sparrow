﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Infrastructure;

namespace Mercurius.Sparrow.Entities.Storage
{
    /// <summary>
    /// 文件上传信息。
    /// </summary>
    public class FileUpload
    {
        #region 属性

        /// <summary>
        /// 业务分类。
        /// </summary>
        public string Category { get; set; }

        /// <summary>
        /// 业务流水号。
        /// </summary>
        public string SerialNumber { get; set; }

        /// <summary>
        /// 上传文件集合。
        /// </summary>
        public IList<FileUploadItem> Items { get; private set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        public FileUpload()
        {
            this.Items = new List<FileUploadItem>();
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 将文件上传信息转换为业务文件列表。
        /// </summary>
        /// <returns>业务文件列表</returns>
        public IList<BusinessFile> AsBusinessFiles(string uploadUserId)
        {
            var index = 1;

            return (from f in this.Items
                    select new BusinessFile
                    {
                        Source = f.Source,
                        Description = f.Description,
                        FileId = f.FileId,
                        Sort = index++,
                        UploadUserId = uploadUserId,
                        File = new File
                        {
                            Name = f.FileName,
                            ContentType = f.ContentType,
                            MD5 = f.FileData.MD5()
                        }
                    }).ToList();
        }

        #endregion
    }
}
