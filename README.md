# Prefrontal Systems℠ Website

[![Hugo](https://img.shields.io/badge/Hugo-0.152.2-blue.svg)](https://gohugo.io)
[![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0)

Source code for the Prefrontal Systems website, hosted at [prefrontalsys.github.io](https://prefrontalsys.github.io).

## About

Prefrontal Systems is a specialized AI research and consulting practice focused on **computational therapeutics**—applying clinically-validated psychological interventions to improve AI system reliability and performance.

Our work bridges neuroscience, clinical psychology, and AI engineering through research-driven, evidence-based frameworks. We demonstrate convergent evolution between therapeutic techniques developed for humans (DBT, CBT) and executive function frameworks that prevent AI system failures.

## Featured Projects

- **[STOPPER Protocol](content/projects/stopper.md)** - Executive function framework for AI assistants
- **[PrefrontalOS](content/projects/prefrontalos.md)** - Three-tier cognitive operating system architecture
- **[CortexGraph](content/projects/cortexgraph.md)** - Temporal memory system with human-like forgetting curves

## Technical Details

This site is built with:

- **[Hugo](https://gohugo.io)** - Static site generator
- **[Coder Theme](https://github.com/luizdepra/hugo-coder)** - Clean, minimal Hugo theme
- **GitHub Pages** - Hosting and deployment via GitHub Actions

### Local Development

```bash
# Clone the repository with submodules
git clone --recursive https://github.com/prefrontalsys/prefrontalsys.github.io.git
cd prefrontalsys.github.io

# If already cloned, initialize submodules
git submodule update --init --recursive

# Run local development server
hugo server -D

# Build for production
hugo
```

The site will be available at `http://localhost:1313/`

### Project Structure

```
.
├── content/           # Markdown content
│   ├── posts/        # Blog posts
│   ├── projects/     # Project descriptions
│   ├── about.md      # About page
│   └── publications.md
├── layouts/          # Custom Hugo layouts
├── static/           # Static assets (images, logos)
├── themes/           # Hugo themes (as submodules)
└── hugo.toml         # Hugo configuration
```

### Deployment

The site automatically deploys to GitHub Pages when changes are pushed to the `main` branch via GitHub Actions workflow (`.github/workflows/hugo.yml`).

## Content License

Content in the `content/` directory is licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).

## Code License

Source code and configuration files are licensed under the [GNU Affero General Public License v3.0](LICENSE).

## Contact

- **Website**: [prefrontalsys.github.io](https://prefrontalsys.github.io)
- **Blog**: [simpleminded.bot](https://simpleminded.bot)
- **GitHub**: [@mnemexai](https://github.com/mnemexai)
- **ORCID**: [0009-0000-6579-2895](https://orcid.org/0009-0000-6579-2895)

---

*"Intelligence requires executive function, regardless of substrate."*
