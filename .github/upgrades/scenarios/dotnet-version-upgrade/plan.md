# .NET Version Upgrade Plan

## Overview

**Target**: Upgrade all 9 projects in `Mercurius.CodeBuilder.sln` from .NET Framework 4.8 to .NET 10, preserving the solution's existing functionality.
**Scope**: 9 legacy projects, 91 NuGet packages, approximately 20,007 LOC, and a 5-level dependency graph. All projects currently use non-SDK-style project files.

### Selected Strategy
**Bottom-Up (Dependency-First)** — Upgrade from leaf libraries to the root application, validating each dependency tier before moving upward.
**Rationale**: 9 projects with a 5-level dependency graph, all crossing the .NET Framework-to-modern-.NET boundary.

```text
Tier 1: Mercurius.Prime.Core
		  ↓
Tier 2: Mercurius.Prime.Data
		  ↓
Tier 3: Mercurius.CodeBuilder.Core | Mercurius.Prime.Boot | Mercurius.Prime.DataProcess
		  ↓
Tier 4: Mercurius.CodeBuilder.CSharp | Mercurius.CodeBuilder.DbMetadata | Mercurius.CodeBuilder.Java
		  ↓
Tier 5: Mercurius.CodeBuilder.UI
```

## Upgrade Options

| Option | Selected | Why |
|--------|----------|-----|
| Upgrade Strategy | Bottom-Up (Dependency-First) | All 9 projects target .NET Framework and form a 5-level dependency graph. |
| Project Approach — shared class libraries | Multi-targeting during migration; consolidate to .NET 10 after consumers move | Higher-tier consumers still target .NET Framework during bottom-up migration. |
| Project Approach — System.Web class libraries | In-place | Multi-targeting libraries with `System.Web` dependencies is impractical. |
| Package Management | Per-Project (defer CPM to post-migration) | The solution uses legacy project files and `packages.config`; defer CPM until migration stabilizes. |
| Unsupported Packages | Resolve Inline | The user requires existing functionality to be preserved; 15 packages are reported incompatible. |
| Unsupported API Handling | Fix Inline | The user requires existing behavior to be preserved; avoid generated stubs. |
| Windows Native APIs | Windows Compatibility Pack | WPF, WinForms, and GDI+ usage require Windows-specific support. |
| System.Web Adapters | Use System.Web Adapters | Assessment found `System.Web` and `HttpContext` use in `Mercurius.Prime.Boot`. |
| Configuration Migration | Manual Migration with Mapping Document | Custom `ConfigurationElement` sections exist in `Mercurius.Prime.Core`. |
| Logging Framework | Migrate to Microsoft.Extensions.Logging | The solution uses log4net and NLog; log4net is flagged for a security upgrade. |
| Dependency Injection | Migrate to Built-in DI Container | The assessment found third-party Autofac and Unity containers. |
| Assembly Binding Redirects | Document and Review Before Removing | 87 binding-redirect findings span 8 projects, including conflicts and version downgrades. |

## Tasks

### 01-prerequisites: Verify .NET 10 toolchain and baseline

Confirm the .NET 10 SDK and Windows Desktop targeting support are available, inspect `global.json` for SDK constraints, and capture the solution's baseline restore/build and discovered test-project status. The solution targets Windows desktop frameworks in part, so the final project TFMs must use `net10.0-windows` where WPF or WinForms APIs require it and `net10.0` for framework-neutral projects.

**Done when**: The required SDK/targeting packs and `global.json` constraints are documented; the baseline build and test-project discovery outcomes (including existing warnings) are recorded; the package-cache handling needed for reproducible validation is documented; and no application code or project files are modified.

### 02-sdk-style-conversion: Convert legacy project files

Convert all nine non-SDK-style projects to SDK-style while keeping their existing .NET Framework target. Migrate each `packages.config` dependency set to `PackageReference`, retain Windows Desktop/WPF/WinForms project capabilities, and preserve project references and build properties. Do not introduce Central Package Management during this conversion.

**Done when**: All nine projects load as SDK-style projects on their original target, package restore succeeds, and the solution and its tests build without new warnings or errors.

### 03-prime-core: Upgrade the foundation library

Upgrade `Mercurius.Prime.Core` (dependency tier 1) to .NET 10, retaining a .NET Framework target temporarily if required by downstream consumers. The assessment identifies a high concentration of API compatibility issues, legacy configuration types, cryptography usage, and packages including Enterprise Library; `MailSettingSection`, `MailSettingCollection`, and `MailSettingElement` require a behavior-preserving configuration mapping. Research every incompatible package and API before changing behavior.

**Done when**: The project restores and builds for its intended target(s), existing configuration and cryptography behavior is preserved or any replacement requiring architectural changes is explicitly approved, and the remaining higher tiers still build against the retained .NET Framework target.

### 04-prime-data: Upgrade the data-access library

Upgrade `Mercurius.Prime.Data` (dependency tier 2) after the foundation library. The assessment flags `IBatisNet45` 1.6.2 as incompatible, alongside package security findings and numerous assembly-binding issues. Research supported upgrade paths and the existing persistence mappings before changing data-access technology; do not replace IBatis/iBATIS or alter persistence semantics without explicit user authorization.

**Done when**: The project builds for its intended target(s), package and binding changes preserve data-access behavior, any high-risk persistence replacement has explicit approval, and higher tiers still build against the old target where required.

### 05-core-and-boot-libraries: Upgrade shared and web-compatibility libraries

Upgrade `Mercurius.CodeBuilder.Core`, `Mercurius.Prime.Boot`, and `Mercurius.Prime.DataProcess` (dependency tier 3), retaining Framework-compatible targets on shared libraries until their consumers migrate. WPF-specific code must use a Windows Desktop target. The user explicitly authorized removing the legacy ASP.NET Web API and Swagger components from `Mercurius.Prime.Boot`; remove their dedicated code and package references, but do not replace them with a new API or Swagger stack. `Mercurius.Prime.Boot` also contains `System.Web.HttpApplication`, `HttpContext`, a `SessionStateStoreProviderBase` implementation, and ASP.NET MVC-related integration. Adapters do not automatically replace the old hosting pipeline or session-provider contract. Preserve unrelated behavior and ask before any additional removal or high-risk replacement.

**Done when**: All three projects build for their intended target(s); the authorized legacy Web API/Swagger code and package references are removed; unrelated behavior is preserved; any additional System.Web or MVC/session migration requirement has an approved disposition; and higher tiers remain buildable against their Framework targets as needed.