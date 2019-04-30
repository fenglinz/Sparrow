using System.Data.Common;
using System.Data.SqlClient;
using Mercurius.Prime.Boot;

namespace Goldensoft.WX.WebApp
{
    /// <summary>
    /// 应用程序启动类
    /// </summary>
    public class Program
    {
        /// <summary>
        /// 应用程序启动方法
        /// </summary>
        /// <param name="args">启动参数</param>
        public static void Main(string[] args)
        {
            // DbProviderFactories.RegisterFactory("MySql.Data.MySqlClient", MySqlClientFactory.Instance);
            DbProviderFactories.RegisterFactory("System.Data.SqlClient", SqlClientFactory.Instance);

            new Bootstrapper().Run<Startup>(args);
        }
    }
}
