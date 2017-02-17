using System.Collections.Generic;

namespace Mercurius.Kernel.Contracts.Swagger.Entities
{
    public class Parameter : PartialSchema
    {
        public string name;

        public string @in;

        public string description;

        public bool required;

        public Schema schema;

        public Dictionary<string, object> vendorExtensions = new Dictionary<string, object>();
    }
}
