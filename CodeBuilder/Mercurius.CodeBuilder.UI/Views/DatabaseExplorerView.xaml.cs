using System.Windows;
using System.Windows.Controls;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.CodeBuilder.UI.ViewModels;

namespace Mercurius.CodeBuilder.UI.Views
{
    /// <summary>
    /// DatabaseExploerView.xaml 的交互逻辑
    /// </summary>
    public partial class DatabaseExplorerView : UserControl
    {
        #region 字段

        private DatabaseExplorerViewModel _viewModel = null;

        #endregion

        public DatabaseExplorerView(DatabaseExplorerViewModel viewModel)
        {
            InitializeComponent();

            this._viewModel = viewModel;
            this.DataContext = viewModel;
        }

        private void OnOpenConnectedDatabase(object sender, RoutedEventArgs e)
        {
            var tvItem = sender as TreeViewItem;

            if (tvItem != null)
            {
                var connectedDatabase = tvItem.Header as ConnectedDatabase;

                this._viewModel.OpenConnectedDatabaseCommand.Execute(connectedDatabase);
            }
        }

        private void OnDeleteConnectedDatabase(object sender, RoutedEventArgs e)
        {
            var item = sender as MenuItem;

            if (item != null)
            {
                this._viewModel.DeleteConnectedDatabaseCommand.Execute(item.Tag as ConnectedDatabase);
            }
        }

        private void OnUpdateConnectedDatabase(object sender, RoutedEventArgs e)
        {
            var item = sender as MenuItem;

            if (item != null)
            {
                this._viewModel.UpdateConnectedDatabaseCommand.Execute(item.Tag as ConnectedDatabase);
            }
        }
    }
}
