# Security Policy

## Supported Versions

This is a static website repository. Security updates are applied to:

| Component | Status |
| --- | --- |
| Hugo (latest) | ✅ Supported |
| Dependencies | ✅ Auto-updated via Dependabot |
| GitHub Actions | ✅ Monitored |

## Reporting a Vulnerability

We take security seriously. If you discover a security vulnerability in this repository, please report it responsibly:

### How to Report

**Preferred Method**: Use [GitHub's private security advisory feature](https://github.com/prefrontalsys/prefrontalsys.github.io/security/advisories/new)

**Alternative**: Email security reports to [Scot Campbell](https://github.com/mnemexai) via GitHub

### What to Include

- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if available)

### Response Timeline

- **Initial Response**: Within 48 hours
- **Status Update**: Within 7 days
- **Fix Timeline**: Varies by severity
  - Critical: 24-48 hours
  - High: 1 week
  - Medium: 2 weeks
  - Low: Best effort

## Security Measures

This repository implements:

- ✅ Secret scanning with push protection
- ✅ Dependabot security updates
- ✅ Signed commits required
- ✅ Branch protection on `main`
- ✅ Automated dependency updates
- ✅ GitHub Actions security monitoring

## Scope

This security policy covers:

- Hugo configuration and builds
- GitHub Actions workflows
- Dependencies and submodules
- Deployment pipeline

**Out of Scope**: Content (blog posts, articles) - these are not security-sensitive unless they contain leaked credentials.

## Attribution

We appreciate responsible disclosure and will credit researchers (with permission) in our security acknowledgments.

---

*Last updated: 2025-11-08*
