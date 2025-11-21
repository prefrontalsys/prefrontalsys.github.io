# Quickstart: KnowOps Site Redesign

**Feature**: 001-knowops-site-redesign
**Generated**: 2025-11-21

## Prerequisites

- Hugo 0.152.2+ (extended version)
- Git
- Text editor

## Setup

### 1. Clone and Setup

```bash
# If not already cloned
git clone --recursive https://github.com/prefrontalsys/prefrontalsys.github.io.git
cd prefrontalsys.github.io

# Switch to feature branch
git checkout 001-knowops-site-redesign

# Update theme submodule
git submodule update --init --recursive
```

### 2. Verify Hugo Version

```bash
hugo version
# Expected: hugo v0.152.2+extended
```

If not installed or wrong version:
```bash
# macOS
brew install hugo

# Or download from https://gohugo.io/installation/
```

### 3. Start Development Server

```bash
hugo server -D
```

Site available at: http://localhost:1313/

`-D` flag includes draft content.

## Implementation Order

### Phase 1: Configuration (do first)

1. **Update hugo.toml**
   - New menu structure (see `contracts/hugo-config.md`)
   - Updated SEO params
   - Add `css/knowops.css` to customCSS

2. **Create CSS file**
   - `assets/css/knowops.css` (see `contracts/layouts.md`)

### Phase 2: Layouts (do before content)

1. **Create section layouts**
   - `layouts/research/list.html`
   - `layouts/journal/list.html`
   - `layouts/frameworks/list.html`
   - `layouts/frameworks/single.html`

2. **Update shortcode**
   - `layouts/shortcodes/contact-form.html`

### Phase 3: Content Structure

1. **Create new directories**
   ```bash
   mkdir -p content/knowops/
   mkdir -p content/research/
   mkdir -p content/frameworks/
   ```

2. **Create data file**
   ```bash
   mkdir -p data/
   touch data/publications.yaml
   ```

3. **Create landing pages**
   - `content/knowops/_index.md`
   - `content/frameworks/_index.md`
   - `content/research/_index.md`
   - `content/journal/_index.md`

### Phase 4: Content Pages

1. **Framework pages** (with aliases)
   - `content/frameworks/prefrontalos.md`
   - `content/frameworks/cortexgraph.md`
   - `content/frameworks/stopper.md`

2. **Update existing pages**
   - `content/_index.md` (homepage)
   - `content/services.md`
   - `content/about.md`
   - `content/contact.md`

### Phase 5: Migration

1. **Rename posts to journal**
   ```bash
   mv content/posts content/journal
   ```

2. **Add aliases to all journal articles**
   - Each needs `/posts/old-slug/` alias

3. **Populate publications data**
   - Add entries to `data/publications.yaml`

### Phase 6: Cleanup

1. **Remove old directories** (after migration)
   ```bash
   rm -rf content/projects/
   rm -rf content/publications/
   rm -rf content/posts_backup/  # If no longer needed
   ```

2. **Verify all redirects work**

## Verification

### Build Check

```bash
hugo --gc --minify
```

Should complete without errors.

### Manual Testing Checklist

- [ ] Navigation shows all 7 sections
- [ ] Frameworks dropdown works
- [ ] Homepage displays KnowOps hero
- [ ] `/knowops/` loads cornerstone page
- [ ] `/frameworks/` shows framework grid
- [ ] Each framework page loads with positioning
- [ ] `/services/` shows 4 tiers
- [ ] `/research/` shows publications by type
- [ ] `/journal/` shows articles with categories
- [ ] Contact form has inquiry type selector
- [ ] Old URLs redirect properly:
  - `/projects/` → `/frameworks/`
  - `/publications/` → `/research/`
  - `/posts/` → `/journal/`
  - `/posts/any-article/` → `/journal/any-article/`

### SEO Verification

- [ ] View page source for meta tags
- [ ] Description under 160 chars
- [ ] Keywords include KnowOps terms
- [ ] Open Graph tags present

## Common Issues

### Theme not loading
```bash
git submodule update --init --recursive
```

### Hugo build errors
- Check YAML front matter syntax (spaces, not tabs)
- Verify all required fields present
- Check for template syntax errors in layouts

### Redirects not working
- Verify `aliases` in front matter is array format
- Check no trailing slashes in alias paths
- Clear browser cache

### Menu not showing
- Verify `hugo.toml` syntax
- Check menu item weights are unique
- Verify parent matches exactly for submenus

## Useful Commands

```bash
# Start server with drafts
hugo server -D

# Build production
hugo --gc --minify

# Check for errors only
hugo --quiet

# List all content
hugo list all

# Check specific page
hugo server -D --navigateToChanged
```

## Files Reference

| Artifact | Purpose |
|----------|---------|
| `specs/001-knowops-site-redesign/spec.md` | Feature requirements |
| `specs/001-knowops-site-redesign/plan.md` | Implementation plan |
| `specs/001-knowops-site-redesign/research.md` | Technical decisions |
| `specs/001-knowops-site-redesign/data-model.md` | Content structure |
| `specs/001-knowops-site-redesign/contracts/` | Template specifications |

## Next Steps

After implementation:
1. Run `/speckit.tasks` to generate detailed task breakdown
2. Test all pages and redirects
3. Review SEO with Lighthouse
4. Deploy to GitHub Pages
