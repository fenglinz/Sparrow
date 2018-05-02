using System;
using System.Text;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Mercurius.Prime.Core.Ado;
using System.Linq;

namespace Mercurius.Prime.Test.Ado
{
    /// <summary>
    /// metadata测试。
    /// </summary>
    [TestClass]
    public class MetadataUnitTest
    {
        #region 字段

        private static DbHelper dbHelper;

        #endregion

        #region 属性

        public TestContext TestContext { get; set; }

        #endregion

        /// <summary>
        /// 测试初始化。
        /// </summary>
        /// <param name="context"></param>
        [ClassInitialize]
        public static void Initialize(TestContext context)
        {
            dbHelper = DbHelperCreator.Create(DatabaseType.MySQL, "117.78.45.3", "csbr_test", "test", "csbr@3.1", 4405);
        }

        /// <summary>
        /// 获取所有表信息。
        /// </summary>
        [TestMethod]
        public void GetTables()
        {
            var tables = dbHelper.DbMetadata.GetTables();

            Assert.IsNotNull(tables);
            Assert.IsTrue(tables.Count() > 0);
        }
    }
}
