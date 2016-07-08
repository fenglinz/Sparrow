using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Sparrow.Entities.Core
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
    }
}
