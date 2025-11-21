# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is the **Prefrontal Systems℠ website** - a Hugo-based static site hosted on GitHub Pages at [prefrontal.systems](https://prefrontal.systems).

**Purpose**: Company website showcasing computational therapeutics research, projects (STOPPER Protocol, PrefrontalOS, CortexGraph), publications, and services.

**Tech Stack**:
- Hugo 0.152.2 (extended version for SCSS/Sass support)
- hugo-coder theme (git submodule)
- GitHub Pages deployment via GitHub Actions
- w3forms for contact form handling

## Development Commands

### Local Development

```bash
# Clone with theme submodule (first time)
git clone --recursive https://github.com/prefrontal-systems/prefrontalsys.github.io.git

# Update submodules (if already cloned)
git submodule update --init --recursive

# Start local development server with drafts
hugo server -D

# Start server (production mode, no drafts)
hugo server

# Build for production
hugo --gc --minify
```

The development server runs at `http://localhost:1313/` with live reload.

### Theme Updates

```bash
# Update hugo-coder theme to latest
cd themes/hugo-coder
git pull origin main
cd ../..
git add themes/hugo-coder
git commit -m "Update hugo-coder theme"
```

### Content Management

```bash
# Create new blog post
hugo new posts/my-post-title.md

# Create new project page
hugo new projects/project-name.md

# Create new page (custom section)
hugo new section-name/page-name.md
```

## Project Structure

### Content Organization

```
content/
├── _index.md              # Homepage content
├── about.md               # About page
├── contact.md             # Contact page with w3forms integration
├── publications.md        # Publications listing
├── services.md           # Services page
├── posts/                # Blog posts
│   └── *.md
└── projects/             # Project showcases
    └── *.md              # STOPPER, PrefrontalOS, CortexGraph, etc.
```

### Custom Components

**Layouts**:
- `layouts/shortcodes/contact-form.html` - w3forms contact form shortcode
- `layouts/partials/` - Custom partial overrides for hugo-coder theme
- `layouts/posts/` - Custom post layouts
- `layouts/series/` - Series taxonomy layouts

**Assets** (processed by Hugo Pipes):
- `assets/css/contact-form.css` - Contact form styling
- `assets/css/sticky-nav.css` - Sticky navigation bar
- `assets/js/email-obfuscate.js` - Email obfuscation for spam protection

**Static Files** (copied as-is):
- `static/images/` - Logo, favicon, images
- `static/site.webmanifest` - PWA manifest
- `static/*.png` - Favicons (favicon.ico, android-chrome, apple-touch-icon)

### Configuration

**Primary Config**: `hugo.toml`

Key configuration areas:
- Base URL: `https://prefrontal.systems/`
- Theme: `hugo-coder` (git submodule)
- Custom CSS/JS: Configured in `params.customCSS` and `params.customJS`
- Menu structure: Defined in `languages.en.menu.main`
- Social links: GitHub and ORCID in `params.social`

**Brand Assets**: `brand.md` (comprehensive brand guidelines - colors, typography, messaging)

## Hugo Theme Customization

This site uses the **hugo-coder** theme as a git submodule with custom overrides:

### Overriding Theme Files

To customize theme templates:
1. Copy file from `themes/hugo-coder/layouts/` to `layouts/` (same path structure)
2. Modify the local copy - it takes precedence over theme version
3. Never edit files directly in `themes/hugo-coder/` (git submodule)

### Custom Shortcodes

**Contact Form** - Usage in markdown:
```markdown
{{< contact-form >}}
```

Integrates with w3forms API (access key in shortcode template).

## Brand Guidelines

### Color Palette

From `brand.md`:
- **Primary**: `#1976D2` (Synapse Blue)
- **Secondary**: `#37474F` (Cortex Gray)
- **Background**: `#FAFAFA` (Dendron White)
- **Success**: `#2E7D32` (Executive Function Green)
- **Error**: `#C62828` (Cognitive Distress Red)
- **Memory**: `#F57C00` (Hippocampal Amber)
- **Code**: `#D84315` (Deep Orange 700)

### Typography

- **Primary Font**: Atkinson Hyperlegible (OFL license) - designed for cognitive accessibility
- **Academic Papers**: XCharter (extended Charter) for LaTeX
- Meta-alignment: Font designed for human cognitive processing, company designs cognitive infrastructure for AI

### Logo

Brain graph visualization (`images/brain-graph-whitebg-circle.png`)

## Deployment

### Automatic Deployment

Deployment happens automatically via GitHub Actions (`.github/workflows/hugo.yml`):
- Trigger: Push to `main` branch or manual workflow dispatch
- Hugo version: 0.152.2 (extended)
- Build command: `hugo --gc --minify --baseURL <pages-url>`
- Output: `public/` directory uploaded to GitHub Pages

### Manual Deployment Check

```bash
# Verify build works locally before pushing
hugo --gc --minify

# Check public/ directory
ls -la public/

# Clean build cache if needed
hugo --gc
rm -rf public/ resources/
```

## Content Guidelines

### Front Matter

Standard front matter for pages:

```yaml
---
title: "Page Title"
date: 2025-11-09
draft: false
description: "Brief description for SEO"
tags: ["tag1", "tag2"]
categories: ["category"]
---
```

### Writing Style

From parent `CLAUDE.md` and brand guidelines:
- **Direct and technical** - No corporate speak
- **Evidence-based** - Cite research, include limitations
- **First principles** - Explain WHY, not just WHAT
- **Honest about scale** - Transparent about being independent researcher
- **No excessive praise** - Avoid superlatives and over-validation

### Research Content

When adding publications or projects:
- Include DOI/arXiv links
- Cite convergent evolution findings (DBT/CBT ↔ AI frameworks)
- Link to open source repos (GitHub)
- Use CC-BY 4.0 for papers, Apache 2.0 for code references

## Common Tasks

### Adding a Blog Post

```bash
hugo new posts/my-new-post.md
```

Edit front matter and content. Include:
- Clear title and description
- Relevant tags (computational-therapeutics, model-welfare, stopper, etc.)
- Technical details with code examples if applicable
- Links to related projects/publications

### Adding a Project Page

```bash
hugo new projects/project-name.md
```

Structure should include:
- Project overview and motivation
- Technical approach
- Results/validation
- Links to code, papers, or demos
- Connection to computational therapeutics framework

### Updating Brand Assets

1. Edit `brand.md` for comprehensive changes
2. Update `hugo.toml` for site-specific config
3. Modify CSS in `assets/css/` for visual changes
4. Update favicons/logo in `static/images/`

### Testing Contact Form

Contact form uses w3forms (access key: 4559cc00-0975-4de0-9eca-bc0f70203ebb):
- Test submissions go to configured email
- Redirect on success: `/contact/success/`
- Honeypot spam protection: `botcheck` field

## SEO and Metadata

Configured in `hugo.toml`:
- **Site description**: "Cognitive architecture for reliable AI systems"
- **Keywords**: computational therapeutics, AI reliability, model welfare, STOPPER protocol, PrefrontalOS, executive function, DBT, CBT
- **Author**: PREFRONTAL SYSTEMS

## License

- **Content** (`content/` directory): CC BY-SA 4.0
- **Code** (configuration, layouts, assets): AGPL-3.0
- **Theme** (hugo-coder): MIT License (separate submodule)

## Related Repositories

Research projects documented on this site (separate repos):
- **mnemex** - Temporal memory system (PyPI published)
- **anastrophex** - Three-tier cognitive OS
- **e-fit-research** - Eight DBT/CBT techniques for AI (STOPPER paper)
- **temporal-guidance-system** - Socratic debate archives

## Important Notes

### Domain Strategy

From `brand.md`:
- **prefrontal.systems** (primary) - Main website
- **prefrontalsys.com** - Commercial services
- **prefrontalsys.ai** - AI platform
- **prefrontalsys.org** - Research/nonprofit

This repo deploys to `prefrontal.systems` (configured in `hugo.toml` baseURL).

### Hugo Extended Version Required

This site uses Hugo Extended (0.152.2) for SCSS/Sass processing. Standard Hugo will fail. The GitHub Actions workflow installs the correct version automatically.

### Submodule Management

The theme is a git submodule. When cloning or pulling:
- Always use `--recursive` flag or run `git submodule update --init --recursive`
- Never commit changes inside `themes/hugo-coder/`
- Override theme files by copying to `layouts/` instead

### Email Obfuscation

Email addresses in content should use obfuscation for spam protection:
- JavaScript in `assets/js/email-obfuscate.js` handles decoding
- Configure in page template or use data attributes

### Sticky Navigation

Custom CSS in `assets/css/sticky-nav.css` provides sticky navigation bar. Ensure this loads via `hugo.toml` `params.customCSS` configuration.

## Active Technologies
- Hugo 0.152.2 (extended version for SCSS), HTML5, CSS3, Markdown + Hugo static site generator, hugo-coder theme (git submodule), w3forms (contact handling) (001-knowops-site-redesign)
- Markdown files in content/, GitHub Pages hosting (001-knowops-site-redesign)

## Recent Changes
- 001-knowops-site-redesign: Added Hugo 0.152.2 (extended version for SCSS), HTML5, CSS3, Markdown + Hugo static site generator, hugo-coder theme (git submodule), w3forms (contact handling)
