using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using Mercurius.CodeBuilder.Core.Database;

namespace Mercurius.CodeBuilder.UI.Themes.Converters
{
    public class CurrentDatabaseConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var current = value as ConnectedDatabase;
            var connected = parameter as ConnectedDatabase;

            if (current != null && connected != null)
            {
                return current == connected;
            }

            return false;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
