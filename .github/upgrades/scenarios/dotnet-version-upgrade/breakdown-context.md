## Detected Hints

### hint: multi-project-dependency-ordering
- **Status**: resolved
- **Priority**: MUST
- **Evidence**: SDK-style conversion covers 9 projects connected through a 5-tier dependency graph, confirmed with `get_projects_in_topological_order` and project-reference data.
- **Detected**: 2026-11-11, during task 02-sdk-style-conversion

## Breakdown Decisions

### task: 02-sdk-style-conversion
- Broken into 5 subtasks by dependency tier: Prime.Core; Prime.Data; tier 3 libraries; tier 4 libraries; Windows UI.
- Projects are converted serially with the dedicated conversion tool; each project/tier is validated on net48 before proceeding to dependents.
