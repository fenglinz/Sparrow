using System.Collections.Generic;

namespace Mercurius.Kernel.Contracts.Swagger.Entities
{
    public class PartialSchema
    {
        public string type;

        public string format;

        public PartialSchema items;

        public string collectionFormat;

        public object @default;

        public int? maximum;

        public bool? exclusiveMaximum;

        public int? minimum;

        public bool? exclusiveMinimum;

        public int? maxLength;

        public int? minLength;

        public string pattern;

        public int? maxItems;

        public int? minItems;

        public bool? uniqueItems;

        public IList<object> @enum;

        public int? multipleOf;
    }
}
