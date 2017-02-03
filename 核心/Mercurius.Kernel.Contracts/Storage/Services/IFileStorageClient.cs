using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Kernel.Contracts.Storage.Entities;

namespace Mercurius.Kernel.Contracts.Storage.Services
{
    public interface IFileStorageClient
    {
        string GetFile(string filePath, CompressMode mode = CompressMode.Small);
    }
}
