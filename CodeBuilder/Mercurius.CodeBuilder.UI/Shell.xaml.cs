using Mercurius.CodeBuilder.UI.Themes;
using Mercurius.CodeBuilder.UI.ViewModels;

namespace Mercurius.CodeBuilder.UI
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class Shell : MercuriusWindow
    {
        public Shell(ShellViewModel viewModel)
        {
            InitializeComponent();

            this.DataContext = viewModel;
        }
    }
}
