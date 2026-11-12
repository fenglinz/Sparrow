# 02.05-tier5-ui: Convert Windows UI project

## Objective
Convert `CodeBuilder/Mercurius.CodeBuilder.UI/Mercurius.CodeBuilder.UI.csproj` to SDK-style after all libraries validate, preserving net48 and exact dependency versions.

## Scope
- Tier 5 Windows UI application; WinForms and WPF, designer resources, references all CodeBuilder libraries and the Prime libraries; 28 packages.
- User authorized researching and fixing Oracle.ManagedDataAccess security findings; use the least disruptive patched version, retain Oracle ODP.NET behavior, and avoid unrelated package changes.

## Steps
1. Convert using the dedicated tool only after tier 4 completes.
2. Build directly and preserve Windows Forms/WPF capabilities, resources, project references, and packages.
3. Verify target remains net48 and packages.config is removed.
4. Run final solution build and test discovery; record outcomes.

## Research Findings
- Confirmed project is still old-style `Mercurius.CodeBuilder.UI.csproj`, targeting .NET Framework 4.8 (`v4.8`), with `OutputType=WinExe` and AnyCPU Debug configuration.
- `get_project_dependencies` found no CPM or imported local package targets; package management uses `packages.config`. The manifest contains 28 packages. Preserve the exact versions, including `Oracle.ManagedDataAccess` 21.7.0, Prism 8.1.97 components, Unity 5.11.x, Microsoft.Expression.Drawing 3.0.0, and remaining dependencies.
- Seven project references point to Prime.Core, Prime.Data, DataProcess, CodeBuilder.Core, CSharp, DbMetadata, and Java, all converted lower-tier libraries.
- Project includes WPF XAML views/themes/App/Shell, WinForms/system drawing references, `Properties/Resources.resx`, and `Images/app.ico`. Must use full Visual Studio MSBuild for net48, WPF/WinForms/resource builds.
- Conversion is structural only: retain `net48`, package versions, WinExe, desktop capabilities, startup object, and reference relationships; do not address incompatible-package findings in this task.
- Security research: GHSA-5pm2-9mr2-3frq / CVE-2023-21893 lists Oracle.ManagedDataAccess versions `>=21.0.0, <21.9.0` as affected, with `21.9.0` as the first patched release. NuGet confirms 21.9.0 supports .NET Framework 4.7.2+, and the package assembly remains `Oracle.ManagedDataAccess, Version=4.122.21.1`, preserving the existing App.config provider type identity. The UI project registers and uses the existing Oracle metadata/data-provider path; no provider replacement is needed.
- Following the user's authorization, updated only the UI project's Oracle package to 21.9.0 and removed the converter-retained explicit 21.7 assembly HintPath so PackageReference resolves the patched DLL. No Oracle config changes were necessary.
- First post-upgrade build removed NU1903 but exposed existing CS0169 for `ViewModelBase._buildEvent`. Search confirmed the field is never read or assigned in the base class; removed it and its now-unused `Mercurius.CodeBuilder.Core.Events` using. `CodeBuilderViewModel2` has its own separate used field and was left untouched.
