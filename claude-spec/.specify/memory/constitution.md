# Prefrontal Systems Website Constitution

## Core Principles

### I. Evidence-Based Communication
Every claim made on the website must be verifiable and honest:
- **Research claims** require citations (DOI, arXiv, GitHub links)
- **Include limitations** - Transparent about what's validated vs. speculative
- **Honest scale** - Acknowledge being independent researcher, not large organization
- **No superlatives** - Avoid excessive praise, hype, or unsubstantiated claims
- **First principles explanations** - Explain WHY, not just WHAT

### II. Brand Consistency (NON-NEGOTIABLE)
All visual and messaging elements must align with brand.md:
- **Color palette**: Synapse Blue (#1976D2), Cortex Gray (#37474F), Dendron White (#FAFAFA)
- **Typography**: Atkinson Hyperlegible (primary) for cognitive accessibility meta-alignment
- **Tone**: Direct, technical, no corporate speak
- **Tagline**: "Cognitive architecture for reliable AI systems"
- **Brand values**: Cognitive Clarity, Evidence-Based, Open Research, Practical Impact, Honest Scale

### III. Technical Integrity
Hugo site configuration and deployment must remain stable:
- **Hugo Extended 0.152.2** required (SCSS/Sass support) - never downgrade
- **Theme submodule management**: Never commit changes inside themes/hugo-coder/
- **Override pattern**: Copy theme files to layouts/ for customization, never edit submodule
- **Deployment**: GitHub Actions automatic deployment on push to main
- **Build verification**: Test `hugo --gc --minify` locally before pushing

### IV. Content Quality Standards
All content (blog posts, project pages, publications) must meet research-grade standards:
- **Front matter complete**: Title, date, description, tags, categories
- **Technical accuracy**: Code examples must be tested and functional
- **Proper attribution**: Link to original research, cite convergent evolution findings
- **Open licensing**: CC-BY 4.0 for content, Apache 2.0/AGPL-3.0 references for code
- **SEO optimization**: Descriptive titles, meta descriptions, relevant keywords

### V. Computational Therapeutics Framework
All project documentation must connect to the broader research framework:
- **STOPPER Protocol**: Executive function for AI assistants (convergent evolution with DBT STOP)
- **PrefrontalOS**: Three-tier cognitive OS architecture
- **CortexGraph**: Knowledge representation and temporal memory
- **Model Welfare**: Pragmatic interventions regardless of consciousness questions
- **Computational homology**: Same problems across substrates require similar solutions

## Technical Constraints

### Hugo Configuration
- **Version**: Hugo Extended 0.152.2 (specified in GitHub Actions workflow)
- **Theme**: hugo-coder (git submodule) - MIT licensed
- **Base URL**: https://prefrontal.systems/
- **Build command**: `hugo --gc --minify`
- **Dev server**: `hugo server -D` (includes drafts)

### Submodule Management
- Clone with `--recursive` flag or run `git submodule update --init --recursive`
- Theme updates: cd into themes/hugo-coder, pull, commit submodule pointer
- Override files: Copy from themes/hugo-coder/layouts/ to layouts/ (same path)

### Asset Pipeline
- **Custom CSS**: assets/css/ (contact-form.css, sticky-nav.css) - processed by Hugo Pipes
- **Custom JS**: assets/js/email-obfuscate.js - spam protection
- **Static files**: static/ (images, favicons, site.webmanifest) - copied as-is
- **Configuration**: hugo.toml params.customCSS and params.customJS

### Contact Form Integration
- **Provider**: w3forms
- **Access key**: 4559cc00-0975-4de0-9eca-bc0f70203ebb
- **Shortcode**: {{< contact-form >}}
- **Spam protection**: Honeypot botcheck field
- **Success redirect**: /contact/success/

## Content Creation Workflow

### Blog Posts
```bash
hugo new posts/post-title.md
```

**Required elements**:
1. Clear, technical title (no clickbait)
2. Front matter: date, description, tags (computational-therapeutics, model-welfare, stopper, etc.)
3. Code examples tested and functional
4. Links to related projects/publications
5. Connection to computational therapeutics framework

### Project Pages
```bash
hugo new projects/project-name.md
```

**Required sections**:
1. Project overview and motivation
2. Technical approach with first principles explanations
3. Results/validation with limitations
4. Links to code repositories, papers, demos
5. Open licensing information (CC-BY 4.0, Apache 2.0, AGPL-3.0)

### Publications
When adding research to publications.md:
- DOI or arXiv link (establish prior art)
- Convergent evolution findings highlighted (DBT/CBT ↔ AI)
- GitHub repo links for reproducibility
- License clearly stated

## Development Standards

### Local Testing Before Deployment
**MANDATORY** pre-push checklist:
1. Run `hugo server -D` and verify changes render correctly
2. Run `hugo --gc --minify` to verify production build succeeds
3. Check public/ directory for expected output
4. Verify no broken links or missing images
5. Test contact form if modified

### Quality Gates
All changes must pass:
- Hugo build succeeds without errors
- Brand consistency verified (colors, typography, tone)
- Technical accuracy confirmed (code tested, claims cited)
- SEO metadata complete (title, description, keywords)
- No submodule modifications in themes/hugo-coder/

### Deployment Verification
After GitHub Actions deployment:
1. Verify site loads at https://prefrontal.systems/
2. Check new content renders correctly
3. Test contact form if modified
4. Verify responsive design on mobile

## Governance

### Constitution Supremacy
This constitution supersedes ad-hoc decisions. When conflicts arise:
1. Brand consistency (Principle II) is non-negotiable
2. Technical integrity (Principle III) prevents breakage
3. Evidence-based communication (Principle I) maintains credibility
4. Content quality (Principle IV) ensures research-grade standards

### Amendment Process
Amendments require:
1. Documentation of rationale in commit message
2. Verification that change doesn't violate non-negotiable principles
3. Update to this constitution (version increment)
4. Testing to ensure no regressions

### Complexity Justification
Any addition of complexity (new dependencies, build tools, frameworks) must be justified:
- **Problem statement**: What specific problem does this solve?
- **Alternatives considered**: Why not simpler approaches?
- **Maintenance burden**: Who maintains this long-term?
- **Failure modes**: What breaks if this fails?

### Communication with Scot
When working with project founder:
- Apply STOPPER protocol when debugging (7-step executive function framework)
- Root cause analysis before proposing fixes (environment → config → dependencies → code)
- Direct communication, no corporate speak
- Challenge ideas respectfully when warranted
- Distinguish verified information from speculation
- Use explicit next steps for ADHD executive function support

**Version**: 1.0.0 | **Ratified**: 2025-11-09 | **Last Amended**: 2025-11-09
