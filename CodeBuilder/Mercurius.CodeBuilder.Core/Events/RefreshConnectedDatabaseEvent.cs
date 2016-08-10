using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Prism.Events;

namespace Mercurius.CodeBuilder.Core.Events
{
    public class RefreshConnectedDatabaseEvent : PubSubEvent<string>
    {
    }
}
