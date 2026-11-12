# Prime.Data SDK-Style Conversion

## Changes
- Converted `基础/Mercurius.Prime.Data/Mercurius.Prime.Data.csproj` with the dedicated SDK-style conversion tool.
- Moved all 35 `packages.config` package entries into `PackageReference`, preserving each package ID and version (including IBatisNet45 1.6.2 and the System.* compatibility packages).
- Removed the project-local `packages.config`.
- Preserved the net48 target, Prime.Core project reference, System.Web reference, source/resource inclusion, and existing functionality.
- Fixed the conversion-exposed CS0649 warning in `Service/DtoUtils.cs` by explicitly initializing the unused `autoMapperConfiguration` field to its existing default value (`null`); this does not change runtime behavior.

## Validation
- Direct Visual Studio MSBuild restore/build succeeded for Prime.Data and its Prime.Core dependency.
- Rebuilt after the warning fix; Prime.Data and Prime.Core built without warnings.
- Confirmed the SDK-style project targets net48, references `Mercurius.Prime.Core`, and no longer has a project-local `packages.config`.
- `get_project_dependencies` confirms all original package versions are represented in Prime.Data.csproj.
- No test projects were discovered in the solution at baseline.

## Issues
- Initial converted build reported CS0649 (`DtoUtils.autoMapperConfiguration` was unassigned). Explicit initialization to null preserved the field's prior CLR default while eliminating the warning.
