# 04-prime-data: Upgrade the data-access library

Upgrade `Mercurius.Prime.Data` (dependency tier 2) after the foundation library. The assessment flags `IBatisNet45` 1.6.2 as incompatible, alongside package security findings and numerous assembly-binding issues. Research supported upgrade paths and the existing persistence mappings before changing data-access technology; do not replace IBatis/iBATIS or alter persistence semantics without explicit user authorization.

**Done when**: The project builds for its intended target(s), package and binding changes preserve data-access behavior, any high-risk persistence replacement has explicit approval, and higher tiers still build against the old target where required.
