using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Config;
using Mercurius.CodeBuilder.Core.Database;

namespace Mercurius.CodeBuilder.CSharp
{
    public class RegisterCreatedFileHandler : AbstractFileCreatedHandler
    {
        public override void OnFileCreateComplated(Configuration configuration, Item item, DbTable table, string fileName)
        {
            var projectFile = this.GetPorjectFile(configuration, item);
            var itemGroupItemType = this.GetItemGroupItemType(item.Extension);

            if (item.Parameters?.ContainsKey("References") == true)
            {
                ProjectFileConfigurationManager.AddReferences(projectFile, item);
            }

            ProjectFileConfigurationManager.AddItemGroupItem(projectFile, fileName, itemGroupItemType);
        }
    }
}
