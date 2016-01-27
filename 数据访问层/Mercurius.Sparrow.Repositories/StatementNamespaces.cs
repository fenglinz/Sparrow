using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Siskin.Repositories
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
			public static readonly StatementNamespace LoggerNamespace = "Mercurius.Siskin.Repositories.Core.Logger";

			/// <summary>
			/// 字典管理相关的Satement命名空间。
			/// </summary>
			public static readonly StatementNamespace DictionaryNamespace = "Mercurius.Siskin.Repositories.Core.Dictionary";

			/// <summary>
			/// 国际化信息管理相关的Satement命名空间。
			/// </summary>
			public static readonly StatementNamespace GlobalizationNamespace = "Mercurius.Siskin.Repositories.Core.Globalization";

			/// <summary>
			/// 工具相关的Satement命名空间。
			/// </summary>
			public static readonly StatementNamespace RepositoryUtilsNamespace = "Mercurius.Siskin.Repositories.Core.RepositoryUtils";

			/// <summary>
			/// 系统设置相关的Satement命名空间。
			/// </summary>
			public static readonly StatementNamespace SystemsettingNamespace = "Mercurius.Siskin.Repositories.Core.SystemSetting";
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
			public static readonly StatementNamespace ButtonNamespace = "Mercurius.Siskin.Repositories.RBAC.Button";

			/// <summary>
			/// 首页快捷方式相关的Statement命名空间。
			/// </summary>
			public static readonly StatementNamespace HomeShortcutNamespace = "Mercurius.Siskin.Repositories.RBAC.HomeShortcut";

			/// <summary>
			/// 组织结构管理相关的Statement命名空间。
			/// </summary>
			public static readonly StatementNamespace OrganizationNamespace = "Mercurius.Siskin.Repositories.RBAC.Organization";

			/// <summary>
			/// 权限管理相关的Statement命名空间。
			/// </summary>
			public static readonly StatementNamespace PermissionNamespace = "Mercurius.Siskin.Repositories.RBAC.Permission";

			/// <summary>
			/// 回收站相关的Statement命名空间。
			/// </summary>
			public static readonly StatementNamespace RecyclebinNamespace = "Mercurius.Siskin.Repositories.RBAC.Recyclebin";

			/// <summary>
			/// 角色管理相关的Statement命名空间。
			/// </summary>
			public static readonly StatementNamespace RoleNamespace = "Mercurius.Siskin.Repositories.RBAC.Role";

			/// <summary>
			/// 用户管理相关的Statement命名空间。
			/// </summary>
			public static readonly StatementNamespace UserNamespace = "Mercurius.Siskin.Repositories.RBAC.User";
		}

		#endregion
	}
}
