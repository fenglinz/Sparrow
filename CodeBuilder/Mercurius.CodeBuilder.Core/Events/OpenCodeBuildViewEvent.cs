using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mercurius.CodeBuilder.Core.Database;
using Microsoft.Practices.Prism.PubSubEvents;

namespace Mercurius.CodeBuilder.Core.Events
{
    public class OpenCodeBuildViewEvent : PubSubEvent<ConnectedDatabase>
    {
    }
}
