using System.Windows;
using System.Windows.Input;

namespace Mercurius.CodeBuilder.UI.Themes
{
    public class MercuriusWindow : Window
    {
        public MercuriusWindow()
        {
            this.SetValue(Window.StyleProperty, Application.Current.Resources[typeof(MercuriusWindow)]);

            this.CommandBindings.Add(new CommandBinding(SystemCommands.CloseWindowCommand, (sender, e) => SystemCommands.CloseWindow(this)));
            this.CommandBindings.Add(new CommandBinding(SystemCommands.MaximizeWindowCommand, (sender, e) => SystemCommands.MaximizeWindow(this), (sender, e) => e.CanExecute = e.CanExecute = this.ResizeMode == ResizeMode.CanResize || this.ResizeMode == ResizeMode.CanResizeWithGrip));
            this.CommandBindings.Add(new CommandBinding(SystemCommands.MinimizeWindowCommand, (sender, e) => SystemCommands.MinimizeWindow(this), (sender, e) => e.CanExecute = this.ResizeMode != ResizeMode.NoResize));
            this.CommandBindings.Add(new CommandBinding(SystemCommands.RestoreWindowCommand, (sender, e) => SystemCommands.RestoreWindow(this), (sender, e) => e.CanExecute = e.CanExecute = this.ResizeMode == ResizeMode.CanResize || this.ResizeMode == ResizeMode.CanResizeWithGrip));
        }
    }
}
