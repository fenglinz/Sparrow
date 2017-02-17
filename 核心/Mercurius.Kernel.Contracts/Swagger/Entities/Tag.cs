using System.Collections.Generic;

namespace Mercurius.Kernel.Contracts.Swagger.Entities
{
    public class Tag
    {
        public string name;

        public string description;

        public ExternalDocs externalDocs;

        public Dictionary<string, object> vendorExtensions = new Dictionary<string, object>();
    }
}
