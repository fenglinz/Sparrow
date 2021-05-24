using Mercurius.CodeBuilder.UI.Views;
using Prism.Ioc;
using Prism.Modularity;
using Prism.Regions;
using Unity;

namespace Mercurius.CodeBuilder.UI
{
    /// <summary>
    /// 模块加载。
    /// </summary>
    public class Module : IModule
    {
        public void OnInitialized(IContainerProvider containerProvider)
        {

        }

        public void RegisterTypes(IContainerRegistry containerRegistry)
        {
            containerRegistry.RegisterForNavigation<DatabaseExplorerView>();
        }
    }
}
