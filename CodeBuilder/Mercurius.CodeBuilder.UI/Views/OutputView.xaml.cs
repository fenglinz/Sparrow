using System.Windows.Controls;

namespace Mercurius.CodeBuilder.UIModule.Views
{
    /// <summary>
    /// OutputView.xaml 的交互逻辑
    /// </summary>
    public partial class OutputView : UserControl
    {
        public OutputView(Mercurius.CodeBuilder.UI.ViewModels.OutputViewModel viewModel)
        {
            InitializeComponent();

            this.DataContext = viewModel;
        }
    }
}
