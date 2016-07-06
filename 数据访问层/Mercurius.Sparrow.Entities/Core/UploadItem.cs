using System;
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
        /// 业务分类。
        /// </summary>
        public string BusinessCategory { get; set; }

        /// <summary>
        /// 业务流水号。
        /// </summary>
        public string BusinessSerialNumber { get; set; }

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

        #region 操作符重载

        /// <summary>
        /// 将上传文件项信息隐式转换为上传文件实体信息。
        /// </summary>
        /// <param name="item">上传文件项信息</param>
        public static explicit operator FileStorage(UploadItem item)
        {
            if (item == null)
            {
                return null;
            }

            return new FileStorage
            {
                BusinessCategory = item.BusinessCategory,
                BusinessSerialNumber = item.BusinessSerialNumber,
                FileName = item.FileName,
                ContentType = item.ContentType,
                SaveAsPath = item.SavedAsFilePath,
                Description = item.Description
            };
        }

        #endregion
    }
}