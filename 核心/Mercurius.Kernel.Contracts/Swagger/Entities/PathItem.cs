﻿using System.Collections.Generic;
using Newtonsoft.Json;

namespace Mercurius.Kernel.Contracts.Swagger.Entities
{
    public class PathItem
    {
        [JsonProperty("$ref")]
        public string Ref;

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
