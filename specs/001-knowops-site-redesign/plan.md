# Implementation Plan: KnowOps Site Redesign

**Branch**: `001-knowops-site-redesign` | **Date**: 2025-11-21 | **Spec**: [spec.md](spec.md)
**Input**: Feature specification from `/specs/001-knowops-site-redesign/spec.md`

## Summary

Redesign the prefrontal.systems Hugo website around the "KnowOps" (Knowledge Operations) positioning. This involves restructuring the information architecture with new navigation (7 sections), creating new content pages (What is KnowOps?, Services with 4 tiers, Frameworks), renaming existing sections (Blog→Journal, Publications→Research, Projects→Frameworks), implementing URL redirects for SEO preservation, updating meta tags for KnowOps-related keywords with pre-defined keyword sets per page type, and enabling automatic sitemap.xml generation on each build.

## Technical Context

**Language/Version**: Hugo 0.152.2 (extended version for SCSS), HTML5, CSS3, Markdown
**Primary Dependencies**: Hugo static site generator, hugo-coder theme (git submodule), w3forms (contact handling)
**Storage**: Markdown files in content/, GitHub Pages hosting
**Testing**: Manual browser testing, Hugo build validation (`hugo --gc --minify`)
**Target Platform**: Static web, GitHub Pages, modern browsers
**Project Type**: Static site (content-driven)
**Performance Goals**: Page load < 2s, Lighthouse score > 90
**Constraints**: Static-only (no server-side processing), existing theme customization limits
**Scale/Scope**: ~20 content pages, ~30+ existing blog posts to migrate, 7 navigation sections

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- [x] **Reliability by Design**: Yes - Static site architecture ensures reliability (no server dependencies, CDN-hosted). Redirects preserve SEO value. Sitemap auto-generation ensures search engines always have current site structure. Structure follows established Hugo patterns.
- [x] **Model Welfare and Ethics**: Not directly applicable to website structure. However, the KnowOps positioning itself promotes ethical AI practices through STOPPER protocol and model welfare research visibility.
- [x] **Scientific Rigor**: Yes - Research section prominently displays peer-reviewed work with proper DOI citations. KnowOps positioning is grounded in existing published research (STOPPER paper on Zenodo).

## Project Structure

### Documentation (this feature)

```text
specs/001-knowops-site-redesign/
├── plan.md              # This file
├── research.md          # Phase 0 output
├── data-model.md        # Phase 1 output (content structure)
├── quickstart.md        # Phase 1 output (local dev setup)
├── contracts/           # Phase 1 output (Hugo templates/layouts)
└── tasks.md             # Phase 2 output (/speckit.tasks command)
```

### Source Code (repository root)

```text
# Hugo Static Site Structure
content/
├── _index.md              # Homepage (redesigned for KnowOps)
├── knowops/               # NEW: "What is KnowOps?" cornerstone
│   └── _index.md
├── frameworks/            # RENAMED from projects/
│   ├── _index.md          # Frameworks landing
│   ├── prefrontalos.md
│   ├── cortexgraph.md
│   └── stopper.md
├── services.md            # RESTRUCTURED: 4 tiers
├── research/              # RENAMED from publications/
│   └── _index.md
├── journal/               # RENAMED from posts/
│   └── *.md               # Migrated blog posts
├── about.md               # UPDATED: "research studio" positioning
└── contact.md             # UPDATED: engagement routing options

layouts/
├── _default/
│   └── baseof.html        # May need redirect support
├── shortcodes/
│   └── contact-form.html  # Existing, extend for routing
├── knowops/               # NEW section layout
├── frameworks/            # NEW section layout
├── journal/               # Replaces posts layout
└── research/              # Replaces publications layout

static/
├── _redirects             # NEW: Netlify-style redirects (or Hugo aliases)
└── images/                # Existing assets

data/
└── seo-keywords.yaml      # NEW: Pre-defined keyword sets per page type

hugo.toml                  # Menu restructure, meta tag updates, sitemap enabled
```

**Structure Decision**: Single Hugo static site. Content reorganization via directory renames and new sections. Theme customization via layout overrides. No backend or build system changes beyond Hugo configuration. SEO enhanced with pre-defined keyword sets stored in data file.

## Complexity Tracking

No constitution violations requiring justification. The redesign stays within Hugo's standard patterns.
