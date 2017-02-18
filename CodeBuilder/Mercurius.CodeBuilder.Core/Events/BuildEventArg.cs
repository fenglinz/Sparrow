namespace Mercurius.CodeBuilder.Core.Events
{
    /// <summary>
    /// 创建事件信息。
    /// </summary>
    public class BuildEventArg
    {
        #region 属性

        /// <summary>
        /// 创建状态。
        /// </summary>
        public Status Status { get; set; }

        /// <summary>
        /// 信息。
        /// </summary>
        public string Message { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="status">状态</param>
        /// <param name="message">信息</param>
        public BuildEventArg(Status status, string message = null)
        {
            this.Status = status;
            this.Message = message;
        }

        #endregion
    }

    /// <summary>
    /// 状态枚举。
    /// </summary>
    public enum Status
    {
        /// <summary>
        /// 开始。
        /// </summary>
        Begin,

        /// <summary>
        /// 正在进行。
        /// </summary>
        Building,

        /// <summary>
        /// 成功。
        /// </summary>
        Success,

        /// <summary>
        /// 失败。
        /// </summary>
        Failure
    }
}
