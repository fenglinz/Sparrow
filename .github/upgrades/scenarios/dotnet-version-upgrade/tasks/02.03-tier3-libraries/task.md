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
