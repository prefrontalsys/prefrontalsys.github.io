# Landing Page Redesign Plan

**Project**: Transform prefrontal.systems homepage into a comprehensive landing page
**Branch**: `claude/plan-landing-page-redesign-011CV2Fv6sznpehCmCP44g2J`
**Date**: 2025-11-11
**Status**: Planning Phase

---

## Executive Summary

Transform the current text-based homepage (`content/_index.md`) into a modern, engaging landing page that showcases Prefrontal Systems' research, projects, publications, and blog content. The redesign will maintain the technical, evidence-based brand voice while improving discoverability and visual hierarchy.

---

## Current State Analysis

### Homepage (`content/_index.md`)
- **Format**: Simple markdown with text-only content
- **Structure**: Company description, "What We Do" section, tagline
- **Strengths**: Clear messaging, concise value proposition
- **Limitations**:
  - No visual hierarchy or scannable sections
  - Projects mentioned but not showcased
  - No recent publications or blog posts visible
  - Requires clicking through to discover content

### Available Content
- **Projects**: 3 active projects (STOPPER, PrefrontalOS, CortexGraph)
- **Publications**: 1 published paper (STOPPER on Zenodo), 1 in progress
- **Blog Posts**: ~35 posts covering AI applications, ethics, and tools
- **Theme**: hugo-coder (minimal, developer-focused)

---

## Target State Vision

### Layout Structure

```
┌─────────────────────────────────────────┐
│         HERO SECTION                     │
│  Company tagline + value proposition     │
│  CTA buttons (Services, Contact)         │
└─────────────────────────────────────────┘
┌─────────────────────────────────────────┐
│     WHAT WE DO (3-column summary)        │
│   Research | Frameworks | Consulting     │
└─────────────────────────────────────────┘
┌─────────────────────────────────────────┐
│         FEATURED PROJECTS                │
│  ┌──────┐  ┌──────┐  ┌──────┐          │
│  │STOPP-│  │Prefro│  │Cortex│          │
│  │ ER   │  │ntalOS│  │Graph │          │
│  └──────┘  └──────┘  └──────┘          │
└─────────────────────────────────────────┘
┌─────────────────────────────────────────┐
│       RECENT PUBLICATIONS                │
│  • Paper 1 (with DOI badge)             │
│  • Paper 2                              │
│  → View all publications                 │
└─────────────────────────────────────────┘
┌─────────────────────────────────────────┐
│         RECENT BLOG POSTS                │
│  ┌─────────────┐  ┌─────────────┐      │
│  │ Post Title  │  │ Post Title  │      │
│  │ Excerpt...  │  │ Excerpt...  │      │
│  └─────────────┘  └─────────────┘      │
│  → View all blog posts                   │
└─────────────────────────────────────────┘
┌─────────────────────────────────────────┐
│         FOOTER / CTA                     │
│  Ready to improve AI reliability?        │
│  [Contact Us] [View Services]            │
└─────────────────────────────────────────┘
```

---

## Execution Guide for Claude Code

### Pre-Flight Checklist

Before starting implementation, verify:

- [ ] On correct branch: `claude/plan-landing-page-redesign-011CV2Fv6sznpehCmCP44g2J`
- [ ] Hugo server works: `hugo server -D` runs without errors
- [ ] Theme submodule present: `themes/hugo-coder/` exists
- [ ] Current homepage builds: `hugo --gc --minify` succeeds
- [ ] Git status clean or changes committed

**Verify branch**:
```bash
git branch --show-current
# Expected: claude/plan-landing-page-redesign-011CV2Fv6sznpehCmCP44g2J
```

**Verify Hugo version**:
```bash
hugo version
# Expected: hugo v0.152.2 or compatible extended version
```

### Execution Roadmap

**Recommended order of execution** (prevents dependency issues):

1. **CSS Variables & Base Styles** (foundation)
   - `assets/css/landing-page.css` - CSS variables, base layout

2. **Component Styles** (building blocks)
   - `assets/css/hero.css`
   - `assets/css/offerings.css`
   - `assets/css/project-cards.css`
   - `assets/css/publications.css`
   - `assets/css/blog-cards.css`

3. **Hugo Partials** (reusable components)
   - `layouts/partials/hero.html`
   - `layouts/partials/offerings.html`
   - `layouts/partials/project-card.html`
   - `layouts/partials/publications-list.html`
   - `layouts/partials/blog-post-card.html`

4. **Main Template** (assembles everything)
   - `layouts/index.html`

5. **Content Updates** (metadata)
   - Update project front matter: `content/projects/*.md`
   - Create publications data: `data/publications.yaml`

6. **Configuration** (load CSS)
   - Update `hugo.toml` with new CSS files

7. **Testing & Validation**
   - Local server test
   - Production build test
   - Responsive design test

### File-by-File Implementation Guide

#### File 1: `assets/css/landing-page.css`

**Purpose**: CSS variables and base layout for landing page sections

**Dependencies**: None (foundation file)

**Content template**:
```css
/* Landing Page Base Styles */
/* Defines CSS variables and common layout patterns */

:root {
  /* Brand colors from brand.md */
  --color-primary: #1976D2;
  --color-secondary: #37474F;
  --color-background: #FAFAFA;
  --color-success: #2E7D32;
  --color-error: #C62828;
  --color-warning: #F57C00;
  --color-code: #D84315;

  /* Status badge colors */
  --color-published: var(--color-success);
  --color-in-progress: var(--color-primary);
  --color-planned: var(--color-secondary);

  /* Layout variables */
  --max-width: 1200px;
  --section-padding: 4rem 2rem;
  --section-padding-mobile: 2rem 1rem;
  --gap: 2rem;
  --gap-mobile: 1rem;
}

/* Base section styling */
.landing-section {
  max-width: var(--max-width);
  margin: 0 auto;
  padding: var(--section-padding);
}

.section-title {
  font-size: 2rem;
  margin-bottom: 2rem;
  text-align: center;
  color: var(--color-secondary);
}

/* Responsive breakpoints */
@media (max-width: 768px) {
  :root {
    --section-padding: var(--section-padding-mobile);
    --gap: var(--gap-mobile);
  }

  .section-title {
    font-size: 1.5rem;
  }
}
```

**Validation**:
```bash
# Check file exists and has no syntax errors
ls -la assets/css/landing-page.css
# File should exist

# Test Hugo build with this file (won't be loaded yet, but shouldn't break)
hugo --gc --minify
# Should succeed
```

**Success criteria**:
- File created in correct location
- Contains CSS variables for brand colors
- Includes base section styling
- Responsive media queries present

---

#### File 2: `assets/css/hero.css`

**Purpose**: Styles for hero section (top of homepage)

**Dependencies**: `landing-page.css` (uses CSS variables)

**Content template**:
```css
/* Hero Section Styles */

.hero {
  text-align: center;
  padding: 6rem 2rem 4rem;
  background: linear-gradient(135deg, var(--color-background) 0%, #ffffff 100%);
}

.hero h1 {
  font-size: 2.5rem;
  color: var(--color-secondary);
  margin-bottom: 1.5rem;
  line-height: 1.2;
}

.hero-description {
  font-size: 1.25rem;
  color: #666;
  max-width: 800px;
  margin: 0 auto 2rem;
  line-height: 1.6;
}

.hero-cta {
  display: flex;
  gap: 1rem;
  justify-content: center;
  flex-wrap: wrap;
}

.btn-primary,
.btn-secondary {
  padding: 0.75rem 2rem;
  font-size: 1rem;
  text-decoration: none;
  border-radius: 4px;
  transition: all 0.3s ease;
  display: inline-block;
}

.btn-primary {
  background-color: var(--color-primary);
  color: white;
}

.btn-primary:hover {
  background-color: #1565C0;
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(25, 118, 210, 0.3);
}

.btn-secondary {
  background-color: transparent;
  color: var(--color-primary);
  border: 2px solid var(--color-primary);
}

.btn-secondary:hover {
  background-color: var(--color-primary);
  color: white;
}

@media (max-width: 768px) {
  .hero {
    padding: 4rem 1rem 2rem;
  }

  .hero h1 {
    font-size: 1.75rem;
  }

  .hero-description {
    font-size: 1rem;
  }

  .hero-cta {
    flex-direction: column;
    align-items: stretch;
  }
}
```

**Validation**:
```bash
# Check file exists
ls -la assets/css/hero.css

# Verify no CSS syntax errors (Hugo will catch them)
hugo --gc
```

**Success criteria**:
- Hero section centered layout
- Two CTA button styles defined
- Responsive mobile styles
- Hover effects on buttons

---

#### File 3: `assets/css/offerings.css`

**Purpose**: Styles for "What We Do" 3-column section

**Dependencies**: `landing-page.css`

**Content template**:
```css
/* Offerings Section Styles */

.offerings {
  padding: 4rem 2rem;
  background: white;
}

.offerings-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: var(--gap);
  max-width: var(--max-width);
  margin: 0 auto;
}

.offering-card {
  text-align: center;
  padding: 2rem;
}

.offering-icon {
  font-size: 3rem;
  margin-bottom: 1rem;
}

.offering-card h3 {
  font-size: 1.5rem;
  color: var(--color-secondary);
  margin-bottom: 1rem;
}

.offering-card p {
  color: #666;
  line-height: 1.6;
}

.offering-card a {
  color: var(--color-primary);
  text-decoration: none;
}

.offering-card a:hover {
  text-decoration: underline;
}

@media (max-width: 1024px) {
  .offerings-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 768px) {
  .offerings-grid {
    grid-template-columns: 1fr;
  }

  .offering-card {
    padding: 1.5rem 1rem;
  }
}
```

**Validation**:
```bash
ls -la assets/css/offerings.css
hugo --gc
```

**Success criteria**:
- 3-column grid on desktop
- 2-column on tablet
- 1-column on mobile
- Responsive breakpoints work

---

#### File 4: `assets/css/project-cards.css`

**Purpose**: Styles for featured project cards

**Dependencies**: `landing-page.css`

**Content template**:
```css
/* Project Cards Styles */

.projects-section {
  padding: 4rem 2rem;
  background: var(--color-background);
}

.projects-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: var(--gap);
  max-width: var(--max-width);
  margin: 2rem auto 0;
}

.project-card {
  background: white;
  border-radius: 8px;
  padding: 2rem;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  display: flex;
  flex-direction: column;
}

.project-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
}

.project-card h3 {
  font-size: 1.5rem;
  color: var(--color-secondary);
  margin-bottom: 0.5rem;
}

.project-status {
  display: inline-block;
  padding: 0.25rem 0.75rem;
  border-radius: 12px;
  font-size: 0.875rem;
  font-weight: 600;
  margin-bottom: 1rem;
}

.status-published {
  background-color: #E8F5E9;
  color: var(--color-published);
}

.status-in-progress {
  background-color: #E3F2FD;
  color: var(--color-in-progress);
}

.status-planned {
  background-color: #ECEFF1;
  color: var(--color-planned);
}

.project-description {
  color: #666;
  line-height: 1.6;
  margin-bottom: 1rem;
  flex-grow: 1;
}

.project-card a {
  color: var(--color-primary);
  text-decoration: none;
  font-weight: 500;
}

.project-card a:hover {
  text-decoration: underline;
}

@media (max-width: 1024px) {
  .projects-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 768px) {
  .projects-grid {
    grid-template-columns: 1fr;
  }
}
```

**Validation**:
```bash
ls -la assets/css/project-cards.css
hugo --gc
```

**Success criteria**:
- Card grid layout with hover effects
- Status badge styles (3 variants)
- Responsive grid collapsing
- Shadow and elevation effects

---

#### File 5: `assets/css/publications.css`

**Purpose**: Styles for publications list

**Dependencies**: `landing-page.css`

**Content template**:
```css
/* Publications Section Styles */

.publications-section {
  padding: 4rem 2rem;
  background: white;
}

.publications-list {
  max-width: var(--max-width);
  margin: 2rem auto 0;
}

.publication-item {
  padding: 1.5rem;
  border-left: 4px solid var(--color-primary);
  background: var(--color-background);
  margin-bottom: 1.5rem;
  border-radius: 0 4px 4px 0;
}

.publication-item h3 {
  font-size: 1.25rem;
  color: var(--color-secondary);
  margin-bottom: 0.5rem;
}

.publication-item h3 a {
  color: var(--color-secondary);
  text-decoration: none;
}

.publication-item h3 a:hover {
  color: var(--color-primary);
}

.publication-metadata {
  color: #666;
  font-size: 0.9rem;
  margin-bottom: 0.5rem;
}

.doi-badge {
  display: inline-block;
  padding: 0.25rem 0.75rem;
  background-color: #FFD700;
  color: #333;
  text-decoration: none;
  border-radius: 4px;
  font-size: 0.875rem;
  font-weight: 600;
  margin-right: 0.5rem;
}

.doi-badge:hover {
  background-color: #FFC700;
}

.pdf-link {
  color: var(--color-primary);
  text-decoration: none;
  font-size: 0.875rem;
}

.pdf-link:hover {
  text-decoration: underline;
}

.view-all-link {
  text-align: center;
  margin-top: 2rem;
}

.view-all-link a {
  color: var(--color-primary);
  text-decoration: none;
  font-weight: 500;
  font-size: 1.1rem;
}

.view-all-link a:hover {
  text-decoration: underline;
}
```

**Validation**:
```bash
ls -la assets/css/publications.css
hugo --gc
```

**Success criteria**:
- List layout with left border accent
- DOI badge styling
- Metadata formatting
- Link hover states

---

#### File 6: `assets/css/blog-cards.css`

**Purpose**: Styles for recent blog post cards

**Dependencies**: `landing-page.css`

**Content template**:
```css
/* Blog Post Cards Styles */

.blog-section {
  padding: 4rem 2rem;
  background: var(--color-background);
}

.blog-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: var(--gap);
  max-width: var(--max-width);
  margin: 2rem auto 0;
}

.blog-card {
  background: white;
  border-radius: 8px;
  padding: 2rem;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  display: flex;
  flex-direction: column;
}

.blog-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.blog-date {
  color: #999;
  font-size: 0.875rem;
  margin-bottom: 0.5rem;
}

.blog-card h3 {
  font-size: 1.25rem;
  color: var(--color-secondary);
  margin-bottom: 1rem;
  line-height: 1.4;
}

.blog-card h3 a {
  color: var(--color-secondary);
  text-decoration: none;
}

.blog-card h3 a:hover {
  color: var(--color-primary);
}

.blog-excerpt {
  color: #666;
  line-height: 1.6;
  margin-bottom: 1rem;
  flex-grow: 1;
}

.blog-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  margin-top: 1rem;
}

.blog-tag {
  background-color: var(--color-background);
  color: var(--color-secondary);
  padding: 0.25rem 0.75rem;
  border-radius: 12px;
  font-size: 0.875rem;
}

.blog-read-more {
  color: var(--color-primary);
  text-decoration: none;
  font-weight: 500;
  font-size: 0.9rem;
}

.blog-read-more:hover {
  text-decoration: underline;
}

@media (max-width: 768px) {
  .blog-grid {
    grid-template-columns: 1fr;
  }
}
```

**Validation**:
```bash
ls -la assets/css/blog-cards.css
hugo --gc
```

**Success criteria**:
- 2-column card grid
- Tag pills styling
- Date formatting
- Mobile single column

---

#### File 7: `layouts/partials/hero.html`

**Purpose**: Hero section HTML template

**Dependencies**: `hero.css`

**Content template**:
```go-html-template
<section class="hero">
  <h1>{{ .Site.Params.description | default "Cognitive Architecture for Reliable AI Systems" }}</h1>
  <p class="hero-description">
    Applying clinically-validated psychological interventions to improve AI system
    reliability and performance through computational therapeutics.
  </p>
  <div class="hero-cta">
    <a href="/services/" class="btn-primary">Our Services</a>
    <a href="/contact/" class="btn-secondary">Get in Touch</a>
  </div>
</section>
```

**Validation**:
```bash
# Check file exists
ls -la layouts/partials/hero.html

# Test by including in index.html (next step)
```

**Success criteria**:
- Uses site config for tagline
- Two CTA buttons present
- Semantic HTML structure
- No Hugo template errors

---

#### File 8: `layouts/partials/offerings.html`

**Purpose**: "What We Do" section HTML template

**Dependencies**: `offerings.css`

**Content template**:
```go-html-template
<section class="offerings landing-section">
  <h2 class="section-title">What We Do</h2>
  <div class="offerings-grid">
    <div class="offering-card">
      <div class="offering-icon">🔬</div>
      <h3>Research</h3>
      <p>
        Investigating model welfare, executive function frameworks, and cognitive
        architecture for AI systems. Published openly under CC-BY licenses.
      </p>
      <a href="/publications/">View Publications →</a>
    </div>

    <div class="offering-card">
      <div class="offering-icon">🧠</div>
      <h3>Frameworks</h3>
      <p>
        STOPPER Protocol (executive function), PrefrontalOS (cognitive operating system),
        CortexGraph (temporal memory system).
      </p>
      <a href="/projects/">Explore Projects →</a>
    </div>

    <div class="offering-card">
      <div class="offering-icon">💼</div>
      <h3>Consulting</h3>
      <p>
        Implementation support, framework training, and AI reliability audits for
        organizations deploying AI systems.
      </p>
      <a href="/services/">Our Services →</a>
    </div>
  </div>
</section>
```

**Validation**:
```bash
ls -la layouts/partials/offerings.html
```

**Success criteria**:
- 3-column structure
- Icons for each offering
- Links to relevant pages
- Consistent content with current site

---

#### File 9: `layouts/partials/project-card.html`

**Purpose**: Reusable project card component

**Dependencies**: `project-cards.css`

**Content template**:
```go-html-template
{{/* Renders a single project card */}}
{{/* Usage: {{ partial "project-card.html" . }} where . is a project page */}}

<div class="project-card">
  <h3>
    <a href="{{ .RelPermalink }}">{{ .Title }}</a>
  </h3>

  {{ if .Params.status }}
  <span class="project-status status-{{ .Params.status | lower }}">
    {{ .Params.status }}
  </span>
  {{ end }}

  <p class="project-description">
    {{ .Params.description | default .Summary }}
  </p>

  <a href="{{ .RelPermalink }}">Learn more →</a>
</div>
```

**Validation**:
```bash
ls -la layouts/partials/project-card.html
```

**Success criteria**:
- Takes page object as context
- Displays title, status, description
- Links to full project page
- Handles missing status gracefully

---

#### File 10: `layouts/partials/publications-list.html`

**Purpose**: Publications list component

**Dependencies**: `publications.css`

**Content template**:
```go-html-template
{{/* Renders recent publications */}}
{{/* Can read from data/publications.yaml if exists, or parse publications.md */}}

<section class="publications-section landing-section">
  <h2 class="section-title">Recent Publications</h2>
  <div class="publications-list">

    {{ if .Site.Data.publications }}
      {{/* Use data file if exists */}}
      {{ range first 3 .Site.Data.publications.publications }}
        {{ if .featured }}
        <div class="publication-item">
          <h3>
            <a href="{{ .pdf_url }}">{{ .title }}</a>
          </h3>
          <p class="publication-metadata">
            {{ .author }} ({{ .year }}) · {{ .venue }}
          </p>
          {{ if .doi }}
            <a href="https://doi.org/{{ .doi }}" class="doi-badge">DOI</a>
          {{ end }}
          {{ if .pdf_url }}
            <a href="{{ .pdf_url }}" class="pdf-link">📄 PDF</a>
          {{ end }}
        </div>
        {{ end }}
      {{ end }}
    {{ else }}
      {{/* Fallback: hardcode for now */}}
      <div class="publication-item">
        <h3>
          <a href="https://doi.org/10.5281/zenodo.17509510">STOPPER: Applying DBT Techniques to AI Assistants</a>
        </h3>
        <p class="publication-metadata">
          Scot Campbell (2025) · Zenodo Preprint
        </p>
        <a href="https://doi.org/10.5281/zenodo.17509510" class="doi-badge">DOI</a>
        <a href="https://doi.org/10.5281/zenodo.17509510" class="pdf-link">📄 PDF</a>
      </div>
    {{ end }}

  </div>
  <div class="view-all-link">
    <a href="/publications/">View all publications →</a>
  </div>
</section>
```

**Validation**:
```bash
ls -la layouts/partials/publications-list.html
```

**Success criteria**:
- Reads from data file if exists
- Fallback to hardcoded content
- Displays DOI badges
- Limits to 3 recent publications

---

#### File 11: `layouts/partials/blog-post-card.html`

**Purpose**: Reusable blog post card component

**Dependencies**: `blog-cards.css`

**Content template**:
```go-html-template
{{/* Renders a single blog post card */}}
{{/* Usage: {{ partial "blog-post-card.html" . }} where . is a post page */}}

<div class="blog-card">
  <div class="blog-date">{{ .Date.Format "January 2, 2006" }}</div>
  <h3>
    <a href="{{ .RelPermalink }}">{{ .Title }}</a>
  </h3>
  <p class="blog-excerpt">
    {{ .Summary | truncate 150 }}
  </p>

  {{ if .Params.tags }}
  <div class="blog-tags">
    {{ range first 3 .Params.tags }}
      <span class="blog-tag">{{ . }}</span>
    {{ end }}
  </div>
  {{ end }}

  <a href="{{ .RelPermalink }}" class="blog-read-more">Read more →</a>
</div>
```

**Validation**:
```bash
ls -la layouts/partials/blog-post-card.html
```

**Success criteria**:
- Displays date, title, excerpt
- Shows first 3 tags
- Truncates summary to 150 chars
- Links to full post

---

#### File 12: `layouts/index.html`

**Purpose**: Main homepage template (assembles all partials)

**Dependencies**: All partials above, all CSS files

**Content template**:
```go-html-template
{{ define "main" }}
  {{/* Hero Section */}}
  {{ partial "hero.html" . }}

  {{/* What We Do Section */}}
  {{ partial "offerings.html" . }}

  {{/* Featured Projects Section */}}
  <section class="projects-section landing-section">
    <h2 class="section-title">Featured Projects</h2>
    <div class="projects-grid">
      {{ range where .Site.RegularPages "Section" "projects" }}
        {{ if .Params.featured }}
          {{ partial "project-card.html" . }}
        {{ end }}
      {{ end }}
    </div>
    <div class="view-all-link">
      <a href="/projects/">View all projects →</a>
    </div>
  </section>

  {{/* Recent Publications Section */}}
  {{ partial "publications-list.html" . }}

  {{/* Recent Blog Posts Section */}}
  <section class="blog-section landing-section">
    <h2 class="section-title">Recent Blog Posts</h2>
    <div class="blog-grid">
      {{ range first 4 (where .Site.RegularPages "Section" "posts") }}
        {{ partial "blog-post-card.html" . }}
      {{ end }}
    </div>
    <div class="view-all-link">
      <a href="/posts/">View all posts →</a>
    </div>
  </section>

  {{/* Final CTA Section */}}
  <section class="hero">
    <h2>Ready to improve AI reliability?</h2>
    <p class="hero-description">
      Let's discuss how computational therapeutics can enhance your AI systems.
    </p>
    <div class="hero-cta">
      <a href="/contact/" class="btn-primary">Contact Us</a>
      <a href="/services/" class="btn-secondary">View Services</a>
    </div>
  </section>
{{ end }}
```

**Validation**:
```bash
ls -la layouts/index.html

# Test Hugo server
hugo server -D
# Visit http://localhost:1313
# Check for Hugo template errors in console
```

**Success criteria**:
- All partials included correctly
- Sections render in correct order
- No Hugo template errors
- Homepage loads in browser

---

#### File 13: Update `content/projects/stopper.md`

**Purpose**: Add featured flag for homepage display

**Action**: Add to front matter

**Changes**:
```yaml
---
title: "STOPPER Protocol"
date: 2025-10-30
draft: false
description: "Executive function framework for AI assistants"
status: "Published"        # ADD THIS
featured: true             # ADD THIS
weight: 1                  # ADD THIS (sort order)
---
```

**Validation**:
```bash
# Verify front matter syntax
hugo --gc
```

---

#### File 14: Update `content/projects/prefrontalos.md`

**Changes**:
```yaml
---
title: "PrefrontalOS"
date: 2025-11-01
draft: false
description: "Cognitive operating system architecture for AI systems"
status: "In Progress"      # ADD THIS
featured: true             # ADD THIS
weight: 2                  # ADD THIS
---
```

---

#### File 15: Update `content/projects/cortexgraph.md`

**Changes**:
```yaml
---
title: "CortexGraph"
date: 2025-10-15
draft: false
description: "Temporal memory system with human-like forgetting curve"
status: "Published"        # ADD THIS
featured: true             # ADD THIS
weight: 3                  # ADD THIS
---
```

---

#### File 16: Create `data/publications.yaml` (Optional)

**Purpose**: Structured publication data

**Content**:
```yaml
publications:
  - title: "STOPPER: Applying DBT Techniques to AI Assistants"
    author: "Scot Campbell"
    year: 2025
    venue: "Zenodo Preprint"
    doi: "10.5281/zenodo.17509510"
    pdf_url: "https://doi.org/10.5281/zenodo.17509510"
    status: "published"
    featured: true

  - title: "Model Welfare and Computational Therapeutics Framework"
    author: "Scot Campbell"
    year: 2025
    venue: "arXiv"
    status: "submitted"
    featured: true
```

**Validation**:
```bash
ls -la data/publications.yaml

# Test Hugo can read it
hugo server -D
# Check publications section on homepage
```

---

#### File 17: Update `hugo.toml`

**Purpose**: Load new CSS files

**Action**: Update `params.customCSS` section

**Changes**:
```toml
[params]
  # ... existing params ...

  customCSS = [
    'css/contact-form.css',
    'css/sticky-nav.css',
    'css/landing-page.css',    # ADD THIS
    'css/hero.css',            # ADD THIS
    'css/offerings.css',       # ADD THIS
    'css/project-cards.css',   # ADD THIS
    'css/publications.css',    # ADD THIS
    'css/blog-cards.css'       # ADD THIS
  ]
```

**Validation**:
```bash
# Verify TOML syntax
hugo --gc --minify

# Check CSS loads in browser
hugo server -D
# Open DevTools → Network → Filter CSS
# Verify all new CSS files load
```

---

### Optional Enhancement: Shrinking Logo Navigation

**Purpose**: Add smooth logo size transition on scroll for better UX

**Implementation**: Add after main landing page is working

---

#### File 18: Create `assets/js/shrinking-nav.js`

**Purpose**: JavaScript to handle scroll-based logo resizing

**Dependencies**: Existing sticky navigation (already in place)

**Content template**:
```javascript
// Shrinking Navigation Logo on Scroll
(function() {
  'use strict';

  // Configuration
  const SCROLL_THRESHOLD = 100; // pixels scrolled before shrinking
  const THROTTLE_DELAY = 100;   // milliseconds between scroll checks

  // Get navigation element
  const nav = document.querySelector('.navigation');
  if (!nav) return; // Exit if no nav found

  let isScrolling = false;
  let lastScrollY = window.scrollY;

  /**
   * Toggle 'scrolled' class based on scroll position
   */
  function handleScroll() {
    const currentScrollY = window.scrollY;

    if (currentScrollY > SCROLL_THRESHOLD) {
      nav.classList.add('scrolled');
    } else {
      nav.classList.remove('scrolled');
    }

    lastScrollY = currentScrollY;
    isScrolling = false;
  }

  /**
   * Throttled scroll event listener
   * Only runs handleScroll every THROTTLE_DELAY ms
   */
  function onScroll() {
    if (!isScrolling) {
      isScrolling = true;
      setTimeout(handleScroll, THROTTLE_DELAY);
    }
  }

  // Initialize on page load
  handleScroll();

  // Attach scroll listener
  window.addEventListener('scroll', onScroll, { passive: true });

  // Handle page visibility changes (e.g., returning to tab)
  document.addEventListener('visibilitychange', function() {
    if (!document.hidden) {
      handleScroll();
    }
  });

})();
```

**Validation**:
```bash
# Check file exists
ls -la assets/js/shrinking-nav.js

# Test JavaScript syntax (Hugo won't validate JS)
# Use browser console or node
node -c assets/js/shrinking-nav.js
```

**Success criteria**:
- No syntax errors
- Throttled scroll listener (performance)
- Adds/removes 'scrolled' class
- Handles edge cases (page visibility)

---

#### File 19: Update `assets/css/sticky-nav.css`

**Purpose**: Add CSS transitions for logo size change

**Action**: Add logo transition styles to existing sticky-nav.css

**Changes to append**:
```css
/* Shrinking Logo Navigation Enhancement */

.navigation {
  transition: padding 0.3s ease, box-shadow 0.3s ease;
}

.navigation .nav-logo {
  transition: all 0.3s ease;
  height: 60px; /* Default logo height */
  width: auto;
}

.navigation .nav-logo img {
  height: 100%;
  width: auto;
  object-fit: contain;
}

/* Scrolled state - smaller logo */
.navigation.scrolled {
  padding: 0.5rem 1rem; /* Reduce nav padding */
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* Add shadow when scrolled */
}

.navigation.scrolled .nav-logo {
  height: 40px; /* Smaller logo height when scrolled */
}

/* Optional: Hide logo text, show only icon when scrolled */
.navigation .logo-text {
  display: inline;
  margin-left: 0.5rem;
  transition: opacity 0.3s ease;
}

.navigation.scrolled .logo-text {
  opacity: 0;
  pointer-events: none;
}

/* Responsive adjustments */
@media (max-width: 768px) {
  .navigation .nav-logo {
    height: 50px; /* Smaller default on mobile */
  }

  .navigation.scrolled .nav-logo {
    height: 36px; /* Even smaller when scrolled on mobile */
  }
}
```

**Alternative: If logo is text-based (not image)**:
```css
/* Text-based logo alternative */
.navigation .site-title {
  font-size: 1.5rem;
  transition: font-size 0.3s ease;
}

.navigation.scrolled .site-title {
  font-size: 1.2rem;
}
```

**Validation**:
```bash
# Verify CSS syntax
hugo --gc

# Test in browser
hugo server -D
# Scroll page and watch logo shrink
```

**Success criteria**:
- Smooth logo size transition
- Navigation padding adjusts
- No layout shifts or jank
- Works on mobile and desktop

---

#### File 20: Update `hugo.toml` (JavaScript)

**Purpose**: Load shrinking navigation JavaScript

**Action**: Add new JS file to customJS array

**Changes**:
```toml
[params]
  # ... existing params ...

  customJS = [
    'js/email-obfuscate.js',
    'js/shrinking-nav.js'    # ADD THIS
  ]
```

**Validation**:
```bash
# Verify TOML syntax
hugo --gc --minify

# Check JS loads in browser
hugo server -D
# Open DevTools → Network → Filter JS
# Verify shrinking-nav.js loads
# Check Console for any errors
```

**Success criteria**:
- JavaScript file loads successfully
- No console errors
- Scroll functionality works
- Logo transitions smoothly

---

### Testing Shrinking Logo Feature

**Manual test sequence**:

1. **Desktop test**:
   ```bash
   hugo server -D
   ```
   - Load homepage at http://localhost:1313/
   - Logo should be full size (60px)
   - Scroll down 100px
   - Logo should shrink to 40px smoothly
   - Scroll back to top
   - Logo should grow back to 60px

2. **Mobile test** (DevTools):
   - Toggle device toolbar (320px width)
   - Logo starts at 50px
   - Scroll down
   - Logo shrinks to 36px
   - Navigation remains usable

3. **Performance check**:
   - Open DevTools → Performance tab
   - Start recording
   - Scroll up and down rapidly
   - Stop recording
   - Verify: No layout thrashing, smooth 60fps

4. **Browser compatibility**:
   - Test in Chrome, Firefox, Safari
   - Verify transitions work in all browsers
   - Check mobile Safari (iOS)

**Common issues**:

- **Logo doesn't shrink**:
  - Check `.navigation` class exists on nav element
  - Verify JS file loads (Network tab)
  - Check console for errors

- **Janky animation**:
  - Ensure using CSS transitions, not JavaScript animation
  - Add `will-change: transform` to logo if needed
  - Check scroll listener is throttled

- **Logo flickers**:
  - Verify scroll threshold (100px) isn't too low
  - Check for competing CSS rules
  - Ensure no conflicting JavaScript

---

### Updated File Count

**Total files: 20 (was 17)**

Added:
- File 18: `assets/js/shrinking-nav.js` (new)
- File 19: `assets/css/sticky-nav.css` (update)
- File 20: `hugo.toml` (update for JS)

**Updated execution order**:
1. Files 1-17: Core landing page (as before)
2. Files 18-20: Shrinking logo enhancement (optional but recommended)

---

### Updated Post-Implementation Checklist

Before committing:

- [ ] All 20 files created/updated
- [ ] `hugo --gc --minify` succeeds with no errors
- [ ] `hugo server -D` runs and homepage loads
- [ ] All 5 sections visible on homepage
- [ ] 3 project cards render correctly
- [ ] Publications section shows at least 1 paper
- [ ] 4 blog post cards display
- [ ] All internal links work
- [ ] Responsive design works at 320px, 768px, 1024px
- [ ] CSS files load (check DevTools Network tab)
- [ ] JavaScript files load (check DevTools Network tab)
- [ ] No console errors in browser
- [ ] **Shrinking logo works on scroll** ✨ NEW
- [ ] **Logo transitions are smooth (no jank)** ✨ NEW
- [ ] Production build creates `public/index.html`
- [ ] File sizes reasonable (index.html < 50KB)

---

### Updated Git Commit Strategy

**With shrinking logo feature**:

```bash
# Option A: Separate commit for enhancement
git add assets/ layouts/ content/projects/ data/ hugo.toml
git commit -m "Implement new landing page with hero, projects, publications, and blog sections

- Add 6 CSS files for component styling
- Create 5 Hugo partials for reusable components
- Build custom layouts/index.html template
- Update project front matter with featured flags
- Add structured publications data file
- Configure CSS loading in hugo.toml

Responsive design: mobile-first, 3 breakpoints (320px, 768px, 1024px)
Brand colors from brand.md applied throughout"

# Then add shrinking nav as second commit
git add assets/js/shrinking-nav.js assets/css/sticky-nav.css hugo.toml
git commit -m "Add shrinking logo navigation enhancement

- Implement scroll-based logo size transition
- Logo shrinks from 60px to 40px after 100px scroll
- Smooth CSS transitions with performance throttling
- Mobile responsive (50px → 36px)
- No layout shift or jank"

# Option B: Single commit with everything
git add assets/ layouts/ content/projects/ data/ hugo.toml
git commit -m "Implement new landing page with shrinking logo navigation

Landing page features:
- Add 6 CSS files for component styling
- Create 5 Hugo partials for reusable components
- Build custom layouts/index.html template
- Update project front matter with featured flags
- Add structured publications data file

Shrinking logo navigation:
- Scroll-based logo size transition (60px → 40px)
- Throttled scroll listener for performance
- Smooth CSS animations with mobile support

Responsive design: mobile-first, 3 breakpoints (320px, 768px, 1024px)
Brand colors from brand.md applied throughout"
```

---

### Validation & Testing Sequence

#### Step 1: Syntax Validation
```bash
# Check Hugo build succeeds
hugo --gc --minify

# Expected: No errors, public/ directory created
```

#### Step 2: Local Server Test
```bash
# Start development server
hugo server -D

# Expected output should include:
# Web Server is available at http://localhost:1313/
```

**Manual checks**:
1. Visit `http://localhost:1313/`
2. Verify hero section displays
3. Check "What We Do" 3-column layout
4. Confirm 3 project cards appear
5. Check publications list shows
6. Verify 4 blog posts display
7. Test all links work

#### Step 3: Responsive Design Test
```bash
# Keep hugo server running
# In browser DevTools:
# - Toggle device toolbar
# - Test at: 320px, 768px, 1024px, 1920px widths
```

**Check**:
- [ ] Mobile (320px): All single column
- [ ] Tablet (768px): Appropriate 2-column layouts
- [ ] Desktop (1024px+): Full 3-column layouts
- [ ] All text readable at all sizes
- [ ] No horizontal scrolling

#### Step 4: Content Verification
```bash
# Verify project cards appear
curl http://localhost:1313/ | grep -c "project-card"
# Expected: 3 (three project cards)

# Verify blog posts appear
curl http://localhost:1313/ | grep -c "blog-card"
# Expected: 4 (four blog post cards)
```

#### Step 5: Production Build Test
```bash
# Clean previous build
rm -rf public/ resources/

# Production build
hugo --gc --minify

# Check output
ls -la public/index.html
# Should exist and be minified

# Check CSS fingerprinting
ls public/css/
# Should see files like landing-page.min.abc123.css
```

#### Step 6: Asset Loading Verification
```bash
# Start server
hugo server

# Check CSS loads (in another terminal)
curl -I http://localhost:1313/css/landing-page.min.css
# Expected: HTTP 200 OK
```

### Common Issues & Solutions

#### Issue 1: Hugo template errors
**Symptom**: `hugo server` shows template errors
**Solution**:
- Check partial names match exactly (case-sensitive)
- Verify closing tags: `{{ end }}`
- Check quote matching in templates

#### Issue 2: CSS not loading
**Symptom**: Styles don't apply
**Solution**:
- Verify `hugo.toml` has correct `customCSS` entries
- Check files are in `assets/css/` not `static/css/`
- Clear browser cache
- Restart Hugo server

#### Issue 3: Project cards don't appear
**Symptom**: No projects show on homepage
**Solution**:
- Verify front matter has `featured: true`
- Check `draft: false` in project files
- Confirm files are in `content/projects/`

#### Issue 4: Publications section empty
**Symptom**: No publications display
**Solution**:
- If using data file: verify `data/publications.yaml` exists
- Check YAML syntax (no tabs, correct indentation)
- Fallback should still show hardcoded STOPPER paper

#### Issue 5: Responsive layout breaks
**Symptom**: Mobile view shows desktop layout
**Solution**:
- Check media queries in CSS
- Verify viewport meta tag in theme's baseof.html
- Test with actual mobile device, not just DevTools

### Post-Implementation Checklist

Before committing:

- [ ] All 17 files created/updated
- [ ] `hugo --gc --minify` succeeds with no errors
- [ ] `hugo server -D` runs and homepage loads
- [ ] All 5 sections visible on homepage
- [ ] 3 project cards render correctly
- [ ] Publications section shows at least 1 paper
- [ ] 4 blog post cards display
- [ ] All internal links work
- [ ] Responsive design works at 320px, 768px, 1024px
- [ ] CSS files load (check DevTools Network tab)
- [ ] No console errors in browser
- [ ] Production build creates `public/index.html`
- [ ] File sizes reasonable (index.html < 50KB)

### Git Commit Strategy

**Recommended commit sequence**:

1. Commit CSS foundation:
   ```bash
   git add assets/css/landing-page.css
   git commit -m "Add landing page CSS foundation with brand variables"
   ```

2. Commit component styles:
   ```bash
   git add assets/css/hero.css assets/css/offerings.css assets/css/project-cards.css assets/css/publications.css assets/css/blog-cards.css
   git commit -m "Add component styles for landing page sections"
   ```

3. Commit Hugo partials:
   ```bash
   git add layouts/partials/*.html
   git commit -m "Add Hugo partials for landing page components"
   ```

4. Commit main template:
   ```bash
   git add layouts/index.html
   git commit -m "Add custom homepage template with all sections"
   ```

5. Commit content updates:
   ```bash
   git add content/projects/*.md data/publications.yaml
   git commit -m "Update project front matter and add publications data"
   ```

6. Commit configuration:
   ```bash
   git add hugo.toml
   git commit -m "Update hugo.toml to load landing page CSS"
   ```

**Or single commit**:
```bash
git add assets/ layouts/ content/projects/ data/ hugo.toml
git commit -m "Implement new landing page with hero, projects, publications, and blog sections

- Add 6 CSS files for component styling
- Create 5 Hugo partials for reusable components
- Build custom layouts/index.html template
- Update project front matter with featured flags
- Add structured publications data file
- Configure CSS loading in hugo.toml

Responsive design: mobile-first, 3 breakpoints (320px, 768px, 1024px)
Brand colors from brand.md applied throughout"
```

---

## Implementation Approach

### Phase 1: Custom Homepage Layout

**Goal**: Create custom homepage template without modifying theme files

#### 1.1 Create Custom Homepage Template
- **File**: `layouts/index.html`
- **Purpose**: Override hugo-coder theme's default homepage
- **Extends**: `layouts/_default/baseof.html` (theme base template)
- **Approach**: Use Hugo's template lookup order (project layouts override theme)

#### 1.2 Content Strategy
- **Option A**: Keep `content/_index.md` for metadata, build layout in template
- **Option B**: Use `content/_index.md` with custom front matter + Hugo partials
- **Recommendation**: Option A for maximum flexibility

---

### Phase 2: Project Cards Component

**Goal**: Create reusable project card shortcode/partial

#### 2.1 Data Structure
```yaml
# In project front matter (e.g., stopper.md)
title: "STOPPER Protocol"
description: "Executive function framework for AI assistants"
status: "Published"  # or "In Progress", "Beta", etc.
icon: "🧠"  # Optional emoji/icon
featured: true  # Display on homepage
weight: 1  # Sort order
tags: ["executive-function", "DBT", "research"]
```

#### 2.2 Hugo Partial: `layouts/partials/project-card.html`
**Inputs**:
- Project page object (from `.Site.RegularPages`)
- Card style (compact/full)

**Displays**:
- Project title and description
- Status badge
- Key features (first 3 bullet points)
- Link to full project page
- Optional: GitHub stars, documentation link

#### 2.3 Styling
**File**: `assets/css/project-cards.css`
- Card grid layout (CSS Grid, 3 columns on desktop, 1 on mobile)
- Hover effects (subtle elevation/shadow)
- Status badges (color-coded: green=published, blue=in-progress, gray=planned)
- Brand colors from `brand.md` (Synapse Blue primary, Cortex Gray secondary)

---

### Phase 3: Publications Section

**Goal**: Display recent publications with DOI badges and metadata

#### 3.1 Publications Data
**Option A**: Parse `content/publications.md` (current approach)
**Option B**: Create `data/publications.yaml` for structured data
**Recommendation**: Option B for better maintainability

```yaml
# data/publications.yaml
publications:
  - title: "STOPPER: Applying DBT Techniques to AI Assistants"
    author: "Scot Campbell"
    year: 2025
    venue: "Zenodo Preprint"
    doi: "10.5281/zenodo.17509510"
    pdf_url: "https://doi.org/10.5281/zenodo.17509510"
    status: "published"
    featured: true

  - title: "Model Welfare and Computational Therapeutics Framework"
    author: "Scot Campbell"
    year: 2025
    venue: "arXiv"
    status: "submitted"
    featured: true
```

#### 3.2 Hugo Partial: `layouts/partials/publications-list.html`
**Parameters**:
- Limit (number to display, default 3)
- Featured only (boolean)

**Displays**:
- Paper title (linked to DOI/preprint)
- Author, year, venue
- DOI badge (if available)
- Status badge (published/submitted/in-progress)
- Download PDF link

#### 3.3 Styling
**File**: `assets/css/publications.css`
- Clean list format with metadata in muted text
- DOI badge styling (mimics official DOI.org badges)
- PDF download icon

---

### Phase 4: Recent Blog Posts Section

**Goal**: Display 3-4 most recent blog posts with excerpts

#### 4.1 Hugo Implementation
Use built-in Hugo functions:
```go
{{ range first 4 (where .Site.RegularPages "Section" "posts") }}
  // Render blog post card
{{ end }}
```

#### 4.2 Hugo Partial: `layouts/partials/blog-post-card.html`
**Displays**:
- Post title (linked)
- Publication date (formatted as "Nov 11, 2025")
- Excerpt/summary (first 150 characters or `.Summary`)
- Tags (first 3 tags)
- Read time estimate (Hugo built-in `.ReadingTime`)

#### 4.3 Styling
**File**: `assets/css/blog-cards.css`
- Card-based layout (2 columns on desktop, 1 on mobile)
- Date displayed prominently
- Tag pills with brand colors
- Excerpt text truncation with ellipsis

---

### Phase 5: Hero Section

**Goal**: Compelling above-the-fold introduction

#### 5.1 Content Structure
```html
<section class="hero">
  <h1>Cognitive Architecture for Reliable AI Systems</h1>
  <p class="hero-description">
    Applying clinically-validated psychological interventions
    to improve AI system reliability and performance through
    computational therapeutics.
  </p>
  <div class="hero-cta">
    <a href="/services/" class="btn-primary">Our Services</a>
    <a href="/contact/" class="btn-secondary">Get in Touch</a>
  </div>
</section>
```

#### 5.2 Styling
**File**: `assets/css/hero.css`
- Centered layout
- Large, readable typography (Atkinson Hyperlegible from brand.md)
- CTA buttons with brand colors
- Responsive font sizing
- Subtle background (optional: brain graph SVG pattern)

---

### Phase 6: "What We Do" Section

**Goal**: Quick-scan overview of company offerings

#### 6.1 Content Structure
Three-column grid showcasing:
1. **Research**: Model welfare, executive function, cognitive architecture
2. **Frameworks**: STOPPER, PrefrontalOS, CortexGraph
3. **Consulting**: Implementation support, training, reliability audits

#### 6.2 Styling
**File**: `assets/css/offerings.css`
- 3-column grid (stacks to 1 column on mobile)
- Icons for each column (can use Font Awesome or emoji)
- Balanced text lengths
- Links to relevant pages

---

## Technical Requirements

### Hugo Configuration Changes

**File**: `hugo.toml`

No major changes required, but verify:
```toml
[params]
  # Ensure custom CSS is loaded
  customCSS = [
    'css/contact-form.css',
    'css/sticky-nav.css',
    'css/hero.css',           # NEW
    'css/project-cards.css',  # NEW
    'css/publications.css',   # NEW
    'css/blog-cards.css',     # NEW
    'css/offerings.css'       # NEW
  ]
```

### New Files to Create

#### Templates
1. `layouts/index.html` - Custom homepage template
2. `layouts/partials/hero.html` - Hero section
3. `layouts/partials/offerings.html` - What We Do section
4. `layouts/partials/project-card.html` - Project card component
5. `layouts/partials/publications-list.html` - Publications list
6. `layouts/partials/blog-post-card.html` - Blog post card component

#### Styles
1. `assets/css/hero.css`
2. `assets/css/project-cards.css`
3. `assets/css/publications.css`
4. `assets/css/blog-cards.css`
5. `assets/css/offerings.css`
6. `assets/css/landing-page.css` - Master layout styles

#### Data (Optional)
1. `data/publications.yaml` - Structured publication data

### Content Updates Required

#### Project Pages
Add to front matter:
```yaml
featured: true  # Display on homepage
weight: 1       # Sort order (1=highest priority)
excerpt: "Brief one-line description for cards"
```

Update files:
- `content/projects/stopper.md`
- `content/projects/prefrontalos.md`
- `content/projects/cortexgraph.md`

#### Publications Page
Consider migrating to structured data format (`data/publications.yaml`).

---

## Design Specifications

### Color Palette (from brand.md)

```css
:root {
  --color-primary: #1976D2;        /* Synapse Blue */
  --color-secondary: #37474F;      /* Cortex Gray */
  --color-background: #FAFAFA;     /* Dendron White */
  --color-success: #2E7D32;        /* Executive Function Green */
  --color-error: #C62828;          /* Cognitive Distress Red */
  --color-warning: #F57C00;        /* Hippocampal Amber */
  --color-code: #D84315;           /* Deep Orange 700 */

  /* Status badges */
  --color-published: var(--color-success);
  --color-in-progress: var(--color-primary);
  --color-planned: var(--color-secondary);
}
```

### Typography

- **Font Family**: Atkinson Hyperlegible (already in brand guidelines)
- **Hero Heading**: 2.5rem (desktop), 1.75rem (mobile)
- **Section Headings**: 2rem (desktop), 1.5rem (mobile)
- **Body Text**: 1rem
- **Card Titles**: 1.25rem

### Spacing

- **Section Padding**: 4rem vertical (desktop), 2rem (mobile)
- **Card Grid Gap**: 2rem (desktop), 1rem (mobile)
- **Max Content Width**: 1200px
- **Mobile Breakpoint**: 768px

### Responsive Design

- **Desktop (≥1024px)**: 3-column project cards, 2-column blog cards
- **Tablet (768px-1023px)**: 2-column project cards, 2-column blog cards
- **Mobile (<768px)**: 1-column everything, stacked layout

---

## Content Migration Strategy

### Preserve Existing Content

**File**: `content/_index.md`

**Option A - Minimal Change**:
Keep existing content in `_index.md`, use only for front matter:
```yaml
---
title: "Prefrontal Systems"
description: "Cognitive architecture for reliable AI systems"
draft: false
hero_title: "Cognitive Architecture for Reliable AI Systems"
hero_description: "Applying clinically-validated psychological interventions..."
---
```
All content rendered by `layouts/index.html` template.

**Option B - Hybrid Approach**:
Keep prose in `_index.md`, template pulls it via `.Content`:
```go-html-template
<section class="intro">
  {{ .Content }}
</section>
```

**Recommendation**: Option A for better separation of content and presentation.

---

## Static Site & GitHub Pages Considerations

### Static Site Architecture (Hugo)

**Critical Understanding**: Hugo is a static site generator - all "dynamic" content is generated at **build time**, not runtime.

#### Build-Time vs. Runtime
- **Build Time** (Hugo generates HTML):
  - Content queries (`where`, `range`, `first`)
  - Template logic and conditionals
  - Data file processing
  - Asset processing (SCSS, minification)
  - All page generation

- **No Runtime** (browser only serves static files):
  - No server-side logic
  - No database queries
  - No dynamic content updates without rebuild
  - Client-side JavaScript only for interactivity

#### Implications for Landing Page

1. **"Recent" Content Auto-Updates**:
   ```go-html-template
   {{ range first 4 (where .Site.RegularPages "Section" "posts") }}
   ```
   - This queries content at BUILD time
   - New blog posts appear automatically AFTER site rebuild
   - Not instant - requires commit → CI/CD → deploy cycle

2. **Project Cards**:
   ```go-html-template
   {{ range where .Site.RegularPages "Section" "projects" }}
     {{ if .Params.featured }}
   ```
   - Iterates through content files at BUILD time
   - Add new project → commit → rebuild → appears on homepage
   - No manual homepage editing required (except for new project file)

3. **Publications List**:
   - If using `data/publications.yaml`: Edit YAML → commit → rebuild
   - If parsing markdown: Edit `publications.md` → commit → rebuild
   - Both require redeploy to update

### GitHub Pages Deployment Workflow

**Current Setup** (from `.github/workflows/hugo.yml`):
```
Trigger: Push to main OR manual workflow dispatch
  ↓
GitHub Actions runner
  ↓
Install Hugo Extended 0.152.2
  ↓
Build: hugo --gc --minify --baseURL <pages-url>
  ↓
Deploy: Upload public/ to GitHub Pages
  ↓
Live site updated (1-2 minutes)
```

#### Content Update Workflow

**Scenario**: Adding new blog post to homepage

1. Developer creates `content/posts/new-post.md`
2. Commit and push to `main` branch
3. GitHub Actions triggers automatically
4. Hugo rebuilds entire site (including homepage with new post)
5. Deploys to `https://prefrontal.systems/`
6. Post appears on homepage (~2 minutes total)

**No manual homepage editing required** - this is the power of static site generation.

#### Branch Development Workflow

**For this landing page redesign**:

1. Develop on branch: `claude/plan-landing-page-redesign-011CV2Fv6sznpehCmCP44g2J`
2. Test locally: `hugo server -D` (development server with drafts)
3. Build test: `hugo --gc --minify` (verify production build)
4. Commit changes to branch
5. Push to remote branch
6. **Preview options**:
   - Option A: Deploy branch to Netlify/Vercel preview (if configured)
   - Option B: Build locally, inspect `public/` directory
   - Option C: Merge to `main` (production deployment)
7. Merge to `main` → automatic GitHub Pages deployment

### Asset Handling for Static Sites

#### Base URL Configuration
**File**: `hugo.toml`
```toml
baseURL = 'https://prefrontal.systems/'
```

**Critical for GitHub Pages**:
- All asset paths generated relative to baseURL
- Images: `/images/logo.png` → `https://prefrontal.systems/images/logo.png`
- CSS: `/css/style.css` → `https://prefrontal.systems/css/style.css`
- Links: `/projects/` → `https://prefrontal.systems/projects/`

#### Assets Directory Structure

**Hugo asset processing** (goes through Hugo Pipes):
```
assets/
├── css/
│   ├── hero.css
│   ├── project-cards.css
│   └── ...
└── js/
    └── email-obfuscate.js
```
- Processed by Hugo (minification, concatenation)
- Output to `public/` with hashed filenames (cache busting)
- Referenced via `{{ $style := resources.Get "css/hero.css" | minify }}`

**Static files** (copied as-is):
```
static/
├── images/
│   ├── brain-graph-whitebg-circle.png
│   └── ...
├── favicon.ico
└── site.webmanifest
```
- Copied directly to `public/` root
- No processing, no cache busting
- URL: `/images/logo.png` (served from `public/images/logo.png`)

#### CSS Loading Strategy for Landing Page

**In `hugo.toml`**:
```toml
[params]
  customCSS = [
    'css/contact-form.css',
    'css/sticky-nav.css',
    'css/landing-page.css',    # NEW: Master layout
    'css/hero.css',            # NEW
    'css/project-cards.css',   # NEW
    'css/publications.css',    # NEW
    'css/blog-cards.css',      # NEW
    'css/offerings.css'        # NEW
  ]
```

**Theme template loads these via**:
```go-html-template
{{ range .Site.Params.customCSS }}
  {{ $style := resources.Get (printf "css/%s" .) | minify | fingerprint }}
  <link rel="stylesheet" href="{{ $style.RelPermalink }}" />
{{ end }}
```

- Hugo processes: `assets/css/hero.css`
- Minifies and adds fingerprint: `hero.min.abc123.css`
- Output to: `public/css/hero.min.abc123.css`
- Automatic cache busting on content change

### GitHub Pages Specifics

#### Deployment Location
- **Repo**: `https://github.com/prefrontalsys/prefrontalsys.github.io`
- **Branch for Pages**: `main` (via GitHub Actions)
- **Build directory**: `public/` (Hugo output)
- **Live URL**: `https://prefrontal.systems/` (custom domain)

#### GitHub Actions Build

**Workflow file**: `.github/workflows/hugo.yml`

Key considerations for landing page:
1. **Hugo Extended version required**: 0.152.2 (for SCSS processing)
2. **Build command**: `hugo --gc --minify --baseURL "${{ steps.pages.outputs.base_url }}"`
3. **Artifact upload**: Entire `public/` directory
4. **Deploy to Pages**: Automatic via workflow

#### Custom Domain (prefrontal.systems)

- DNS configured externally (CNAME to `prefrontalsys.github.io`)
- GitHub Pages serves via custom domain
- `baseURL` in `hugo.toml` matches custom domain
- HTTPS via GitHub Pages certificate

### Preview & Staging Considerations

**Challenge**: GitHub Pages only deploys from `main` branch (in current config)

**Preview options for landing page testing**:

1. **Local Hugo server** (recommended for development):
   ```bash
   hugo server -D
   # Live reload at http://localhost:1313
   # Instant feedback on changes
   ```

2. **Local production build**:
   ```bash
   hugo --gc --minify
   # Check public/ directory
   # Open public/index.html in browser
   ```

3. **Branch preview services** (optional setup):
   - Netlify Deploy Previews (PR-based)
   - Vercel GitHub integration
   - Cloudflare Pages (branch deployments)
   - Requires additional configuration

4. **GitHub Pages branch deployment** (alternative):
   - Modify workflow to deploy branches to subpaths
   - Example: `https://prefrontal.systems/preview/branch-name/`
   - Requires workflow changes

**Recommendation for this project**: Use local Hugo server for development, build test before merging to `main`.

### Performance Considerations for Static Sites

#### Advantages
- **Fast page loads**: Pre-generated HTML (no server rendering)
- **CDN-friendly**: All static assets cacheable
- **Scalable**: GitHub Pages CDN handles traffic spikes
- **Reliable**: No database or server failures

#### Optimizations for Landing Page

1. **CSS Minification** (automatic via Hugo Pipes):
   ```go-html-template
   {{ $style := resources.Get "css/landing-page.css" | minify | fingerprint }}
   ```

2. **Asset Fingerprinting** (cache busting):
   - Hugo generates: `style.min.abc123.css`
   - Browser caches indefinitely
   - Content change → new fingerprint → cache invalidated

3. **Image Optimization** (future enhancement):
   - Hugo Image Processing for responsive images
   - WebP format conversion
   - Lazy loading attributes

4. **Critical CSS** (optional):
   - Inline hero section CSS in `<head>`
   - Defer non-critical styles

### Content Management Workflow

**Adding new content that appears on landing page**:

#### Scenario 1: New Blog Post
```bash
# Create post
hugo new posts/new-topic.md

# Edit content in content/posts/new-topic.md
# Set draft: false when ready

# Commit and push
git add content/posts/new-topic.md
git commit -m "Add blog post: New Topic"
git push origin main

# GitHub Actions builds site
# Post appears on homepage automatically (top 4 recent)
```

#### Scenario 2: New Project
```bash
# Create project page
hugo new projects/new-project.md

# Edit content, add to front matter:
# featured: true
# weight: 1

# Commit and push
git add content/projects/new-project.md
git commit -m "Add project: New Project"
git push origin main

# GitHub Actions builds site
# Project card appears on homepage automatically
```

#### Scenario 3: New Publication
**Option A** (data file approach):
```bash
# Edit data/publications.yaml
# Add new entry with featured: true

# Commit and push
git add data/publications.yaml
git commit -m "Add publication: Paper Title"
git push origin main

# GitHub Actions builds site
# Publication appears on homepage
```

**Key point**: Homepage template queries this content at build time, so updates propagate automatically after rebuild.

### Static Site Limitations & Mitigations

#### Limitation 1: No Real-Time Updates
**Issue**: Content changes not instant (requires rebuild)
**Impact**: Homepage shows recent posts/publications with ~2 minute delay
**Mitigation**: Acceptable for blog/research content (not time-critical)

#### Limitation 2: No Server-Side Logic
**Issue**: Can't personalize content per visitor
**Impact**: All visitors see same homepage
**Mitigation**: Not needed for company landing page

#### Limitation 3: No Database Queries
**Issue**: Can't filter/search without client-side JavaScript
**Impact**: "Recent posts" list static (top 4 at build time)
**Mitigation**: Hugo template logic generates correct list at build time

#### Limitation 4: Build Time Overhead
**Issue**: Every content change triggers full site rebuild
**Impact**: ~10-30 seconds per build (site dependent)
**Mitigation**: Hugo is fast; ~35 posts + 3 projects = quick build

### Testing Static Site Behavior

**Verify build-time content generation**:

1. **Test with different content**:
   ```bash
   # Add draft post
   hugo new posts/test-post.md

   # Build without drafts
   hugo --minify
   # Check: post NOT in public/index.html

   # Build with drafts
   hugo -D --minify
   # Check: post IS in public/index.html
   ```

2. **Test content ordering**:
   ```bash
   # Check recent posts appear in date order
   grep -A5 "recent-posts" public/index.html
   ```

3. **Test featured projects filter**:
   ```bash
   # Set featured: false on one project
   # Rebuild and verify it doesn't appear on homepage
   ```

4. **Test asset paths**:
   ```bash
   # Build and check all paths use baseURL
   grep -r "http://localhost" public/
   # Should return no results (local paths only in hugo server)
   ```

### GitHub Pages Deployment Verification

**Post-deployment checklist**:

1. **Check live site**:
   - Visit `https://prefrontal.systems/`
   - Verify homepage layout renders correctly
   - Test responsive design on mobile

2. **Verify asset loading**:
   - Open browser DevTools → Network tab
   - Check all CSS files load (200 status)
   - Verify fingerprinted filenames (cache busting working)

3. **Check GitHub Actions**:
   - Visit `https://github.com/prefrontalsys/prefrontalsys.github.io/actions`
   - Verify workflow succeeded (green checkmark)
   - Review build logs for errors

4. **Test content updates**:
   - Add a test blog post
   - Push to main
   - Wait for deployment
   - Verify post appears on homepage

---

## Testing Plan

### Local Testing Checklist

1. **Visual Testing**:
   - [ ] Hero section displays correctly on all screen sizes
   - [ ] Project cards render with correct data
   - [ ] Publications list shows DOI badges
   - [ ] Blog post cards show recent posts with correct dates
   - [ ] All links work correctly
   - [ ] Brand colors applied consistently

2. **Responsive Testing**:
   - [ ] Test at 320px (mobile), 768px (tablet), 1024px (desktop), 1920px (wide)
   - [ ] Card grids collapse appropriately
   - [ ] Text remains readable at all sizes
   - [ ] CTA buttons accessible on mobile

3. **Content Testing**:
   - [ ] All projects appear if `featured: true`
   - [ ] Publications sorted by date (newest first)
   - [ ] Blog posts show correct excerpt length
   - [ ] Fallbacks work if content missing (e.g., no featured projects)

4. **Performance Testing**:
   - [ ] Page loads quickly (< 2s)
   - [ ] Images optimized (if added)
   - [ ] CSS minified in production build
   - [ ] No console errors

### Browser Testing

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Mobile Safari (iOS)
- Chrome Mobile (Android)

---

## Implementation Timeline

### Phase 1: Foundation (Day 1)
- Create `layouts/index.html` basic structure
- Set up CSS files with variables
- Test basic layout rendering

### Phase 2: Hero & Offerings (Day 1-2)
- Build hero section partial
- Build offerings section partial
- Style with brand guidelines
- Test responsive behavior

### Phase 3: Project Cards (Day 2-3)
- Create project card partial
- Add front matter to project files
- Implement card grid layout
- Style cards with status badges

### Phase 4: Publications & Blog (Day 3-4)
- Build publications list partial
- Build blog post card partial
- Test data retrieval from Hugo
- Style lists and cards

### Phase 5: Polish & Testing (Day 4-5)
- Refine spacing and typography
- Cross-browser testing
- Mobile responsive testing
- Performance optimization
- Final content review

### Phase 6: Deployment (Day 5)
- Final build test (`hugo --gc --minify`)
- Commit and push to branch
- Verify GitHub Actions build
- Review deployed site
- Create pull request if needed

---

## Success Metrics

### User Experience
- **Above-the-fold value**: Visitor understands company offering within 5 seconds
- **Content discoverability**: All major sections (projects, publications, blog) visible
- **Navigation efficiency**: Reduce clicks to reach project/publication pages
- **Mobile usability**: Full functionality on mobile devices

### Technical
- **Build time**: < 5 seconds for Hugo build
- **Page load**: < 2 seconds on 3G connection
- **Accessibility**: WCAG 2.1 AA compliance
- **SEO**: Structured data, proper heading hierarchy

### Content
- **Project showcase**: All 3 projects clearly presented
- **Publication visibility**: Latest research immediately visible
- **Blog engagement**: Recent posts encourage exploration
- **Brand consistency**: Technical voice maintained throughout

---

## Risks & Mitigations

### Risk 1: Theme Conflicts
**Issue**: Custom homepage might conflict with hugo-coder theme expectations
**Mitigation**:
- Test thoroughly with theme's baseof.html
- Use theme's CSS variables where possible
- Namespace custom CSS classes

### Risk 2: Content Maintenance
**Issue**: Homepage requires manual updates when new content added
**Mitigation**:
- Use Hugo's dynamic content loading (`.Site.RegularPages`)
- Automate publication list from data file
- Blog posts automatically appear (sorted by date)

### Risk 3: Mobile Performance
**Issue**: Rich landing page may be slower on mobile
**Mitigation**:
- Minimize CSS (use Hugo pipes)
- Lazy load images (if added later)
- Test on real devices
- Consider progressive enhancement

### Risk 4: Breaking Existing URLs
**Issue**: Homepage restructure might break bookmarks/SEO
**Mitigation**:
- Homepage URL remains unchanged (`/`)
- All subpages remain at existing URLs
- No redirects needed

---

## Future Enhancements (Post-Launch)

### Phase 7: Advanced Features
1. **Project Screenshots**: Add visual previews to project cards
2. **Testimonials Section**: Client/user quotes (if available)
3. **Newsletter Signup**: Inline subscription form
4. **Animation**: Subtle scroll animations for sections
5. **Dark Mode**: Brand-compliant dark color scheme
6. **Search**: Site-wide search integration

### Content Expansions
1. **Case Studies**: Detailed implementation stories
2. **Research Updates**: RSS feed or updates section
3. **Team Section**: If team grows beyond solo researcher
4. **Events/Speaking**: Conference presentations, workshops

---

## Technical Notes

### Hugo Template Patterns

**Fetching featured projects**:
```go-html-template
{{ range where .Site.RegularPages "Section" "projects" }}
  {{ if .Params.featured }}
    {{ partial "project-card.html" . }}
  {{ end }}
{{ end }}
```

**Fetching recent blog posts**:
```go-html-template
{{ range first 4 (where .Site.RegularPages "Section" "posts") }}
  {{ partial "blog-post-card.html" . }}
{{ end }}
```

**Fetching publications from data file**:
```go-html-template
{{ range first 3 .Site.Data.publications.publications }}
  {{ if .featured }}
    <div class="publication">
      <h3><a href="{{ .pdf_url }}">{{ .title }}</a></h3>
      <p class="metadata">{{ .author }} ({{ .year }}) · {{ .venue }}</p>
      {{ if .doi }}
        <a href="https://doi.org/{{ .doi }}" class="doi-badge">DOI</a>
      {{ end }}
    </div>
  {{ end }}
{{ end }}
```

### CSS Architecture

**File organization**:
1. `landing-page.css` - Master layout (grid, sections, spacing)
2. `hero.css` - Hero-specific styles
3. `project-cards.css` - Project card component styles
4. `publications.css` - Publication list styles
5. `blog-cards.css` - Blog post card styles
6. `offerings.css` - What We Do section styles

**Import strategy**: Load via `hugo.toml` `params.customCSS` in order

---

## Documentation Updates Needed

After implementation, update:
1. **This file** (`LANDING_PAGE_REDESIGN_PLAN.md`) - Mark as "Implemented"
2. **README.md** - Document new homepage structure
3. **CLAUDE.md** - Add landing page customization notes
4. **Content editing guide** - How to add featured projects/publications

---

## Approval & Sign-Off

- [ ] Plan reviewed and approved
- [ ] Design specifications confirmed
- [ ] Technical approach validated
- [ ] Timeline acceptable
- [ ] Ready to proceed with implementation

---

## Questions for Stakeholder

Before implementation, confirm:

1. **Content Priority**: Which 3 projects should be featured? (Currently: STOPPER, PrefrontalOS, CortexGraph)
2. **Blog Posts**: Show 3 or 4 recent posts?
3. **Publications**: Include "in progress" papers or only published?
4. **Hero CTA**: "Our Services" and "Contact" buttons, or different CTAs?
5. **Visual Elements**: Add brain graph background/pattern, or keep minimal?
6. **Mobile Navigation**: Keep existing menu or optimize for landing page?

---

## References

- **Brand Guidelines**: `brand.md`
- **Current Homepage**: `content/_index.md`
- **Hugo Coder Theme**: `themes/hugo-coder/`
- **Hugo Documentation**: https://gohugo.io/templates/
- **Project Instructions**: `CLAUDE.md`

---

**Document Version**: 1.0
**Last Updated**: 2025-11-11
**Author**: Claude (Anthropic)
**Status**: Awaiting Approval
