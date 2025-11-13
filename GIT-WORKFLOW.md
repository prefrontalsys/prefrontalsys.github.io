# Git Workflow Quick Reference

This document provides a streamlined git workflow for working with feature branches.

## Three-Command Workflow

### Starting Work on a Feature

```bash
git checkout -b feature/my-feature-name main
```

Creates and switches to a new feature branch based on `main`.

### Finishing a Feature (Ready to Merge)

```bash
git add .
git commit -m "Brief description of changes"
git push -u origin feature/my-feature-name
```

Then create a pull request on GitHub to merge into `main`.

### Abandoning Work (Discard Changes)

```bash
git checkout main
git branch -D feature/my-feature-name
```

Switches back to `main` and deletes the feature branch (use `-D` to force delete even with uncommitted changes).

## Branch Naming Conventions

Use descriptive, lowercase branch names with hyphens:

- `feature/add-blog-post` - New features or content
- `fix/broken-navigation` - Bug fixes
- `docs/update-readme` - Documentation updates
- `refactor/reorganize-content` - Code/content reorganization
- `chore/update-dependencies` - Maintenance tasks

## Quick Examples

### Adding a New Blog Post

```bash
# Start
git checkout -b feature/add-stopper-blog-post main

# Make changes
hugo new posts/stopper-protocol-intro.md
# Edit the file...

# Finish
git add content/posts/stopper-protocol-intro.md
git commit -m "Add STOPPER Protocol introduction blog post"
git push -u origin feature/add-stopper-blog-post
```

### Fixing a Typo

```bash
# Start
git checkout -b fix/typo-about-page main

# Make changes
# Edit content/about.md...

# Finish
git add content/about.md
git commit -m "Fix typo in about page"
git push -u origin fix/typo-about-page
```

### Updating Site Configuration

```bash
# Start
git checkout -b chore/update-hugo-config main

# Make changes
# Edit hugo.toml...

# Finish
git add hugo.toml
git commit -m "Update Hugo configuration for new menu items"
git push -u origin chore/update-hugo-config
```

## Additional Commands

### Check Current Status

```bash
git status              # See current branch and changes
git branch              # List all local branches
git log --oneline -10   # See recent commits
```

### Update Your Branch with Latest Main

```bash
git checkout main
git pull
git checkout feature/my-feature-name
git rebase main
```

### Undo Last Commit (Keep Changes)

```bash
git reset --soft HEAD~1
```

### Discard Uncommitted Changes

```bash
git checkout -- .       # Discard all changes
git checkout -- file.md # Discard changes to specific file
```

## GitHub Pages Deployment

This site automatically deploys to GitHub Pages when changes are merged to `main` via GitHub Actions (`.github/workflows/hugo.yml`).

**Deployment Process**:
1. Push to `main` (or merge PR)
2. GitHub Actions builds the site with Hugo
3. Deploys to `https://prefrontal.systems/`

**Note**: Feature branches do NOT trigger deployment - only `main` branch changes.

## Working with Theme Submodules

This site uses `hugo-coder` theme as a git submodule.

```bash
# First-time clone with submodules
git clone --recursive https://github.com/prefrontal-systems/prefrontalsys.github.io.git

# Update submodules after clone
git submodule update --init --recursive

# Update theme to latest version
cd themes/hugo-coder
git pull origin main
cd ../..
git add themes/hugo-coder
git commit -m "Update hugo-coder theme"
```

## Tips

- **Commit often**: Small, focused commits are easier to review and revert if needed
- **Write clear commit messages**: Describe WHAT changed and WHY
- **Test locally before pushing**: Run `hugo server -D` to preview changes
- **Keep branches short-lived**: Merge or abandon feature branches within a few days
- **Pull before you push**: Always `git pull` on `main` before creating new branches

---

*For more detailed git documentation, see [Git Documentation](https://git-scm.com/doc).*
