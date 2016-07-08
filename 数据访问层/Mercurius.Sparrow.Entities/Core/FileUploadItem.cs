using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mercurius.Sparrow.Entities.Core
{
    /// <summary>
    /// 上传文件项。
    /// </summary>
    public class FileUploadItem
    {
        #region 属性

        /// <summary>
        /// 分类(1:附件;2:富文本图片)。
        /// </summary>
        public int Category { get; set; } = 1;

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

        #endregion

        #region 操作符重载

        /// <summary>
        /// 将上传文件项信息隐式转换为上传文件实体信息。
        /// </summary>
        /// <param name="item">上传文件项信息</param>
        public static explicit operator FileStorage(FileUploadItem item)
        {
            if (item == null)
            {
                return null;
            }

            return new FileStorage
            {
                Category = item.Category,
                FileName = item.FileName,
                SaveAsPath = item.SavedAsFilePath,
                Description = item.Description
            };
        }

        #endregion
    }
}