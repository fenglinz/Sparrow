using System;
using System.Collections.Generic;
using System.Text;
using Mercurius.Prime.Core.Configuration;
using Serilog;
using Serilog.Core;
using Serilog.Events;
using Serilog.Sinks.Elasticsearch;

namespace Mercurius.Prime.Core.Log
{
    /// <summary>
    /// 基于Serilog的日志记录组件。
    /// </summary>
    public class SerilogLogger : AbstractLogger
    {
        #region Properties

        public Logger Logger { get; private set; }

        #endregion

        #region Constructor

        /// <summary>
        /// 默认构造方法
        /// </summary>
        public SerilogLogger()
        {
            this.Logger = new LoggerConfiguration()
                .Enrich.FromLogContext()
                .WriteTo.Elasticsearch(new ElasticsearchSinkOptions(new Uri(PlatformConfig.Instance.Log?.ElasticSearchUrl))
                {
                    AutoRegisterTemplate = true,
                })
                .CreateLogger();
        }

        #endregion

        protected override void Log(string message, Level level = Level.Info)
        {
            this.Logger.Write(Enum.Parse<LogEventLevel>(level.ToString(), true), message);
        }
    }
}
