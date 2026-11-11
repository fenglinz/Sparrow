# 03-prime-core: Upgrade the foundation library

Upgrade `Mercurius.Prime.Core` (dependency tier 1) to .NET 10, retaining a .NET Framework target temporarily if required by downstream consumers. The assessment identifies a high concentration of API compatibility issues, legacy configuration types, cryptography usage, and packages including Enterprise Library; `MailSettingSection`, `MailSettingCollection`, and `MailSettingElement` require a behavior-preserving configuration mapping. Research every incompatible package and API before changing behavior.

**Done when**: The project restores and builds for its intended target(s), existing configuration and cryptography behavior is preserved or any replacement requiring architectural changes is explicitly approved, and the remaining higher tiers still build against the retained .NET Framework target.
