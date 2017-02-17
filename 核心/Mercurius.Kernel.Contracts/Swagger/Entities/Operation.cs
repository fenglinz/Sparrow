using System.Collections.Generic;

namespace Mercurius.Kernel.Contracts.Swagger.Entities
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
    }
}
