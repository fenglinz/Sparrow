using System.Collections.Generic;

namespace Mercurius.Kernel.Contracts.Swagger.Entities
{
    public class Info
    {
        public string version;

        public string title;

        public string description;

        public string termsOfService;

        public Contact contact;

        public License license;

        public Dictionary<string, object> vendorExtensions = new Dictionary<string, object>();
    }
}
