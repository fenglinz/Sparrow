﻿using System;
using System.Linq;
using Mercurius.Infrastructure.Ado;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Entities.Core.SO;
using Mercurius.Sparrow.Services.Support;
using static Mercurius.Sparrow.Repositories.StatementNamespaces.Core;

namespace Mercurius.Sparrow.Services.Core
{
    /// <summary>
    /// 日志服务接口实现。
    /// </summary>
    [Module("日志管理")]
    public class LoggerService : ServiceSupport, ILoggerService
	{
		#region ILoggerService接口实现

		/// <summary>
		/// 获取日志表信息的分区信息。
		/// </summary>
		/// <returns>分区信息列表</returns>
		public ResponseCollection<Partition> GetPartitions()
		{
			return this.InvokeService(
                nameof(GetPartitions),
				() =>
				{
					var partitions = this.Persistence.QueryForDataTable(RepositoryUtilsNamespace, "GetPartitions", "SystemLog").GetDatas<Partition>();

					partitions = (from p in partitions
								  let d = p.HightValue.Length > 20 ? DateTime.Parse(p.HightValue.Substring(10, 10)).AddDays(-1) : DateTime.Now
								  where
									  p.HightValue.Length > 10
								  orderby d ascending
								  select new Partition { Name = p.Name, HightValue = d.ToString("yyyy-MM-dd") }).ToList();

					return partitions;
				},
				false);
		}

		/// <summary>
		/// 清空日志信息。
		/// </summary>
		/// <returns>操作结果</returns>
		public Response ClearLogs()
		{
			return this.InvokeService(
                nameof(ClearLogs),
				() =>
				{
					this.Persistence.Delete(LoggerNamespace, "ClearLogs");

					this.ClearCache<Log>();
				});
		}

		/// <summary>
		/// 获取日志详细信息。
		/// </summary>
		/// <param name="partition">表分区名称</param>
		/// <param name="id">日志编号</param>
		/// <returns>日志信息</returns>
		public Response<Log> GetLog(string partition, string id)
		{
			return this.InvokeService(nameof(GetLog), () => this.Persistence.QueryForObject<Log>(LoggerNamespace, "GetLog", new { Partition = partition, Id = id }), true, partition, id);
		}

		/// <summary>
		/// 获取日志信息。
		/// </summary>
		/// <param name="so">日志查询条件</param>
		/// <returns>日志信息列表</returns>
		public ResponseCollection<Log> GetLogs(LogSO so)
		{
			var totalRecords = 0;
			var result = this.InvokeService(nameof(GetLogs), () => this.Persistence.QueryForPaginatedList<Log>(LoggerNamespace, "GetLogs", out totalRecords, so), false, so);

			result.TotalRecords = totalRecords;

			return result;
		}

		#endregion
	}
}
