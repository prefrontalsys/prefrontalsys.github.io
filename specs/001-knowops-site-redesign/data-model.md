# Data Model: KnowOps Site Redesign

**Generated**: 2025-11-21
**Feature**: 001-knowops-site-redesign

## Overview

This document defines the content structure for the Hugo static site. "Data model" in this context refers to the front matter schema and content organization for each page type.

---

## Content Types

### 1. Page (Generic Content Page)

Standard page for About, Contact, Services, KnowOps cornerstone.

**Front Matter Schema**:
```yaml
title: string           # Page title (required)
description: string     # Meta description for SEO (required, max 160 chars)
keywords: [string]      # SEO keywords (optional)
date: date              # Publication date (required)
draft: boolean          # Draft status (default: false)
aliases: [string]       # URL redirects from old paths (optional)
menu:                   # Navigation placement (optional)
  main:
    name: string
    weight: number
    parent: string      # For dropdown menus
```

**Example**:
```yaml
---
title: "What is KnowOps?"
description: "KnowOps is the operational discipline for managing cognition, memory, reasoning, and behavioral safeguards in AI systems."
keywords: ["KnowOps", "knowledge operations", "AI cognitive architecture", "AI memory systems"]
date: 2025-11-21
menu:
  main:
    name: "What is KnowOps?"
    weight: 1
---
```

---

### 2. Framework

Individual framework page (PrefrontalOS, CortexGraph, STOPPER).

**Front Matter Schema**:
```yaml
title: string               # Framework name (required)
description: string         # Meta description (required)
keywords: [string]          # SEO keywords
date: date                  # Publication date
draft: boolean              # Draft status
aliases: [string]           # Redirects from old project URLs
framework:                  # Framework-specific metadata
  positioning: string       # KnowOps ecosystem role
  github: string            # GitHub repository URL
  pypi: string              # PyPI package (if applicable)
  documentation: string     # Docs URL
  status: string            # development | beta | stable
related_research: [string]  # DOIs of related publications
```

**Example**:
```yaml
---
title: "CortexGraph"
description: "The knowledge layer for AI systems. CortexGraph provides temporal memory orchestration with human-like forgetting curves."
keywords: ["CortexGraph", "AI memory", "temporal memory", "knowledge graph", "mnemex"]
date: 2025-11-21
aliases:
  - /projects/cortexgraph/
  - /projects/mnemex/
framework:
  positioning: "The knowledge layer for AI systems"
  github: "https://github.com/mnemexai/cortexgraph"
  pypi: "cortexgraph"
  documentation: "https://cortexgraph.readthedocs.io"
  status: "beta"
related_research:
  - "10.5281/zenodo.14487847"
---
```

---

### 3. Service Tier

Not a separate content file - Services page contains all 4 tiers. Schema for internal structure.

**Content Structure** (within services.md):
```markdown
## Service Tier Name

**What we evaluate/provide**: [List]

**Deliverables**: [List]

**Ideal for**: [Target audience]

[CTA Button to Contact with inquiry type]
```

**Service Tiers**:
1. KnowOps Readiness Audit
2. KnowOps Architecture Design
3. KnowOps Implementation
4. KnowOps Training / Workshops

---

### 4. Publication

Research output with structured metadata.

**Data File Schema** (data/publications.yaml):
```yaml
- title: string           # Publication title (required)
  authors: [string]       # Author list (required)
  year: number            # Publication year (required)
  type: string            # peer-reviewed | preprint | whitepaper | technical-report | talk
  doi: string             # DOI identifier (if available)
  url: string             # Direct URL (required)
  abstract: string        # Short abstract (optional)
  related_frameworks: [string]  # Framework names (optional)
  citation: string        # Formatted citation (optional)
```

**Example**:
```yaml
- title: "STOPPER: An Executive Function Protocol for AI Assistants"
  authors: ["Campbell, S."]
  year: 2025
  type: preprint
  doi: "10.5281/zenodo.14487847"
  url: "https://doi.org/10.5281/zenodo.14487847"
  abstract: "Describes convergent evolution between DBT STOP and STOPPER protocol for AI systems."
  related_frameworks: ["STOPPER", "PrefrontalOS"]
  citation: "Campbell, S. (2025). STOPPER: An Executive Function Protocol for AI Assistants. Zenodo. https://doi.org/10.5281/zenodo.14487847"
```

---

### 5. Journal Article

Blog post in the Journal section (migrated from posts/).

**Front Matter Schema**:
```yaml
title: string               # Article title (required)
description: string         # Meta description (required)
date: date                  # Publication date (required)
draft: boolean              # Draft status
tags: [string]              # Article tags
categories: [string]        # KnowOps categories (required)
series: [string]            # Article series (optional)
aliases: [string]           # Redirects from /posts/ URLs (required for migrations)
author: string              # Author name (optional, defaults to site author)
```

**KnowOps Categories** (from redesign spec):
- Memory architecture
- Behavioral safeguards
- Cognitive debugging
- Knowledge workflows
- Applied model welfare
- Case studies
- Research commentary

**Example** (migrated post):
```yaml
---
title: "Implementing Temporal Decay in Memory Systems"
description: "How CortexGraph uses clinically-validated forgetting curves to prioritize relevant memories."
date: 2025-10-15
tags: ["memory", "cortexgraph", "temporal-decay", "mnemex"]
categories: ["Memory architecture"]
series: ["Building CortexGraph"]
aliases:
  - /posts/implementing-temporal-decay/
---
```

---

### 6. Contact Inquiry

Form submission structure (w3forms handling).

**Form Fields**:
```yaml
name: string                # Full name (required)
email: email                # Email address (required)
inquiry_type: enum          # audit | review | discovery | general (required)
company: string             # Company/organization (optional)
message: string             # Message body (required)
```

**Inquiry Type Options**:
- `audit` → "Start a KnowOps Audit"
- `review` → "Request a Framework Review"
- `discovery` → "Book a Discovery Call"
- `general` → "General Questions"

---

## Content Relationships

```text
Homepage
├── links to → What is KnowOps? (cornerstone)
├── showcases → Frameworks (overview)
├── links to → Services
└── CTA → Contact

What is KnowOps?
├── internal links → All 3 Frameworks
├── internal links → Services
├── internal links → Related Journal articles
└── CTA → Contact

Frameworks (each)
├── links to → Related Research (by DOI)
├── links to → Related Journal articles
├── links to → Services (implementation)
└── CTA → Contact

Services
├── references → Frameworks (used in services)
└── CTA → Contact (per tier)

Journal Articles
├── taxonomy → Categories (KnowOps topics)
├── taxonomy → Tags (specific topics)
├── links to → Related Frameworks
└── CTA → Services / Contact

Research
├── grouped by → Type (peer-reviewed, preprint, etc.)
├── links to → Related Frameworks
└── CTA → Contact (collaboration)
```

---

## Taxonomies

**Existing** (keep):
- `tags`: Granular topic tags
- `categories`: KnowOps topic categories
- `series`: Multi-part article series

**Usage**:
- Tags: Many per article, specific ("cortexgraph", "temporal-decay", "dbt")
- Categories: One or two per article, broad ("Memory architecture", "Cognitive debugging")
- Series: For multi-part articles ("Building CortexGraph", "STOPPER Deep Dive")

---

## URL Structure

**New URLs**:
```text
/                          # Homepage
/knowops/                  # What is KnowOps? cornerstone
/frameworks/               # Frameworks landing
/frameworks/prefrontalos/  # PrefrontalOS
/frameworks/cortexgraph/   # CortexGraph
/frameworks/stopper/       # STOPPER
/services/                 # Services (all 4 tiers)
/research/                 # Research publications
/journal/                  # Journal listing
/journal/{slug}/           # Individual articles
/about/                    # About page
/contact/                  # Contact page
```

**Redirects Required** (via aliases):
```text
/projects/              → /frameworks/
/projects/prefrontalos/ → /frameworks/prefrontalos/
/projects/cortexgraph/  → /frameworks/cortexgraph/
/projects/stopper-protocol/ → /frameworks/stopper/
/publications/          → /research/
/posts/                 → /journal/
/posts/{slug}/          → /journal/{slug}/
```

---

## Validation Rules

### Required Fields
- All pages: `title`, `description`, `date`
- Frameworks: `framework.positioning`
- Journal articles: `categories` (at least one)
- Publications: `title`, `authors`, `year`, `type`, `url`

### Field Constraints
- `description`: Max 160 characters (SEO)
- `type` (publications): Must be one of: peer-reviewed, preprint, whitepaper, technical-report, talk
- `inquiry_type`: Must be one of: audit, review, discovery, general
- `framework.status`: Must be one of: development, beta, stable

### Migration Validation
- All migrated posts MUST have `aliases` with old `/posts/` URL
- All framework pages MUST have `aliases` with old `/projects/` URL
