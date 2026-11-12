# Tier 3 SDK-Style Conversion

## Changes
- Converted `CodeBuilder/Mercurius.CodeBuilder.Core/Mercurius.CodeBuilder.Core.csproj`, `基础/Mercurius.Prime.DataProcess/Mercurius.Prime.DataProcess.csproj`, and `基础/Mercurius.Prime.Boot/Mercurius.Prime.Boot.csproj` using the dedicated SDK-style conversion tool.
- Retained each project's original `net48` target, current package versions, project references, and platform-specific capabilities.
- Removed the project-local `packages.config` files as part of conversion.
- Kept the authorized Web API/Swagger code and package references unchanged in Prime.Boot; their removal remains reserved for the later migration task. MVC, session-state and other System.Web code were not removed.
- Changed `NPOIExporter` from deprecated `IFont.Boldweight = 700` to `IFont.IsBold = true`, preserving the intended bold header styling and removing the existing CS0618 warning.

## Validation
- Direct Visual Studio MSBuild restore/build succeeded for CodeBuilder.Core, DataProcess and Prime.Boot with their converted dependencies.
- Rebuilt DataProcess after the NPOI change; build completed without warnings.
- Prime.Boot build completed without warnings. CodeBuilder.Core build completed without warnings.
- Full `Mercurius.CodeBuilder.sln` Visual Studio MSBuild restore/build succeeded after all three conversions; dependent projects completed as well. The build retains the existing wildcard message for a missing UI `*.manifest` file, but reports successful completion.
- Verified all three project files are SDK-style and keep `net48`; Prime.Boot dependency inspection confirms MVC, Web API and Swagger package references are retained for this format-only phase.
- No test projects were discovered in the solution at baseline.

## Issues
- DataProcess initially reported CS0618 for NPOI `IFont.Boldweight`. Replaced it with `IsBold = true`, then rebuilt successfully without warnings.
