using System;
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
        public string BusinessCategory { get; set; }

        /// <summary>
        /// 业务流水号。
        /// </summary>
        public string BusinessSerialNumber { get; set; }

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

        #region 操作符重载

        /// <summary>
        /// 将上传文件信息对象隐式转换为业务文件对象。
        /// </summary>
        /// <param name="fileUpload">上传文件信息</param>
        public static explicit operator BusinessFile(FileUpload fileUpload)
        {
            if (fileUpload == null)
            {
                return null;
            }

            return new BusinessFile
            {
                Category = fileUpload.BusinessCategory,
                SerialNumber = fileUpload.BusinessSerialNumber,
                Files = (from i in fileUpload.Items
                         select new File
                         {
                             Name = i.FileName,
                             MD5 = i.FileData.MD5(),
                             SourceCategory = i.Category,
                             ContentType = i.ContentType,
                             Description = i.Description,
                             SavedPath = i.FileSavedPath
                         }).ToList()
            };
        }

        #endregion
    }
}
