﻿using Mercurius.CodeBuilder.UI.Themes;
using Mercurius.CodeBuilder.UI.ViewModels;
using Prism.Regions;

namespace Mercurius.CodeBuilder.UI
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class Shell : MercuriusWindow
    {
        #region Fields

        private readonly IRegionManager regionManager;

        #endregion

        public Shell(ShellViewModel viewModel, IRegionManager regionManager)
        {
            InitializeComponent();

            this.DataContext = viewModel;
            this.regionManager = regionManager;

            this.Loaded += Shell_Loaded;
        }

        private void Shell_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
            this.regionManager.RequestNavigate("NavigationRegion", "databaseExplorer");
        }

        private void Button_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.leftNav.Width.Value == 50)
            {
                this.leftNav.Width = new System.Windows.GridLength(240);
            }
            else
            {
                this.leftNav.Width = new System.Windows.GridLength(50);
            }
        }
    }
}
