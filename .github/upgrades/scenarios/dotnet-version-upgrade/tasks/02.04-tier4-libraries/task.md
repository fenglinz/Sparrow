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

## Research Findings
- `Mercurius.CodeBuilder.Java`: SDK conversion required, net48, zero NuGet packages, references Prime.Core/Data and CodeBuilder.Core; assessment reports only project-format and later target-framework findings (2 total).
- `Mercurius.CodeBuilder.DbMetadata`: net48, 12 packages (`BouncyCastle` 1.8.9, Google.Protobuf 3.21.6, K4os LZ4 packages 1.2.16/1.0.7, MySql.Data 8.0.30, Portable.BouncyCastle 1.9.0, SSH.NET 2020.0.2, and System.* packages); references Prime.Core/Data and CodeBuilder.Core. Assessment reports 19 issues including binding findings and package recommendations/security notices. Keep versions unchanged in this task.
- `Mercurius.CodeBuilder.CSharp`: net48 WPF project, 3 packages (`CommonServiceLocator` 2.0.6, `DotNetZip` 1.16.0, `Prism.Core` 8.1.97); references Prime.Core/Data and CodeBuilder.Core. Assessment reports 7 issues including deprecated/vulnerable package notices, reserved for later framework migration.
- No CPM is reported; package versions currently come from each project's `packages.config`. Keep all three existing TFMs at net48 and preserve project references. Use the dedicated conversion tool serially and VS MSBuild for net48/WPF builds.
- Conversion status check: `Mercurius.CodeBuilder.Java` is already SDK-style/net48 with the three expected project dependencies and no packages.config; `DbMetadata` and `CSharp` are already SDK-style/net48. Their PackageReference versions exactly match the manifests (12 and 3 packages respectively). Targeted Java, DbMetadata, and CSharp (WPF) builds have succeeded using VS MSBuild.
- Audit found stale `packages.config` files remaining after earlier conversions in DataProcess, CodeBuilder.Core, and current DbMetadata/CSharp. Java has no manifest. Remove only these four obsolete manifests after confirming package versions are represented in PackageReference, then revalidate affected builds. Prime.Boot already has no packages.config.
