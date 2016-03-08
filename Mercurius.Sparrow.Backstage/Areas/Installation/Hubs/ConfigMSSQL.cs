using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace Mercurius.Sparrow.Backstage.Areas.Installation.Hubs
{
    /// <summary>
    /// 
    /// </summary>
    public class ConfigMSSQL : Hub
    {
        public void Initialization(string host,string account, string password, string dbname)
        {
            
        }
    }
}