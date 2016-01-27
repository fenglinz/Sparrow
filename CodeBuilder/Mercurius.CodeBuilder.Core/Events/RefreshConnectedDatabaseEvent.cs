using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.Prism.Events;

namespace Mercurius.CodeBuilder.Core.Events
{
    public class RefreshConnectedDatabaseEvent : CompositePresentationEvent<string>
    {
    }
}
