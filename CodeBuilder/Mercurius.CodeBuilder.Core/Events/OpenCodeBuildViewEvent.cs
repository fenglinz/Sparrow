using Mercurius.CodeBuilder.Core.Database;
using Prism.Events;

namespace Mercurius.CodeBuilder.Core.Events
{
    public class OpenCodeBuildViewEvent : PubSubEvent<ConnectedDatabase>
    {
    }
}
