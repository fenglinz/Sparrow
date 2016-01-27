using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Siskin.Entities.Swagger
{
    public class Operation
    {
        public IList<string> tags;

        public string summary;

        public string description;

        public ExternalDocs externalDocs;

        public string operationId;

        public IList<string> consumes;

        public IList<string> produces;

        public IList<Parameter> parameters;

        //public IDictionary<string, Response> responses;

        //public IList<string> schemes;

        //public bool deprecated;

        //public IList<IDictionary<string, IEnumerable<string>>> security;

        //public Dictionary<string, object> vendorExtensions = new Dictionary<string, object>();
    }
}
