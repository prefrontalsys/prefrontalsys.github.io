# Contract: SEO Configuration

**Type**: Data files and configuration for SEO enhancements

## Sitemap Configuration

**File**: `hugo.toml`

Add sitemap section (optional customization - Hugo generates sitemap by default):

```toml
[sitemap]
  changefreq = "weekly"
  filename = "sitemap.xml"
  priority = 0.5
```

## SEO Keywords Data File

**File**: `data/seo-keywords.yaml`

```yaml
homepage:
  - KnowOps
  - knowledge operations
  - AI cognitive architecture
  - reliable AI systems
  - Prefrontal Systems

knowops:
  - KnowOps
  - knowledge operations
  - AI cognitive architecture
  - AI memory systems
  - executive function for LLMs
  - cognitive operations

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
  - KnowOps training

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
  - knowledge workflows

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

## Head Partial Override (if needed)

**File**: `layouts/partials/head.html`

Override theme's head partial to use keyword data file:

```html
{{ $pageType := .Section | default "homepage" }}
{{ $baseKeywords := index site.Data.seo-keywords $pageType | default (index site.Data.seo-keywords "homepage") }}
{{ $pageKeywords := .Params.keywords | default slice }}
{{ $allKeywords := union $baseKeywords $pageKeywords }}

<meta name="keywords" content="{{ delimit $allKeywords ", " }}">
```

**Note**: Check if hugo-coder theme already handles keywords from front matter. If so, this override may not be needed - just ensure each page has `keywords` in front matter that includes both base and custom terms.

## Validation Checklist

- [ ] `hugo.toml` has sitemap configuration (or uses default)
- [ ] `data/seo-keywords.yaml` created with all page types
- [ ] Each page type has 4-7 relevant keywords
- [ ] Head partial (if needed) merges base + page-specific keywords
- [ ] Build site and verify `sitemap.xml` in public/ directory
- [ ] Verify `<meta name="keywords">` in page source includes expected terms
