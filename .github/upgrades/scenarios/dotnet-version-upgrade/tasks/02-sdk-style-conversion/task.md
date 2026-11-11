# 02-sdk-style-conversion: Convert legacy project files

Convert all nine non-SDK-style projects to SDK-style while keeping their existing .NET Framework target. Migrate each `packages.config` dependency set to `PackageReference`, retain Windows Desktop/WPF/WinForms project capabilities, and preserve project references and build properties. Do not introduce Central Package Management during this conversion.

**Done when**: All nine projects load as SDK-style projects on their original target, package restore succeeds, and the solution and its tests build without new warnings or errors.
