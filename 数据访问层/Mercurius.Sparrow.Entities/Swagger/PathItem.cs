using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace Mercurius.Sparrow.Entities.Swagger
{
    public class PathItem
    {
        [JsonProperty("$ref")]
        public string @ref;

        public Operation get;

        public Operation put;

        public Operation post;

        public Operation delete;

        public Operation options;

        public Operation head;

        public Operation patch;

        public IList<Parameter> parameters;

        public Dictionary<string, object> vendorExtensions = new Dictionary<string, object>();
    }
}
