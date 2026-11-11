# Prerequisites Verification

## Changes
- No application source files, project files, or package references were modified.
- Recorded the explicit user decision to remove legacy ASP.NET Web API and Swagger components from `Mercurius.Prime.Boot` in the scenario instructions and plan.
- Restored the existing `packages/` cache from the preserved Git stash into the working tree to enable the baseline build. The stash remains intact; do not stage or commit the restored cache.

## Environment
- .NET SDK: `10.0.403`.
- .NET runtime: `10.0.14` (`Microsoft.NETCore.App`, `Microsoft.AspNetCore.App`).
- Windows Desktop reference pack: `Microsoft.WindowsDesktop.App.Ref` `10.0.14`.
- No repository `global.json` found.
- Visual Studio MSBuild is selected for the legacy solution, WPF, and WinForms build.

## Validation
- Baseline Visual Studio solution build: succeeded; 4 projects built, 0 failed, 5 up to date.
- Existing baseline warnings: `NU1903` Oracle.ManagedDataAccess 21.7.0 (GHSA-5pm2-9mr2-3frq); `CS0618` NPOI `IFont.Boldweight` is deprecated; `CS0169` `ViewModelBase._buildEvent` is unused. These are pre-existing, and no application projects were modified in this prerequisite task.
- Test project discovery found no test projects in the solution; therefore there was no baseline test suite to run.
- Initial build attempt before restoring the cached packages failed because the stashed `packages/` folder was unavailable in the working tree. Rehydrating that cache resolved the missing-package build failure.
