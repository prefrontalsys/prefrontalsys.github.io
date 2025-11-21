# Contract: Content Structure Changes

**Type**: Content directory reorganization and new pages

## Directory Operations

### Renames
```bash
# Rename sections
mv content/posts/ content/journal/
mv content/projects/ content/frameworks/  # After creating new framework pages
```

### New Directories
```bash
mkdir -p content/knowops/
mkdir -p content/research/
```

## New Content Files

### 1. Homepage Update

**File**: `content/_index.md`

**Front Matter**:
```yaml
---
title: "KnowOps for Reliable AI Systems"
description: "Prefrontal Systems provides KnowOps architecture, tools, and research to help teams deploy reliable and resilient AI."
---
```

**Content Sections**:
1. Hero: "KnowOps for Reliable AI Systems"
2. What is KnowOps? (brief intro, link to cornerstone)
3. Why traditional DevOps/MLOps isn't enough
4. Framework overview (3 cards: PrefrontalOS, CortexGraph, STOPPER)
5. Who we help
6. Primary CTA: "Talk to a KnowOps Architect"

---

### 2. What is KnowOps? (Cornerstone)

**File**: `content/knowops/_index.md`

**Front Matter**:
```yaml
---
title: "What is KnowOps?"
description: "KnowOps is the operational discipline for managing cognition, memory, reasoning processes, and behavioral safeguards in AI systems."
keywords: ["KnowOps", "knowledge operations", "AI cognitive architecture", "AI memory systems", "executive function for LLMs"]
date: 2025-11-21
---
```

**Content Sections** (target 2000+ words):
1. Definition
2. Problem space (why traditional approaches fail)
3. Core pillars
   - Knowledge architecture
   - Memory systems
   - Executive function
   - Behavioral regulation
   - Safety and cognitive resilience
4. Example failure modes
5. How KnowOps integrates with MLOps and product development
6. CTA: Link to Services

---

### 3. Frameworks Landing

**File**: `content/frameworks/_index.md`

**Front Matter**:
```yaml
---
title: "KnowOps Frameworks"
description: "Open-source frameworks for cognitive architecture in AI systems: PrefrontalOS, CortexGraph, and STOPPER Protocol."
date: 2025-11-21
---
```

**Content**: Brief intro explaining the framework ecosystem and how they work together.

---

### 4. PrefrontalOS Framework

**File**: `content/frameworks/prefrontalos.md`

**Front Matter**:
```yaml
---
title: "PrefrontalOS"
description: "The core operating system for KnowOps. Executive function and control architecture for AI systems."
keywords: ["PrefrontalOS", "AI executive function", "cognitive architecture", "control system"]
date: 2025-11-21
aliases:
  - /projects/prefrontalos/
framework:
  positioning: "The core operating system for KnowOps"
  github: "https://github.com/prefrontal-systems/prefrontalos"
  status: "development"
related_research: []
---
```

---

### 5. CortexGraph Framework

**File**: `content/frameworks/cortexgraph.md`

**Front Matter**:
```yaml
---
title: "CortexGraph"
description: "The knowledge layer for AI systems. Memory, context, and retrieval orchestration with human-like forgetting curves."
keywords: ["CortexGraph", "AI memory", "temporal memory", "knowledge graph", "mnemex"]
date: 2025-11-21
aliases:
  - /projects/cortexgraph/
  - /projects/mnemex/
framework:
  positioning: "The knowledge layer for AI systems"
  github: "https://github.com/mnemexai/cortexgraph"
  pypi: "cortexgraph"
  status: "beta"
related_research:
  - "10.5281/zenodo.14487847"
---
```

---

### 6. STOPPER Framework

**File**: `content/frameworks/stopper.md`

**Front Matter**:
```yaml
---
title: "STOPPER Protocol"
description: "The cognitive resilience protocol for AI agents. Behavioral regulation for preventing runaway loops and cascading failures."
keywords: ["STOPPER", "AI behavioral regulation", "executive function", "loop prevention", "DBT"]
date: 2025-11-21
aliases:
  - /projects/stopper-protocol/
  - /projects/stopper/
framework:
  positioning: "The cognitive resilience protocol for AI agents"
  github: "https://github.com/mnemexai/stopper"
  status: "stable"
related_research:
  - "10.5281/zenodo.14487847"
---
```

---

### 7. Research Landing

**File**: `content/research/_index.md`

**Front Matter**:
```yaml
---
title: "Research"
description: "Peer-reviewed publications, preprints, and technical reports from Prefrontal Systems research."
date: 2025-11-21
aliases:
  - /publications/
---
```

**Content**: Brief intro, then list rendered from `data/publications.yaml` by layout template.

---

### 8. Services Update

**File**: `content/services.md`

**Front Matter**:
```yaml
---
title: "KnowOps Services"
description: "KnowOps consulting services: Readiness Audit, Architecture Design, Implementation, and Training workshops."
date: 2025-11-21
---
```

**Content Structure**:
```markdown
# KnowOps Services

[Intro paragraph about KnowOps consulting]

## KnowOps Readiness Audit

**What we evaluate:**
- Memory structures
- Tool-use patterns
- Reasoning chains
- Failure modes
- Hallucination triggers
- Debugging loops
- Recall and knowledge synthesis

**Deliverables:** [List]

[CTA: Start a KnowOps Audit →]

---

## KnowOps Architecture Design

**What we provide:**
- PrefrontalOS integration
- CortexGraph implementation
- STOPPER protocol setup
- Event-sourced knowledge flows
- Retrieval schemas
- Guardrail reasoning structures

[CTA: Request Architecture Review →]

---

## KnowOps Implementation

**What we build:**
- Memory graphs
- STOPPER pipeline integration
- Knowledge distillation workflows
- Executive-function loops
- Operational monitoring for cognitive drift

[CTA: Book Discovery Call →]

---

## KnowOps Training / Workshops

**Topics covered:**
- Executive function analogies for AI
- Designing memory workflows
- Model welfare and behavioral debugging

[CTA: Request Training →]
```

---

### 9. About Update

**File**: `content/about.md`

**Front Matter**:
```yaml
---
title: "About Prefrontal Systems"
description: "Prefrontal Systems is a research studio specializing in Knowledge Operations (KnowOps) for AI systems."
date: 2025-11-21
---
```

**Content Sections**:
1. Mission
2. Philosophy (KnowOps foundation)
3. Background (brief)
4. Why KnowOps exists
5. Values
6. Contact CTA

---

### 10. Contact Update

**File**: `content/contact.md`

**Front Matter**:
```yaml
---
title: "Work With Us"
description: "Contact Prefrontal Systems for KnowOps consulting, audits, architecture design, and training."
date: 2025-11-21
---
```

**Content**:
```markdown
# Work With Us

Ready to improve your AI system reliability with KnowOps?

{{< contact-form >}}
```

Form includes inquiry type selector per shortcode update.

---

### 11. Journal Landing

**File**: `content/journal/_index.md`

**Front Matter**:
```yaml
---
title: "KnowOps Journal"
description: "Technical articles on memory architecture, cognitive debugging, behavioral safeguards, and applied model welfare."
date: 2025-11-21
aliases:
  - /posts/
---
```

---

## Data Files

### Publications Data

**File**: `data/publications.yaml`

```yaml
- title: "STOPPER: An Executive Function Protocol for AI Assistants"
  authors: ["Campbell, S."]
  year: 2025
  type: preprint
  doi: "10.5281/zenodo.14487847"
  url: "https://doi.org/10.5281/zenodo.14487847"
  abstract: "Describes convergent evolution between DBT STOP and STOPPER protocol for AI systems."
  related_frameworks: ["STOPPER", "PrefrontalOS"]

# Add more publications as available
```

---

## Migration Tasks

### Journal Articles

For each file in `content/journal/*.md`:

1. Add aliases for old URL:
   ```yaml
   aliases:
     - /posts/original-slug/
   ```

2. Add KnowOps category:
   ```yaml
   categories: ["Memory architecture"]  # or appropriate category
   ```

**Categories to assign**:
- Memory architecture
- Behavioral safeguards
- Cognitive debugging
- Knowledge workflows
- Applied model welfare
- Case studies
- Research commentary

---

## Validation Checklist

- [ ] All new content files created with proper front matter
- [ ] All migrated journal articles have aliases
- [ ] All framework pages have aliases from old project URLs
- [ ] `data/publications.yaml` created with at least one entry
- [ ] Services page restructured with 4 tiers
- [ ] About page updated with "research studio" positioning
- [ ] Contact page uses updated shortcode
- [ ] Homepage updated with KnowOps hero and CTAs
