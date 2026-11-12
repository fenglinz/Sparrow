# 02.02-prime-data: Convert Prime.Data SDK style

## Objective
Convert `基础/Mercurius.Prime.Data/Mercurius.Prime.Data.csproj` to SDK-style, preserving net48 and package versions, then validate the dependency on converted Prime.Core.

## Scope
- Tier 2 project; 32 packages; project reference to `Mercurius.Prime.Core`.
- `IBatisNet45` 1.6.2 and `System.Web` are migration risks for later framework work; do not replace them or change behavior in this format-only task.

## Steps
1. Convert with the dedicated tool after 02.01 succeeds.
2. Confirm net48, package versions, project reference, and removal of this project's `packages.config`.
3. Build Prime.Data directly with Visual Studio MSBuild.
4. Record results in progress-details.md.
