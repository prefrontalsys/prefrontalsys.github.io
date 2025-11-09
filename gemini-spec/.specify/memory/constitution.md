<!--
Sync Impact Report:
- Version change: 0.0.0 → 1.0.0
- List of modified principles: Initialized all principles.
- Added sections: Core Principles, Development Workflow, Governance
- Removed sections: None
- Templates requiring updates:
  - ⚠ pending: .specify/templates/plan-template.md
  - ⚠ pending: .specify/templates/spec-template.md
  - ⚠ pending: .specify/templates/tasks-template.md
- Follow-up TODOs: None
-->
# Gemini Spec Kit Constitution

## Core Principles

### I. Agent-First Design
All specifications, plans, and instructions must be written for an AI agent as the primary audience. Clarity, explicitness, and machine-readability are paramount. Instructions must be unambiguous, atomic, and directly testable to minimize the chance of misinterpretation. The goal is to make the agent's "thought process" as transparent and deterministic as possible.

### II. Executable Specifications
Every specification must be accompanied by a set of automated checks or tests that can programmatically verify its implementation. A specification is not merely a document; it is a formal contract with a built-in verification mechanism. This ensures that the final implementation directly maps to the approved requirements.

### III. Test-Driven Development (NON-NEGOTIABLE)
TDD is mandatory for all feature development and bug fixes. The Red-Green-Refactor cycle is strictly enforced:
1.  **Red:** Write a failing test that clearly defines the desired outcome or new functionality.
2.  **Green:** Write the simplest possible code to make the test pass.
3.  **Refactor:** Clean up the code while ensuring all tests continue to pass.
This process applies to both application code and the agent's own tooling and scripts.

### IV. Modular & Composable Commands
The toolkit is built as a series of modular, independent commands (e.g., `speckit.*`). Each command must have a single, well-defined responsibility and be independently testable. This promotes reusability, simplifies maintenance, and allows for flexible composition in complex workflows.

### V. Idempotent & Auditable Tooling
Scripts and agent commands must be designed to be idempotent wherever possible, meaning they can be run multiple times with the same outcome. All significant actions taken by the agent or its tools must be logged to a structured, human-readable format to ensure a clear and complete audit trail.

## Development Workflow

The standard workflow for any change follows the Spec-Driven Development process:
1.  **Constitution (`/speckit.constitution`):** Ensure the proposed change aligns with project principles.
2.  **Specify (`/speckit.specify`):** Define *what* needs to be built in an executable specification.
3.  **Plan (`/speckit.plan`):** Create a detailed technical plan for *how* to build it.
4.  **Tasks (`/speckit.tasks`):** Break the plan into a checklist of discrete, actionable tasks.
5.  **Implement (`/speckit.implement`):** Execute the tasks to build the feature.

## Governance

This Constitution is the supreme governing document for this project, superseding all other conventions or practices.
- **Amendments:** Any change to this Constitution requires a formal proposal, a documented review process, and an approved migration plan for updating existing specifications, plans, and commands.
- **Versioning:** The Constitution's version will be incremented using MAJOR.MINOR.PATCH semantics.
- **Compliance:** All code reviews and specification approvals must explicitly verify compliance with the principles outlined herein.

**Version**: 1.0.0 | **Ratified**: 2025-11-09 | **Last Amended**: 2025-11-09