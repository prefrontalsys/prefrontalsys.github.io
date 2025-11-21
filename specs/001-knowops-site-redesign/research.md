# Research: KnowOps Site Redesign

**Generated**: 2025-11-21
**Feature**: 001-knowops-site-redesign

## Research Summary

This document consolidates research findings for the KnowOps site redesign. No "NEEDS CLARIFICATION" items were present in the technical context - the existing Hugo setup and redesign document provided sufficient clarity.

---

## Decision 1: URL Redirect Strategy

**Decision**: Use Hugo `aliases` in front matter for content redirects

**Rationale**:
- Hugo's built-in `aliases` feature creates redirect pages automatically during build
- GitHub Pages supports the generated HTML redirect files
- Preserves SEO value with 301-equivalent behavior
- No need for external redirect services or server configuration

**Alternatives Considered**:
- **Netlify _redirects file**: Only works on Netlify hosting, not GitHub Pages
- **Client-side JavaScript redirects**: Poor for SEO, slower user experience
- **404.html with custom routing**: Complex, doesn't preserve SEO value

**Implementation**:
```yaml
# In old page or new page front matter
aliases:
  - /projects/
  - /projects/stopper-protocol/
```

---

## Decision 2: Navigation Structure in hugo-coder Theme

**Decision**: Update `hugo.toml` menu configuration with new 7-section structure, including Frameworks dropdown

**Rationale**:
- hugo-coder supports nested menus via `parent` parameter
- Menu items defined in `languages.en.menu.main` array
- Weight parameter controls order
- Supports dropdown menus for Frameworks → (PrefrontalOS, CortexGraph, STOPPER)

**Alternatives Considered**:
- **Custom navigation partial**: More work, potential theme update conflicts
- **Flat menu only**: Would lose the Frameworks submenu benefit from redesign spec

**Implementation**:
```toml
[[languages.en.menu.main]]
  name = "Frameworks"
  weight = 2
  url = "frameworks/"

[[languages.en.menu.main]]
  name = "PrefrontalOS"
  weight = 1
  parent = "Frameworks"
  url = "frameworks/prefrontalos/"
```

---

## Decision 3: Journal Section Implementation

**Decision**: Rename `content/posts/` to `content/journal/` with taxonomy-based categories

**Rationale**:
- Hugo supports any content section name - "journal" works identically to "posts"
- Existing taxonomies (tags, categories) support filtering by KnowOps topics
- Can add custom front matter field `knowops_category` for precise filtering
- Pagination already configured in hugo.toml

**Alternatives Considered**:
- **Keep posts/ but change display name**: Creates URL/naming inconsistency
- **Use tags only for categorization**: Less semantic than proper categories
- **Create separate sections for each category**: Over-complicated, poor for cross-category browsing

**Implementation**:
- Rename directory: `content/posts/` → `content/journal/`
- Update all post front matter with `categories: ["Memory architecture"]` etc.
- Add aliases to all posts for old URLs: `/posts/old-slug/` → `/journal/old-slug/`
- Create journal list layout with category filters

---

## Decision 4: Contact Form Routing by Inquiry Type

**Decision**: Use w3forms with conditional subject lines and hidden field for inquiry type

**Rationale**:
- w3forms supports custom subject lines via form fields
- Adding inquiry type selector populates subject line: "[KnowOps Audit] - Contact Form"
- No backend changes needed - routing is manual (email filtering) or via w3forms rules
- Keeps existing form infrastructure

**Alternatives Considered**:
- **Multiple forms with different access keys**: Overcomplicated, harder to maintain
- **Third-party routing service (Zapier)**: Adds dependency and cost
- **Backend service**: Out of scope (static site requirement)

**Implementation**:
```html
<select name="inquiry_type" required>
  <option value="audit">Start a KnowOps Audit</option>
  <option value="review">Request a Framework Review</option>
  <option value="discovery">Book a Discovery Call</option>
  <option value="general">General Questions</option>
</select>
```

---

## Decision 5: SEO Meta Tags and Open Graph

**Decision**: Use Hugo front matter plus hugo-coder theme's built-in Open Graph support

**Rationale**:
- hugo-coder already generates Open Graph and Twitter cards from front matter
- Each page needs `description` and `keywords` in front matter
- Site-wide defaults in hugo.toml `params.description` and `params.keywords`
- Hugo generates `<meta>` tags automatically

**Alternatives Considered**:
- **Custom head partial**: More work, theme already handles this
- **External SEO plugin**: Unnecessary for static site with proper front matter

**Implementation**:
```yaml
# Per-page front matter
title: "What is KnowOps?"
description: "KnowOps is the operational discipline for managing cognition, memory, reasoning processes, and behavioral safeguards in AI systems."
keywords: ["KnowOps", "knowledge operations", "AI cognitive architecture"]
```

---

## Decision 6: Cornerstone Page Strategy

**Decision**: Create `/content/knowops/_index.md` as a comprehensive category-defining page

**Rationale**:
- Cornerstone pages need substantial content (2000+ words) for SEO ranking
- Hugo section `_index.md` creates proper `/knowops/` URL
- Can include internal links to all related pages (services, frameworks, journal)
- Single authoritative page for "what is KnowOps" searches

**Alternatives Considered**:
- **Top-level page (knowops.md)**: Creates `/knowops.md` URL, less clean
- **Split across multiple pages**: Dilutes SEO value, harder to rank
- **Homepage only**: Homepage has different purpose (conversion), needs dedicated educational page

**Implementation**:
- Create `content/knowops/_index.md`
- Structure: Definition → Problem space → Pillars → Integration with MLOps → CTAs
- Include internal links to all 3 frameworks and services
- Target 2000+ words with semantic markup (h2, h3, lists)

---

## Decision 7: Framework Pages vs. Projects Migration

**Decision**: Create new framework pages with fresh content structure; add aliases from old project URLs

**Rationale**:
- Framework pages need different positioning than project pages (KnowOps ecosystem role)
- Old project content may not fit new messaging
- Aliases preserve any existing backlinks/SEO
- Cleaner than trying to retrofit old content

**Alternatives Considered**:
- **Rename and rewrite in place**: Git history messy, hard to track changes
- **Keep both old and new pages**: Duplicate content penalty for SEO
- **Redirect without aliases**: Loses content, bad user experience if old links shared

**Implementation**:
```text
content/frameworks/
├── _index.md           # Frameworks overview
├── prefrontalos.md     # aliases: [/projects/prefrontalos/]
├── cortexgraph.md      # aliases: [/projects/cortexgraph/]
└── stopper.md          # aliases: [/projects/stopper-protocol/]
```

---

## Decision 8: Research Section Organization

**Decision**: Use Hugo data files or front matter for publication metadata with list template

**Rationale**:
- Publications have structured data (title, authors, DOI, type, year)
- Hugo data files (`data/publications.yaml`) enable programmatic listing
- Alternative: each publication as markdown file with structured front matter
- hugo-coder doesn't have special publication support, need custom template

**Alternatives Considered**:
- **Single markdown page with manual list**: Hard to maintain, no filtering
- **External database**: Out of scope for static site
- **BibTeX integration**: Requires additional tooling, over-engineered

**Implementation**:
```yaml
# data/publications.yaml
- title: "STOPPER: An Executive Function Protocol for AI Assistants"
  authors: ["Campbell, S."]
  year: 2025
  type: preprint
  doi: "10.5281/zenodo.14487847"
  url: "https://doi.org/10.5281/zenodo.14487847"
```

With custom `layouts/research/list.html` to render grouped by type.

---

## Best Practices Applied

### Hugo Content Organization
- Use sections (directories with `_index.md`) for major content types
- Use aliases for URL redirects to preserve SEO
- Leverage taxonomies (tags, categories) for cross-content navigation
- Front matter for page-specific SEO (description, keywords)

### hugo-coder Theme Customization
- Override templates by copying to `layouts/` (same path structure)
- Never edit files in `themes/hugo-coder/`
- Use `customCSS` and `customJS` params for additions
- Menu structure defined in `hugo.toml`

### SEO for Category Creation
- Cornerstone content (2000+ words) for primary keyword
- Internal linking strategy (hub and spoke)
- Consistent terminology across all pages
- Descriptive URLs (`/knowops/` not `/k/`)
- Meta descriptions under 160 characters

### Static Site Redirects
- Use Hugo aliases for content moves
- Keep old URLs working indefinitely
- No external services needed for basic redirects

---

## Decision 9: Automatic Sitemap Generation

**Decision**: Use Hugo's built-in sitemap template for automatic sitemap.xml generation on each build

**Rationale**:

- Hugo has native sitemap support requiring zero configuration
- Automatically includes all public pages with proper URLs
- Updates on every build, ensuring search engines see current structure
- Standard pattern for Hugo sites

**Alternatives Considered**:

- **Custom sitemap template with extra metadata**: Adds complexity for minimal benefit
- **External sitemap generator**: Unnecessary dependency, manual process
- **No sitemap**: Poor for SEO discoverability

**Implementation**:
Hugo generates sitemap.xml by default. No configuration needed unless customization required.

Optional customization in hugo.toml:
```toml
[sitemap]
  changefreq = "weekly"
  filename = "sitemap.xml"
  priority = 0.5
```

---

## Decision 10: Pre-defined SEO Keyword Sets

**Decision**: Create data file with keyword sets per page type, supplemented by page-specific additions in front matter

**Rationale**:

- Ensures SEO keyword consistency across page types
- Reduces manual effort per page
- Allows page-specific customization when needed
- Centralized management of keyword strategy

**Alternatives Considered**:

- **Fully manual per page**: Inconsistent, error-prone, more work
- **Site-wide keywords only**: Too generic, misses page-specific relevance
- **Hardcoded in templates**: Difficult to maintain and update

**Implementation**:
```yaml
# data/seo-keywords.yaml
homepage:
  - KnowOps
  - knowledge operations
  - AI cognitive architecture
  - reliable AI systems
  - Prefrontal Systems

frameworks:
  - KnowOps frameworks
  - AI executive function
  - cognitive architecture
  - PrefrontalOS
  - CortexGraph
  - STOPPER protocol

services:
  - KnowOps consulting
  - AI reliability audit
  - cognitive architecture design
  - AI implementation services

research:
  - AI research
  - computational therapeutics
  - model welfare research
  - peer-reviewed AI publications

journal:
  - KnowOps articles
  - AI cognitive debugging
  - memory architecture
  - behavioral safeguards

about:
  - Prefrontal Systems
  - KnowOps research studio
  - Scot Campbell
  - AI research organization

contact:
  - contact Prefrontal Systems
  - KnowOps consultation
  - AI architecture services
```

Usage in templates:

```html
{{ $pageType := .Section | default "homepage" }}
{{ $keywords := index site.Data.seo-keywords $pageType }}
{{ with .Params.keywords }}
  {{ $keywords = union $keywords . }}
{{ end }}
<meta name="keywords" content="{{ delimit $keywords ", " }}">
```
