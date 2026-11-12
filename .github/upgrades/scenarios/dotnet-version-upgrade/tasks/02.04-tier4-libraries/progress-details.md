# Tier 4 SDK-Style Conversion

## Changes
- Confirmed the dedicated conversion tool had already converted `Mercurius.CodeBuilder.Java`, `Mercurius.CodeBuilder.DbMetadata`, and `Mercurius.CodeBuilder.CSharp` to SDK-style projects while retaining `net48` and existing project references.
- Verified DbMetadata's 12 and CSharp's 3 PackageReference IDs and versions matched their original manifests exactly; Java has no NuGet packages.
- Removed stale manifests after confirming equivalent PackageReference entries and matching versions in `CodeBuilder/Mercurius.CodeBuilder.Core`, `基础/Mercurius.Prime.DataProcess`, `CodeBuilder/Mercurius.CodeBuilder.DbMetadata`, and `CodeBuilder/Mercurius.CodeBuilder.CSharp`.
- Corrected the tier-3 progress document to acknowledge the two leftover manifests and their cleanup in this SDK conversion phase.

## Validation
- VS MSBuild targeted restore/build succeeded for Java, DbMetadata, and CSharp (WPF), using Debug configuration; builds completed without warnings.
- Full `Mercurius.CodeBuilder.sln` VS MSBuild restore/build succeeded. The existing `CodeBuilder.UI\bin\Debug\*.manifest` not-found message remains, but MSBuild completed successfully.
- Searched the repository for project-local `packages.config`: none remain in the nine in-solution projects converted in this phase. Ten manifests remain in other projects outside this solution's conversion scope.
- No test projects were discovered in the solution at baseline.

## Issues
- An initial PowerShell validation loop used `$p` as a variable name, conflicting with PowerShell's automatic `$PROFILE` alias behavior and failed before building; rerunning with `$projectPath` succeeded for all three projects.
- A repository-wide manifest scan found ten remaining packages.config files in projects outside this solution conversion scope; they were intentionally left untouched.
