using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using Mercurius.CodeBuilder.UI.Dialogs;
using Microsoft.Practices.ServiceLocation;
using Prism.Commands;
using Prism.Mvvm;

namespace Mercurius.CodeBuilder.UI.ViewModels
{
    /// <summary>
    /// 主窗体视图模型。
    /// </summary>
    public class ShellViewModel : BindableBase
    {
        #region 字段

        private ICommand _templateSetingCommand;

        #endregion

        #region 命令

        public ICommand TemplateSettingCommand
        {
            get
            {
                return this._templateSetingCommand = this._templateSetingCommand ?? new DelegateCommand(() =>
                {
                    var dlg = ServiceLocator.Current.GetInstance<TemplateSettingDialog>();

                    if (dlg != null)
                    {
                        dlg.Owner = Application.Current.MainWindow;
                        dlg.ShowDialog();
                    }
                });
            }
        }

        #endregion
    }
}
