# Tier 5 UI SDK-Style Conversion

## Changes
- Converted `CodeBuilder/Mercurius.CodeBuilder.UI/Mercurius.CodeBuilder.UI.csproj` to SDK-style via the dedicated conversion tool, preserving `net48`, WinExe output, WPF and WinForms support, icon/resources, startup object, and all seven project references.
- Migrated all 28 dependencies to PackageReference and removed the project's `packages.config`.
- Following the user's explicit authorization, upgraded only `Oracle.ManagedDataAccess` from 21.7.0 to 21.9.0, the first patched version for GHSA-5pm2-9mr2-3frq / CVE-2023-21893. Removed the stale explicit 21.7 HintPath so restore/build uses the patched PackageReference asset. Verified the package retains assembly identity 4.122.21.1 used by existing App.config provider configuration.
- Removed the unused `ViewModelBase._buildEvent` field and its unused `Mercurius.CodeBuilder.Core.Events` using; the separate, actively used field in `CodeBuilderViewModel2` remains unchanged.

## Validation
- VS MSBuild targeted restore/build for UI passed after package change; the NU1903 security warning disappeared. The first build then exposed CS0169 in `ViewModelBase`; after removing the unused field, the targeted build completed without code/package warnings.
- Full `Mercurius.CodeBuilder.sln` VS MSBuild restore/build passed in Debug. Only existing post-build copy messages about absent `*.xml` and `*.manifest` files were printed; no compiler or NuGet warnings were reported.
- Verified project is SDK-style, still targets `net48`, retains WinForms and WPF flags, uses Oracle ManagedDataAccess 21.9.0 with no old explicit assembly reference, and has no project-local packages.config.
- Test-project discovery found no test projects in the solution.

## Issues
- `Oracle.ManagedDataAccess` 21.7.0 was flagged by NU1903; security advisory research established 21.9.0 as the first patched version. The patched package is compatible with net48 and keeps the configured assembly identity, so no provider replacement or config behavior change was required.
- Existing CS0169 for the unused base-class field was fixed without suppressing warnings or altering the active derived view-model event field.
