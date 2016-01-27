using System.IO;

namespace Mercurius.Infrastructure
{
    /// <summary>
    /// <para>
    /// 文件处理工具类。
    /// </para>
    /// 
    /// <para>
    /// 作者：Fenglinz
    /// 日期：2011-11-09
    /// </para>
    /// </summary>
    public static class IOExtensions
    {
        #region 公开方法

        /// <summary>
        /// 创建目录：如果目录不存在则创建，否则不创建。
        /// </summary>
        /// <param name="dir">目录</param>
        public static void CreateDirectory(string dir)
        {
            if (!Directory.Exists(dir))
            {
                Directory.CreateDirectory(dir);
            }
        }

        /// <summary>
        /// 将一个目录下的所有文件拷贝到另一个目录下。
        /// </summary>
        /// <param name="sourceDir">源目录</param>
        /// <param name="targetDir">目标目录</param>
        public static void CopyFiles(string sourceDir, string targetDir)
        {
            CreateDirectory(sourceDir);

            CreateDirectory(targetDir);

            var dirInfo = new DirectoryInfo(sourceDir);
            var files = dirInfo.GetFiles();

            foreach (var file in files)
            {
                file.CopyTo($@"{targetDir}\{file.Name}", true);
            }

            var dirs = dirInfo.GetDirectories();

            foreach (var item in dirs)
            {
                CopyFiles(
                    item.FullName,
                    $@"{targetDir}\{item.FullName.Substring(dirInfo.FullName.Length)}");
            }
        }

        /// <summary>
        /// 将Java包名转换为目录。
        /// </summary>
        /// <param name="package">包名</param>
        /// <returns>转换后的目录</returns>
        public static string PackageToDirectory(this string package)
        {
            return package.Replace('.', '\\');
        }

        /// <summary>
        /// 将Java包名转换为Uri。
        /// </summary>
        /// <param name="package">报名</param>
        /// <returns>转换后的Uri结构</returns>
        public static string PackageToUri(this string package)
        {
            return package.Replace('.', '/');
        }

        #endregion
    }
}
