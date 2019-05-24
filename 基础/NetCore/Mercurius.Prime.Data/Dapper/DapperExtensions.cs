using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using Dapper;

namespace Mercurius.Prime.Data.Service
{
    /// <summary>
    /// 
    /// </summary>
    public static class DapperExtensions
    {
        public static async Task<int> Execute(this CommandText command, object paramObject, CommandType commandType = CommandType.Text)
        {
            if (command == null)
            {
                return -1;
            }

            return await command.Connection.ExecuteAsync(command.Text, paramObject, commandType: commandType);
        }

        public static async Task<T> QueryForObject<T>(this CommandText command, object paramObject, CommandType commandType = CommandType.Text)
        {
            if (command == null)
            {
                return default;
            }

            return await command.Connection.QueryFirstOrDefaultAsync<T>(command.Text, paramObject, commandType: commandType);
        }

        public static async Task<IEnumerable<T>> QueryForList<T>(this CommandText command, object paramObject, CommandType commandType = CommandType.Text)
        {
            if (command == null)
            {
                return default;
            }

            return await command.Connection.QueryAsync<T>(command.Text, paramObject, commandType: commandType);
        }
    }
}
