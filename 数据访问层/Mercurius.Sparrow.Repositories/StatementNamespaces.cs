using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Sparrow.Repositories
{
	/// <summary>
	/// Statement命名空间信息。
	/// </summary>
	public static class StatementNamespaces
	{
		#region 基础信息模块

		/// <summary>
		/// 基础信息模块相关的Satement命名空间。
		/// </summary>
		public static class Core
		{
			/// <summary>
			/// 日志管理相关的Satement命名空间。
			/// </summary>
			public static readonly StatementNamespace LoggerNamespace = "Mercurius.Sparrow.Repositories.Core.Logger";

            /// <summary>
            /// 操作记录相关的Statement命名空间。
            /// </summary>
		    public static readonly StatementNamespace OperationRecordNamespace = "Mercurius.Sparrow.Repositories.Core.OperationRecord";

			/// <summary>
			/// 字典管理相关的Satement命名空间。
			/// </summary>
			public static readonly StatementNamespace DictionaryNamespace = "Mercurius.Sparrow.Repositories.Core.Dictionary";

			/// <summary>
			/// 国际化信息管理相关的Satement命名空间。
			/// </summary>
			public static readonly StatementNamespace GlobalizationNamespace = "Mercurius.Sparrow.Repositories.Core.Globalization";

			/// <summary>
			/// 工具相关的Satement命名空间。
			/// </summary>
			public static readonly StatementNamespace RepositoryUtilsNamespace = "Mercurius.Sparrow.Repositories.Core.RepositoryUtils";

			/// <summary>
			/// 系统设置相关的Satement命名空间。
			/// </summary>
			public static readonly StatementNamespace SystemsettingNamespace = "Mercurius.Sparrow.Repositories.Core.SystemSetting";
		}

		#endregion

		#region 基于角色的权限模块

		/// <summary>
		/// 基于角色的访问控制相关的Statement命名空间。
		/// </summary>
		public static class RBAC
		{
			/// <summary>
			/// 按钮相关的Statement命名空间。
			/// </summary>
			public static readonly StatementNamespace ButtonNamespace = "Mercurius.Sparrow.Repositories.RBAC.Button";

			/// <summary>
			/// 首页快捷方式相关的Statement命名空间。
			/// </summary>
			public static readonly StatementNamespace HomeShortcutNamespace = "Mercurius.Sparrow.Repositories.RBAC.HomeShortcut";

			/// <summary>
			/// 组织结构管理相关的Statement命名空间。
			/// </summary>
			public static readonly StatementNamespace OrganizationNamespace = "Mercurius.Sparrow.Repositories.RBAC.Organization";

			/// <summary>
			/// 权限管理相关的Statement命名空间。
			/// </summary>
			public static readonly StatementNamespace PermissionNamespace = "Mercurius.Sparrow.Repositories.RBAC.Permission";

			/// <summary>
			/// 回收站相关的Statement命名空间。
			/// </summary>
			public static readonly StatementNamespace RecyclebinNamespace = "Mercurius.Sparrow.Repositories.RBAC.Recyclebin";

			/// <summary>
			/// 角色管理相关的Statement命名空间。
			/// </summary>
			public static readonly StatementNamespace RoleNamespace = "Mercurius.Sparrow.Repositories.RBAC.Role";

			/// <summary>
			/// 用户管理相关的Statement命名空间。
			/// </summary>
			public static readonly StatementNamespace UserNamespace = "Mercurius.Sparrow.Repositories.RBAC.User";

            /// <summary>
            /// 用户组管理相关的Statement命名空间。
            /// </summary>
            public static readonly StatementNamespace UserGroupNamespace = "Mercurius.Sparrow.Repositories.RBAC.UserGroup";
        }

		#endregion
	}
}
