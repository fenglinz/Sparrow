# Prime.Core SDK-Style Conversion

## Changes
- Converted `基础/Mercurius.Prime.Core/Mercurius.Prime.Core.csproj` using the dedicated SDK-style conversion tool.
- Migrated the existing `packages.config` entries to `PackageReference` in the project file without changing package versions.
- Removed the project-local `packages.config` as part of conversion.
- Retained the original `net48` target and existing System.Web references; no application source or runtime behavior was changed.
- The conversion tool retained an explicit `Compile Remove` item for `WebApi\WebApiClientSupport.cs`, because SDK globbing would otherwise include a source file not previously included by the old project. This item was left untouched pending conversion review.

## Validation
- Direct project build using Visual Studio MSBuild with restore: succeeded; output assembly was produced at `基础/Mercurius.Prime.Core/bin/Debug/net48/Mercurius.Prime.Core.dll`.
- Full solution build using Visual Studio MSBuild with restore: succeeded; dependent projects including the WPF/WinForms UI completed.
- Verified project XML declares `TargetFramework` `net48`, SDK `Microsoft.NET.Sdk`, 16 PackageReference entries; `packages.config` no longer exists.
- `get_project_dependencies` confirms package references now resolve from the project file and preserved the package versions.
- No test projects were discovered in the solution at baseline.

## Issues
- No conversion-related compile failures were reported. The solution build output included a pre-existing publish-copy message for a missing `*.manifest` wildcard; the solution build still completed successfully.
