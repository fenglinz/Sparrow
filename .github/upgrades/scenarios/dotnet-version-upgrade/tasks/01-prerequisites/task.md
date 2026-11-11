# 01-prerequisites: Verify .NET 10 toolchain and baseline

Confirm the .NET 10 SDK and Windows Desktop targeting support are available, inspect `global.json` for SDK constraints, and capture the solution's baseline restore/build and discovered test-project status. The solution targets Windows desktop frameworks in part, so the final project TFMs must use `net10.0-windows` where WPF or WinForms APIs require it and `net10.0` for framework-neutral projects.

**Done when**: The required SDK/targeting packs and `global.json` constraints are documented; baseline build and test discovery outcomes (including existing warnings) and required package-cache handling are recorded; no application code or project files are modified.

## Scope Inventory
- **Projects affected**: Mercurius.CodeBuilder.sln contains 9 projects; the assessment reports all target `net48` and use legacy, non-SDK-style project format.
- **Distinct concerns**: Confirm .NET 10 SDK availability, SDK selection, Windows Desktop/WPF/WinForms targeting requirements, baseline restore/build, and test-project discovery. No application source or project files are to be changed in this task.
- **Framework settings**: No `global.json` exists in the repository. The .NET 10 SDK is installed (`10.0.403`); .NET 10 runtimes are `10.0.14`; the Windows Desktop reference pack `Microsoft.WindowsDesktop.App.Ref` `10.0.14` is present. .NET 10 SDK validation returned “Compatible SDK found”. WPF/WinForms projects will require Windows-targeted TFMs (`net10.0-windows`) where those APIs are used; other projects should use `net10.0` unless project-level investigation shows otherwise.
- **Test discovery**: Test project discovery returned no test project paths for the 9 projects in the solution.
- **Baseline build**: The first build attempt failed because the user-stashed, untracked `packages/` directory was absent; the missing file was `packages/System.Text.Json.6.0.6/build/System.Text.Json.targets`, and `Mercurius.Prime.Boot` showed unresolved package-dependent Swagger/Autofac symbols. Restoring the original cache from the preserved stash enabled a successful full solution build. This was an environment/cache issue, not a source-code change.
- **Build tooling**: Visual Studio MSBuild is available at `C:\Program Files\Microsoft Visual Studio\18\Community\MSBuild\Current\Bin\amd64\MSBuild.exe`. Use it for this legacy solution and for WPF/WinForms resource/XAML builds; use NuGet restore with packages.config support before baseline validation.

## Objective
Confirm the .NET 10 toolchain and capture a meaningful baseline without modifying application code.

## Validation Steps
1. Restore the package cache from the preserved stash for the baseline build; keep it unstaged and out of upgrade commits.
2. Rebuild the full solution with Visual Studio MSBuild and record all remaining baseline errors/warnings.
3. Confirm test-project discovery result and the absence of `global.json`.

## Baseline build outcome
After restoring the package cache from the preserved stash into the working tree, the Visual Studio solution build succeeded: 4 projects built, 0 failed, 5 up to date. Existing baseline warnings: `NU1903` for Oracle.ManagedDataAccess 21.7.0 (GHSA-5pm2-9mr2-3frq), `CS0618` for `NPOI`'s deprecated `IFont.Boldweight`, and `CS0169` for the unused `ViewModelBase._buildEvent` field. No application files were modified in this prerequisite task.
- **Package-cache handling**: The original `packages/` contents remain safely stored in `stash@{0}` and were rehydrated from that stash only to make the baseline build reproducible. Keep `packages/` out of upgrade commits; the user chose not to include it.
- **Tests**: Test-project discovery returned no test projects within the solution's 9 projects, so there are no solution test projects to run.
