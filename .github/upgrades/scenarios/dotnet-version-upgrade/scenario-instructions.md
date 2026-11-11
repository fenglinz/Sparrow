# .NET Version Upgrade

## Preferences
- **Flow Mode**: Automatic
- **Target Framework**: `net10.0`
- **Preserve Existing Functionality**: Avoid replacing legacy dependencies or implementing behavioral stubs without researching alternatives; pause for explicit authorization when a high-risk replacement is required.

## Source Control
- **Source Branch**: `plugins`
- **Working Branch**: `dotnet-version-upgrade`
- **Pending Changes**: Stashed `packages/` before branch creation; stash message: `Save packages before dotnet-version-upgrade`
- **Commit Strategy**: After Each Task
- **Branch Sync**: Auto (Merge)

## Key Decisions Log
- User chose to stash the pre-existing untracked `packages/` directory rather than include it in the upgrade branch commit.
- User confirmed the proposed .NET 10 upgrade options, including inline resolution of incompatible packages and APIs to preserve functionality.
- User explicitly authorized removing the legacy ASP.NET Web API and Swagger components from `Mercurius.Prime.Boot`; do not replace them with a new Web API or Swagger stack unless asked separately.
- NuGet package cache was temporarily restored from the preserved stash to run baseline validation; keep `packages/` excluded from upgrade commits.

## Build Tool Decisions
- **Mercurius.CodeBuilder.sln**: Visual Studio MSBuild; all projects are legacy non-SDK-style, and the solution includes WPF/WinForms.

## Upgrade Options

### Strategy
- Upgrade Strategy: Bottom-Up (Dependency-First)

### Project Structure
- Project Approach: Class libraries use Multi-targeting while .NET Framework consumers remain; System.Web class libraries use In-place migration.
- Package Management: Per-Project (defer CPM to post-migration)

### Compatibility
- Unsupported Packages: Resolve Inline
- Unsupported API Handling: Fix Inline
- Windows Native APIs: Windows Compatibility Pack
- System.Web Adapters: Use System.Web Adapters
  Skill: migrating-mvc-system-web-adapters

### Modernization
- Configuration Migration: Manual Migration with Mapping Document
- Logging Framework: Migrate to Microsoft.Extensions.Logging
- Dependency Injection: Migrate to Built-in DI Container
- Assembly Binding Redirects: Document and Review Before Removing

## Strategy
**Selected**: Bottom-Up (Dependency-First)
**Rationale**: The 9 .NET Framework projects form a 5-level dependency graph and require tier-by-tier migration and validation.

### Execution Constraints
- Convert legacy project files separately from target framework changes.
- Migrate projects in dependency order; validate each tier before proceeding, including that remaining .NET Framework consumers still build.
- Preserve .NET Framework compatibility on shared class libraries during the transition; use Windows-specific target frameworks for WPF/WinForms projects and libraries that require them.
- Resolve API/package changes inline; do not introduce stubs or high-risk replacements without researching alternatives and obtaining explicit user authorization.
- Defer Central Package Management until the migration is stable; record it as a post-migration recommendation.
- Before changing Prime.Boot, assess its `System.Web` hosting/session components and incompatible ASP.NET packages; adapters alone may not replace these APIs.
- In `Mercurius.Prime.Boot`, remove the authorized legacy ASP.NET Web API and Swagger components and their dedicated references; preserve unrelated functionality and do not assume authorization to remove ASP.NET MVC, Redis session-state behavior, or other System.Web hosting features.
- If removing those components exposes a need to change additional behavior or replace an incompatible legacy feature, research it and ask for authorization before proceeding.