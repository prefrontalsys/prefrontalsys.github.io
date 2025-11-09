# Gemini Project Context: Prefrontal Systems Website

This document provides context for the AI assistant to understand and effectively work on this project.

## Project Overview

This project is the source code for the Prefrontal Systems website, a static website built with the [Hugo](https://gohugo.io/) static site generator. The site is hosted on GitHub Pages.

The purpose of the website is to serve as a portfolio and publication hub for Prefrontal Systems, an AI research and consulting practice focused on **computational therapeutics**.

### Key Technologies

*   **Static Site Generator:** Hugo (v0.152.2)
*   **Theme:** [hugo-coder](https://github.com/luizdepra/hugo-coder) (used as a git submodule in the `themes/` directory)
*   **Content:** Markdown files located in the `content/` directory.
*   **Styling:** SCSS, with custom styles in `assets/scss/_custom.scss`. The build process uses Dart Sass.
*   **Deployment:** Automated via a GitHub Actions workflow (`.github/workflows/hugo.yml`) which deploys the site to GitHub Pages on pushes to the `main` branch.

## Building and Running

### Local Development

To run the website locally for development, follow these steps:

1.  **Clone the repository with submodules:**
    ```bash
    git clone --recursive https://github.com/prefrontalsys/prefrontalsys.github.io.git
    cd prefrontalsys.github.io
    ```
    If the repository is already cloned, ensure the submodules are updated:
    ```bash
    git submodule update --init --recursive
    ```

2.  **Run the local development server:**
    The `README.md` and standard Hugo practice suggest using the following command. This will start a local server, typically at `http://localhost:1313/`, and automatically rebuild the site when changes are made. The `-D` flag builds draft content.
    ```bash
    hugo server -D
    ```

### Production Build

To build the static site for production (which generates the `public/` directory), use the following command:

```bash
hugo
```

The GitHub Actions workflow uses a more specific command to build for production, which includes minification and garbage collection:
```bash
hugo --gc --minify --baseURL "https://prefrontal.systems/"
```

## Development Conventions

*   **Content Creation:** All website content is stored as Markdown files in the `content/` directory. This includes blog posts, project pages, and other static pages.
*   **New Content:** New posts or pages can be scaffolded using the `hugo new` command. For example: `hugo new posts/my-new-post.md`.
*   **Front Matter:** Each Markdown file contains TOML front matter for metadata such as `title`, `date`, `tags`, and `categories`. The default front matter is defined in `archetypes/default.md`.
*   **Static Assets:** Images, logos, and other static files are stored in the `static/` directory.
*   **Custom Styles:** Custom SCSS is located in `assets/scss/_custom.scss`. Custom CSS and JS are specified in the `hugo.toml` file.
*   **Layouts:** The site uses a combination of the theme's layouts and custom layouts found in the `layouts/` directory. These override the theme's defaults.
*   **Dependencies:** The project uses a Git submodule for the theme. There are no other major package dependencies like `package.json` in the root.
