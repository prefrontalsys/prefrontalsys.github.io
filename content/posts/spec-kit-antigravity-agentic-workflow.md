---
title: "The Handoff: How I Orchestrate AI Agents Across Specification and Implementation"
date: 2025-11-20
draft: false
description: "I discovered that the real power isn't in any single AI tool - it's in teaching them to pass the baton cleanly between specification and execution"
tags:
  - agentic-ai
  - spec-driven-development
  - AI
  - software development
  - workflow
  - gemini
  - antigravity
categories:
  - Software Development
  - AI
---

This week, Google released Antigravity, their new agentic development platform. I'd been using Gemini CLI with GitHub's Spec-Kit for a while already, running through the full spec-driven workflow from constitution to implementation. But something always felt incomplete about the implementation phase - like I was handing a meticulously written recipe to a chef who kept asking me what ingredients we were using.

Then I realized the problem wasn't the tools. It was the handoff.

<!--more-->

## The Gap Between Knowing What and Knowing How

Spec-driven development sounds like a revolution when you first hear about it. Instead of vibe-coding your way through features - writing code, seeing what breaks, fixing it, repeat - you start with precise specifications that define what you're building and why. GitHub released Spec-Kit as an open-source toolkit for exactly this workflow. It gives you slash commands (`/speckit.specify`, `/speckit.plan`, `/speckit.tasks`) that walk you through creating a constitution of project principles, functional specifications, implementation plans, and task breakdowns.

The problem is that `/speckit.implement` often felt like jumping off a cliff. You'd done all this careful work - user stories, acceptance criteria, API contracts, data models - and then the AI agent would start implementing with the enthusiasm of someone who'd skimmed your notes five minutes before the meeting. It had the information. It just didn't have the *workflow* to systematically consume it.

This is where I started experimenting with Antigravity's workflow system, and found something that actually works.

## Two Tools, Two Strengths

Here's what I realized: Spec-Kit excels at structured knowledge capture. Antigravity excels at autonomous execution with verification. They're solving different halves of the same problem.

Spec-Kit's templates force you to think through features at the right level of abstraction. When you use `/speckit.specify`, you're prompted to write user stories, define acceptance criteria, and identify dependencies. When you use `/speckit.plan`, you're committing to a tech stack and architecture. When you use `/speckit.tasks`, the AI breaks your plan into ordered, dependency-aware tasks with file paths and test requirements. By the time you're done, you have a `specs/001-your-feature/` directory containing `spec.md`, `plan.md`, `tasks.md`, and often supporting documents like `api-spec.json` and `data-model.md`.

This is excellent. This is also where most workflows stop being useful.

Antigravity changes the equation because it's designed as an "agent-first" platform. Its agents don't just read your prompts and respond - they plan, execute across editor/terminal/browser, and generate artifacts that let you verify their work without reading logs. The Manager surface lets you spawn multiple agents working in different workspaces asynchronously. You can leave feedback on artifacts like commenting on a document, and the agent incorporates your input without stopping.

The trick is teaching Antigravity to consume what Spec-Kit produces.

## The Handoff Workflow

I use Gemini CLI to run the Spec-Kit phases. Constitution, specification, clarification, planning, task generation - all through the `/speckit.*` commands. This works because Gemini is good at iterative refinement and structured thinking. We go back and forth on requirements, clarify underspecified areas with `/speckit.clarify`, validate plans against the project constitution.

Then comes the handoff. Instead of using `/speckit.implement` directly, I switch to Antigravity with a custom workflow that reads the Spec-Kit artifacts. Here's the workflow I've been using:

```markdown
---
description: Implement a feature based on a provided spec directory.
---

1. **Identify Spec Directory**:
   - Look at the user's message to see if they provided a path to a spec directory (e.g., `specs/001-foo`).
   - **IF** a path is provided: Set that as the `TargetDirectory`.
   - **IF** no path is provided: STOP and ask the user, "Which spec directory would you like me to work on?"

2. **Read Context**:
   - Use `list_dir` to inspect the `TargetDirectory`.
   - Read all relevant files (Markdown, text, etc.) within that directory to understand the requirements.

3. **Initialize Task**:
   - Create or update `task.md` by extracting requirements from the files you just read.
   - Break down the work into a checklist.

4. **Plan Implementation**:
   - Create `implementation_plan.md` detailing the changes required.
   - Group changes by component/file.

5. **Review**:
   - Ask the user to review the plan before starting execution.
```

This workflow tells Antigravity to consume the entire spec directory before doing anything. It reads the specification, the plan, the tasks, the data models, the API contracts. Then it creates its own working documents - `task.md` and `implementation_plan.md` - that translate Spec-Kit's outputs into its native format. The review step is critical: you verify that the agent understood your specifications before it starts writing code.

## Going All-In: The Full Lifecycle Workflow

The handoff approach works well when you want to use Gemini CLI's conversational strengths for the specification phase. But there's another approach: have Antigravity run the entire Spec-Kit lifecycle itself, executing the bash scripts directly.

This is more aggressive. Instead of switching tools between specification and implementation, Antigravity manages the whole thing. It runs the Spec-Kit scripts to set up feature branches and directories, generates the artifacts using the system prompts, and then executes. Everything stays in one context.

Here's the workflow:

```markdown
---
description: Execute the full Spec-Kit lifecycle from feature creation through implementation.
---

1. **Initialize/Verify Spec-Kit**:
   Ensure the `.specify` directory exists.
   ` ` `bash
   # Initialize Spec-Kit if needed
   if [ ! -d ".specify" ]; then
       pip install "git+https://github.com/github/spec-kit.git" || true
       specify init . --ai gemini --no-git --force
   fi
   # Ensure scripts are executable
   chmod +x .specify/scripts/bash/*.sh
   ` ` `

2. **Create New Feature**:
   Use the `create-new-feature.sh` script to set up the branch and directory structure.
   - **Input**: Ask user for Feature Description and Short Name.
   - **Command**:
     ` ` `bash
     ./.specify/scripts/bash/create-new-feature.sh "<Feature Description>" --short-name "<Short Name>"
     ` ` `
   - **Note**: This script creates the feature branch (if git is available), creates `specs/<feature-branch>/`, and copies `spec-template.md`.

3. **Generate Constitution**:
   Use the constitution prompt template.
   - **Source**: `.specify/memory/constitution.md` (or `.specify/templates/constitution.md` if moved).
   - **Action**: Generate `specs/constitution.md` using the template as a system prompt.

4. **Generate Specification**:
   Fill in the `spec.md` created by the script.
   - **File**: `specs/<feature-branch>/spec.md`
   - **Template**: `.specify/templates/spec-template.md` (already copied by script).
   - **Prompt**: `.specify/specify.md` (system prompt).
   - **Action**: Update `specs/<feature-branch>/spec.md` with the generated content.

5. **Generate Implementation Plan**:
   Use the `setup-plan.sh` script (if available) or manually create `plan.md` from template.
   - **Command**:
     ` ` `bash
     # Check if setup-plan exists and run it, or copy template
     if [ -f ".specify/scripts/bash/setup-plan.sh" ]; then
         ./.specify/scripts/bash/setup-plan.sh
     else
         cp .specify/templates/plan-template.md specs/<feature-branch>/plan.md
     fi
     ` ` `
   - **Prompt**: `.specify/plan.md` (system prompt).
   - **Action**: Update `specs/<feature-branch>/plan.md`.

6. **Generate Task List**:
   Create `tasks.md` from template.
   - **Command**: `cp .specify/templates/tasks-template.md specs/<feature-branch>/tasks.md`
   - **Prompt**: `.specify/tasks.md` (system prompt).
   - **Action**: Update `specs/<feature-branch>/tasks.md`.

7. **Refine and Validate**:
   Review artifacts with the user.

8. **Execute**:
   Proceed to implementation using the generated tasks.
```

This workflow is opinionated about consistency with the Spec-Kit methodology. It uses the actual scripts GitHub provides rather than reimplementing their logic. When `create-new-feature.sh` runs, it handles branch creation, directory setup, and template copying exactly as Spec-Kit intends. The system prompts in `.specify/specify.md`, `.specify/plan.md`, and `.specify/tasks.md` guide artifact generation the same way the slash commands would.

The tradeoff: you lose some of the conversational back-and-forth that makes Gemini CLI good for clarification. Antigravity is more execution-oriented. It'll ask for inputs and generate outputs, but the iterative refinement loop feels different than chatting through requirements with `/speckit.clarify`.

When do I use which? If I'm working on a feature where I know the requirements well and just need to get through the spec-to-implementation pipeline quickly, the full lifecycle workflow is faster. If requirements are fuzzy and I need to think through user stories with an AI that can push back on my assumptions, I use Gemini CLI for specification and hand off to Antigravity for implementation.

## Why This Works

The power here isn't in either tool individually. It's in the division of labor.

Spec-Kit handles what I'd call "epistemic work" - figuring out what should exist and why. Its templates push you to answer hard questions before you write code. What are the user stories? What constitutes acceptance? What dependencies exist between components? The `/speckit.clarify` command even generates targeted questions to fill gaps in your specification. You're doing the thinking work that, if skipped, leads to endless implementation rework.

Antigravity handles execution work - actually building the thing. But more importantly, it handles verification. The artifact system means you're not reading through terminal output trying to figure out if the agent did what you asked. You're looking at screenshots, implementation plans, and task lists. You can leave comments like "this doesn't match the API contract" and the agent adjusts without stopping its flow.

The handoff workflow bridges them. When Antigravity reads the spec directory, it's not just getting requirements - it's getting structured requirements in a format designed for AI consumption. Spec-Kit already organized the information into categories that make sense for implementation: user stories define the scope, acceptance criteria define completion, task lists define order, API specs define contracts.

## The Agentic Promise, Actually Delivered

I've written before about [agentic AI for autonomous project management]({{< relref "agentic-ai-autonomous-project-management.md" >}}) - the idea that AI can act with a degree of independence and adaptability, not just executing predefined rules but making decisions within a framework. Most "agentic" workflows I've tried fall short of this promise. They're really just chat interfaces with more elaborate prompts.

This combination actually feels agentic. I define the constraints and goals through Spec-Kit. Antigravity operates autonomously within those constraints, making real-time decisions about how to implement features, what tests to write, how to structure components. The artifacts give me visibility without requiring constant supervision. I'm managing outcomes, not keystrokes.

The [context problem in AI pair programming]({{< relref "ai-pair-programming-context-problem.md" >}}) is real - AI partners forget everything between sessions. But specification documents don't forget. They're persistent context in file form. When Antigravity reads my `spec.md`, it's getting the same shared understanding that an XP pair would build over weeks of collaboration, delivered in seconds.

## What I'm Still Figuring Out

This workflow isn't perfect. A few open questions:

**Iteration across sessions.** Right now, if Antigravity's implementation needs changes, I'm manually updating specs and re-running the handoff. There should be a feedback loop where the agent can propose spec changes when it discovers implementation impossibilities.

**Artifact accumulation.** The workflow generates artifacts - plans, checklists, screenshots. These are useful for verification but they accumulate. I need a better system for archiving completed features and cleaning up intermediate documents.

**Multi-agent coordination.** Antigravity's Manager surface lets you spawn multiple agents, but coordinating their work on a shared codebase introduces merge complexity. Spec-Kit's task dependencies could potentially inform agent orchestration, but I haven't figured out the right pattern yet.

**Model switching costs.** Using Gemini CLI for specification and Antigravity for implementation means context doesn't flow automatically between them. The spec directory is the serialization format. This mostly works, but there's friction.

As I figure these things out, I'll update with more posts.

## Try It Yourself

If you want to experiment with this:

1. Install Spec-Kit: `uv tool install specify-cli --from git+https://github.com/github/spec-kit.git`
2. Initialize a project: `specify init my-project --ai gemini`
3. Run through the spec workflow with Gemini CLI: `/speckit.constitution`, `/speckit.specify`, `/speckit.clarify`, `/speckit.plan`, `/speckit.tasks`
4. Download Antigravity from [antigravity.google/download](http://goo.gle/AGY)
5. Create a workflow like the one above and point it at your spec directory

The whole thing takes about an hour to set up. The learning curve is mostly in writing good specifications - which, frankly, is where most AI-assisted development fails anyway. If you can't specify what you want, you won't get it. Spec-Kit gives you scaffolding for the hard thinking. Antigravity gives you execution horsepower once the thinking is done.

The future of AI-assisted development isn't a single tool that does everything. It's orchestrating specialists - spec-writers, planners, implementers, verifiers - and defining clean handoffs between them. We're just starting to figure out what that looks like.
