using Mercurius.CodeBuilder.UI.Themes;

namespace Mercurius.CodeBuilder.UI.Dialogs
{
    /// <summary>
    /// ConnectDatabaseView.xaml 的交互逻辑
    /// </summary>
    public partial class LogOnServerDialog : MercuriusDialog
    {
        public LogOnServerDialog(ViewModels.LogonServerViewModel viewModel)
        {
            InitializeComponent();

            this.DataContext = viewModel;
            viewModel.CurrentWindow = this;
        }
    }
}
