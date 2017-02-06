using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
