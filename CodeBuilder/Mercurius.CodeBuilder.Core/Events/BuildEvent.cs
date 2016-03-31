using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.Prism.PubSubEvents;

namespace Mercurius.CodeBuilder.Core.Events
{
    /// <summary>
    /// 创建事件。
    /// </summary>
    public class BuildEvent : PubSubEvent<BuildEventArg>
    {

    }
}
