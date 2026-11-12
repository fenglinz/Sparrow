# SDK-Style Conversion Phase

## Changes
- Converted all nine projects in `Mercurius.CodeBuilder.sln` to SDK-style, using the dedicated conversion tool and dependency order across five tiers. All original projects still target `net48` at the end of this structural phase.
- Migrated project package manifests to PackageReference and removed all in-solution project-local `packages.config` files. An audit found and removed leftover manifests in CodeBuilder.Core, Prime.DataProcess, DbMetadata, and CSharp after verifying all listed package IDs and versions matched PackageReference entries.
- Preserved project references, WPF/WinForms capabilities, resources, and other existing project behavior. Did not introduce Central Package Management.
- Applied the user-authorized, narrow Oracle security fix in UI: Oracle.ManagedDataAccess 21.7.0 -> 21.9.0, the first version patched for GHSA-5pm2-9mr2-3frq / CVE-2023-21893; retained ODP.NET functionality and assembly identity. Removed the stale explicit old Oracle assembly HintPath.
- Fixed conversion/build warnings without suppressions: initialized Prime.Data's pre-existing null-default field explicitly, changed DataProcess NPOI header styling to `IFont.IsBold = true`, and removed the unused `ViewModelBase._buildEvent` field/using.

## Validation
- Each dependency tier was directly built with Visual Studio MSBuild; tier 4 and tier 5 targeted builds passed.
- Final full `Mercurius.CodeBuilder.sln` Debug restore/build passed after all nine conversions and warning fixes. No compiler or NuGet warnings remained. The UI post-build script still prints existing missing `*.xml` and `*.manifest` wildcard copy messages.
- Verified all nine projects are SDK-style, retain `net48`, and have no project-local `packages.config`. Ten `packages.config` files remain in other repository projects outside this solution's scope.
- Test discovery found no test projects in the solution.
- The pre-existing untracked `packages/` cache was temporarily stashed around branch sync and restored; it was excluded from commits.

## Issues
- Tier 3/tier 4 conversion had left four stale manifests despite equivalent PackageReference entries; verified all package IDs and versions matched before deleting the manifests.
- UI's first conversion build surfaced NU1903 for Oracle 21.7 and CS0169 for an unused field. Security research established 21.9.0 as the first patched package version and confirmed compatibility with net48 and the existing assembly identity. The unused field was then removed, and a clean targeted build plus full solution build passed.
- `plugins` had no commits to merge at the tier-5 task boundary; packages cache was restored after the no-op sync check.
