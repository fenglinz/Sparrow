# 02.03-tier3-libraries: Convert dependency-tier 3 libraries

## Objective
Convert `CodeBuilder/Mercurius.CodeBuilder.Core`, `基础/Mercurius.Prime.DataProcess`, and `基础/Mercurius.Prime.Boot` sequentially, preserving each net48 target and all current package versions. Validate before moving to the next tier.

## Scope
- Tier 3 dependencies include Prime.Core/Data. CodeBuilder.Core uses WPF; Boot uses System.Web and legacy MVC/Web API/Swagger packages; DataProcess uses NPOI.
- No framework/API migration or package upgrades here. Do not execute the later authorized Web API/Swagger removal during this format-only task; it is scoped to the subsequent library migration task. Preserve WPF, MVC/session, and all other behavior.

## Steps
1. Convert and build each project one at a time with the dedicated tool and Visual Studio MSBuild.
2. Preserve net48, package versions, references, and project capabilities; check each packages.config is removed.
3. Record per-project build and conversion details.

## Research Findings
- `get_project_dependencies` confirms all package versions originate from each project's `packages.config`; no CPM is in use.
- `Mercurius.CodeBuilder.Core`: 3 packages (`CommonServiceLocator` 2.0.6, `Newtonsoft.Json` 13.0.1, `Prism.Core` 8.1.97); WPF references; project refs to Prime.Core and Prime.Data. Assessment: 16 total issues, primarily WPF/legacy configuration and later TFM/package migration.
- `Mercurius.Prime.DataProcess`: 3 packages (`NPOI` 2.5.6, `Portable.BouncyCastle` 1.9.0, `SharpZipLib` 1.3.3); refs to Prime.Core/Data. Assessment: 6 total issues, with no API findings in this format-only phase.
- `Mercurius.Prime.Boot`: 25 packages, including MVC (`Microsoft.AspNet.Mvc`, `Autofac.Mvc5`), legacy Web API (`Microsoft.AspNet.WebApi*`, `Autofac.WebApi2`, `FromHeaderAttribute`) and `Swagger-Net`; refs to Prime.Core/Data and System.Web. Assessment: 123 issues, including 79 System.Web issues. Do not remove Web API/Swagger components here: the user-authorized removal is reserved for the later Prime.Boot framework-migration task. Preserve MVC, session-state, and other System.Web code.
- All three projects still target net48 at the start of this tier. Package versions and target frameworks must stay unchanged; use the SDK conversion tool only and validate each one sequentially with VS MSBuild.
