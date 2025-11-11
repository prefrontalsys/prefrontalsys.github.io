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
