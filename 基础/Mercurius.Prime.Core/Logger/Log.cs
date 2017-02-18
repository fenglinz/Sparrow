using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Prime.Core.Logger
{
    /// <summary>
    /// 日志信息。
    /// </summary>
    [Table("SystemLog")]
    public class Log : EntityBase
    {
        #region 属性

        /// <summary>
        /// 日志编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants)
            , ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Id { get; set; }

        /// <summary>
        /// 登录用户编号。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants)
            , ErrorMessageResourceName = "MaxStringLength")]
        public virtual string LogOnId { get; set; }

        /// <summary>
        /// 用户登录IP地址。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants)
            , ErrorMessageResourceName = "MaxStringLength")]
        public virtual string LogOnIP { get; set; }

        /// <summary>
        /// 模块名称。
        /// </summary>
        [StringLength(100, ErrorMessageResourceType = typeof(Constants)
            , ErrorMessageResourceName = "MaxStringLength")]
        public virtual string ModelName { get; set; }

        /// <summary>
        /// 日志概要信息。
        /// </summary>
        [StringLength(500, ErrorMessageResourceType = typeof(Constants)
            , ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Summary { get; set; }

        /// <summary>
        /// 日志详情。
        /// </summary>
        public virtual string Details { get; set; }

        /// <summary>
        /// 发生时间。
        /// </summary>
        public virtual DateTime OccurrenceDateTime { get; set; }

        /// <summary>
        /// 日志级别。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants)
            , ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Level { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 登录名。
        /// </summary>
        public string LogOnName { get; set; }

        #endregion

        #region 公开方法

        /// <summary>
        /// 创建Log对象。
        /// </summary>
        /// <param name="model">模块名称</param>
        /// <param name="summary">日志概要</param>
        /// <param name="details">日志详情</param>
        /// <param name="level">日志级别</param>
        /// <returns>Log对象</returns>
        public static Log Create(string model, string summary, string details, Level level)
        {
            return new Log
            {
                Id = Guid.NewGuid().ToString(),
                ModelName = model,
                Summary = summary,
                Details = details,
                Level = level.ToString(),
                OccurrenceDateTime = DateTime.Now
            };
        }

        #endregion
    }
}
