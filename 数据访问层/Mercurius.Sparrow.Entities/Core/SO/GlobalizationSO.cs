namespace Mercurius.Sparrow.Entities.Core.SO
{
    /// <summary>
    /// 本地化信息查询对象。
    /// </summary>
    public class GlobalizationSO : SearchObject
    {
        #region 属性

        /// <summary>
        /// 获取或者设置区域。
        /// </summary>
        public string AreaName { get; set; }

        /// <summary>
        /// 获取或者设置控制器。
        /// </summary>
        public string ControllerName { get; set; }

        /// <summary>
        /// 获取或者设置视图。
        /// </summary>
        public string View { get; set; }

        /// <summary>
        /// 获取或者设置键。
        /// </summary>
        public string Key { get; set; }

        #endregion
    }
}
