using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.Unity;
using Prism.Modularity;
using Prism.Regions;

namespace Mercurius.CodeBuilder.UI
{
    /// <summary>
    /// 模块加载。
    /// </summary>
    public class Module : IModule
    {
        #region 字段

        private readonly IRegionManager _regionManager;
        private readonly IUnityContainer _unityContainer;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="regionManager">区域管理器</param>
        /// <param name="unityContainer">Unity容器</param>
        public Module(IRegionManager regionManager, IUnityContainer unityContainer)
        {
            this._regionManager = regionManager;
            this._unityContainer = unityContainer;
        }

        #endregion

        public void Initialize()
        {
            this._regionManager.RegisterViewWithRegion("NavigationRegion",
                () => this._unityContainer.Resolve<Views.DatabaseExplorerView>());
        }
    }
}
