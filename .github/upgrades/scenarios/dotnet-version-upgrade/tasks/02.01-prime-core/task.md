# 02.01-prime-core: Convert Prime.Core SDK style

## Objective
Convert `基础/Mercurius.Prime.Core/Mercurius.Prime.Core.csproj` to SDK-style, preserve net48 and exact current package versions, and validate it before converting dependents.

## Scope
- One Tier 1 leaf project; 15 packages currently declared in `packages.config`.
- Contains `System.Web`, legacy configuration, Enterprise Library packages, and explicit assembly references. These are findings for later framework migration; this task is format-only.

## Steps
1. Use `convert_project_to_sdk_style` (do not hand-rewrite XML).
2. Confirm target framework remains net48 and package versions are unchanged; confirm its `packages.config` is removed.
3. Build the converted project directly with Visual Studio MSBuild and resolve only conversion-caused issues.
4. Record results in progress-details.md.
