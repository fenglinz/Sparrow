# 02.04-tier4-libraries: Convert dependency-tier 4 libraries

## Objective
Convert `Mercurius.CodeBuilder.Java`, `Mercurius.CodeBuilder.DbMetadata`, and `Mercurius.CodeBuilder.CSharp` sequentially, preserving net48, exact package versions, and existing project references.

## Scope
- Tier 4 projects depend on lower tiers; Java has no NuGet packages, DbMetadata has 12 package entries, CSharp has 3. CSharp uses WPF.
- Vulnerable/deprecated/incompatible package findings are deferred to later TFM migration tasks; do not update/remove them during structural conversion.

## Steps
1. Convert each project sequentially after tier 3 validates.
2. Build each project directly with Visual Studio MSBuild, confirming net48, references, unchanged package versions, and no project-local packages.config.
3. Record results.
