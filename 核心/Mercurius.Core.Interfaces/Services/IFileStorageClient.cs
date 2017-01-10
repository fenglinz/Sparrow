using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Mercurius.Core.Interfaces.Entities;
using Mercurius.EntityBase;

namespace Mercurius.Core.Interfaces.Services
{
    public interface IFileStorageClient
    {
        #region 公开方法

        /// <summary>
        /// 获取文件实际地址。
        /// </summary>
        /// <param name="path">文件地址</param>
        /// <param name="mode">图片压缩模式</param>
        /// <returns>图像地址</returns>
        string GetFile(string path, CompressMode mode = CompressMode.Small);

        /// <summary>
        /// 上传文件。
        /// </summary>
        /// <param name="account">上传账号</param>
        /// <param name="request">Http请求对象</param>
        /// <returns>上传后的文件地址</returns>
        ResponseSet<string> Upload(string account, HttpRequestBase request);

        /// <summary>
        /// 上传文件(基于base64字符串)。
        /// </summary>
        /// <param name="account">上传账号</param>
        /// <param name="fileUpload">上传文件信息</param>
        /// <returns>上传后的文件地址</returns>
        ResponseSet<string> Upload(string account, FileUpload fileUpload);

        /// <summary>
        /// 删除上传文件。
        /// </summary>
        /// <param name="account">删除者账号</param>
        /// <param name="category">业务分类</param>
        /// <param name="serialNumber">业务流水号</param>
        /// <returns>删除结果</returns>
        Response Remove(string account, string category, string serialNumber);

        /// <summary>
        /// 获取计算机密钥。
        /// </summary>
        /// <param name="account">用户账号</param>
        /// <returns>计算机密钥</returns>
        Response<MachineKey> GetMachineKey(string account);

        /// <summary>
        /// 修改机器密钥。
        /// </summary>
        /// <param name="account">用户账号</param>
        /// <param name="machineKey">计算机密钥</param>
        /// <returns>修改后结果提示</returns>
        Response ChangeMachineKey(string account, MachineKey machineKey);

        #endregion
    }
}
