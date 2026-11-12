# 02.05-tier5-ui: Convert Windows UI project

## Objective
Convert `CodeBuilder/Mercurius.CodeBuilder.UI/Mercurius.CodeBuilder.UI.csproj` to SDK-style after all libraries validate, preserving net48 and exact dependency versions.

## Scope
- Tier 5 Windows UI application; WinForms and WPF, designer resources, references all CodeBuilder libraries and the Prime libraries; 26 packages.
- Incompatible Oracle/Expression and other package findings are deferred. Do not change TFM or replace packages in this task.

## Steps
1. Convert using the dedicated tool only after tier 4 completes.
2. Build directly and preserve Windows Forms/WPF capabilities, resources, project references, and packages.
3. Verify target remains net48 and packages.config is removed.
4. Run final solution build and test discovery; record outcomes.
