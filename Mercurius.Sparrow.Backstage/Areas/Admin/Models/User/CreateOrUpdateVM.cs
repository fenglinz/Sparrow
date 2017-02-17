using System.Collections.Generic;
using System.Linq;
using UserInfo = Mercurius.Kernel.Contracts.RBAC.Entities.User;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Models.User
{
    /// <summary>
    /// 添加或者编辑用户信息视图模型。
    /// </summary>
    public class CreateOrUpdateVM
    {
        #region 字段

        private IList<string> _checkValues;

        #endregion

        #region 属性

        /// <summary>
        /// 用户信息。
        /// </summary>
        public UserInfo User { get; set; }

        /// <summary>
        /// 选择项。
        /// </summary>
        public IList<string> CheckValues
        {
            get
            {
                return this._checkValues;
            }

            set
            {
                if (this._checkValues != value)
                {
                    this._checkValues = value;

                    var values = from v in value
                                 let vs = v.Split('|')
                                 group vs[0] by vs[1] into g
                                 select g;

                    foreach (var item in values)
                    {
                        switch (item.Key)
                        {
                            case "所属部门":
                                this.Departments = item.ToArray();

                                break;

                            case "所属角色":
                                this.Roles = item.ToArray();

                                break;
                        }
                    }
                }
            }
        }

        #endregion

        #region 业务属性

        /// <summary>
        /// 所属部门。
        /// </summary>
        public string[] Departments { get; private set; }

        /// <summary>
        /// 所属角色。
        /// </summary>
        public string[] Roles { get; private set; }

        #endregion
    }
}