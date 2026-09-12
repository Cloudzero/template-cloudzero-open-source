# CloudZero Open Source Template

This repository is a starting point for CloudZero (and other) open source
projects. It includes README, contributing, security, and GitHub templates plus
sample Python and JavaScript/TypeScript tooling so new repos describe the
project clearly, explain how to contribute, and ship CI, coverage, and quality
checks.

The layout is based largely on Auth0's
[open-source-template](https://github.com/auth0/open-source-template).
Thank you Auth0 — we :heart: you all, and not just because you have a zero in
your company name! :hugs:

## Table of Contents

- [What's included](#whats-included)
- [Getting Started](#getting-started)
- [Supported runtimes](#supported-runtimes)
- [Contribution](#contribution)
- [Thank You](#thank-you)
- [License](#license)

## What's included

| Area | Location | Notes |
| --- | --- | --- |
| Project README template | [`README-template.md`](README-template.md) | Copy over `README.md` in a new repo |
| Contributing | [`CONTRIBUTING.md`](CONTRIBUTING.md), [`GENERAL-CONTRIBUTING.md`](GENERAL-CONTRIBUTING.md) | Repo-specific and org-wide guidance |
| Code of Conduct | [`CODE-OF-CONDUCT.md`](CODE-OF-CONDUCT.md) | Contributor Covenant 2.1 |
| Security policy | [`SECURITY.md`](SECURITY.md) | Private reporting + email fallback |
| GitHub templates | [`.github/`](.github/) | Issues, PRs, Dependabot, CODEOWNERS, workflows |
| Python sample | [`python/`](python/) | uv, pytest, Ruff, Python 3.11–3.13 |
| JavaScript/TypeScript sample | [`javascript/`](javascript/) | Node.js 20+, ESLint, Prettier, Jest |
| Docs quality CI | [`.github/workflows/ci-docs.yml`](.github/workflows/ci-docs.yml) | markdownlint-cli2 + lychee |

## Getting Started

Clone this repository, then either reuse it as a whole or copy the pieces you
need into an existing repo.

### Copy README-template.md to README.md

The core of open source repo quality is the `README.md` file displayed on the
repo homepage on GitHub. [`README-template.md`](README-template.md) was created
by CloudZero engineering from high-quality README samples.

Most sections should stay, even if a section only links to a more specific page.
Customize these:

- Description (below the title)
- Badges
- Documentation
- Installation
- Getting Started
- Thank you
- License

Use these with only light edits:

- Table of Contents
- Contributing
- Support + Feedback
- Vulnerability Reporting
- What is CloudZero?

### Modify templates in `.github`

Issue and PR templates are starting points. Maintainers should keep *some*
template so reporters know what to include. YAML issue forms are the current
GitHub pattern; the older Markdown issue templates are kept as a fallback.

### Update LICENSE and NOTICE

See [`README-template.md`](README-template.md) for license guidance. Set the
copyright year in `NOTICE` when you create a new project.

### Modify .gitignore

Exclude files that do not belong in git for your stack. The root
[`.gitignore`](.gitignore) already covers Python, Node.js, coverage, and IDEs.

### Modify or remove platform-specific files

The `python/` and `javascript/` trees are examples, not a requirement. Keep the
stack you use and delete the rest.

## Supported runtimes

These are the versions this template's CI and `engines` / `requires-python`
fields assume. Downstream projects should tighten or expand them as needed.

- **Python:** 3.11, 3.12, and 3.13 (`requires-python = ">=3.11"`)
- **Node.js:** `engines.node` is `>=20.0.0`. CI tests Current and LTS lines
  **22 / 24 / 26** (Node 20 reached end-of-life on 2026-04-30)

## Contribution

We appreciate feedback and contributions to this template. Before you start,
please read:

- [CloudZero's general contribution guidelines](GENERAL-CONTRIBUTING.md)
- [CloudZero's code of conduct](CODE-OF-CONDUCT.md)
- [This repo's contribution guide](CONTRIBUTING.md)

## Thank You

Thank you to the people and projects that shaped this template:

- [First Contributions by @Roshanjossey](https://github.com/Roshanjossey/first-contributions)
- [First Timers Only](https://www.firsttimersonly.com/)
- [GitHub issue labels](https://docs.github.com/en/issues/using-labels-and-milestones-to-track-work/managing-labels)
- [Awesome README by @matiassingers](https://github.com/matiassingers/awesome-readme)
- [Auth0](https://github.com/auth0/open-source-template) for assembling much of
  this pattern

…and many more.

## License

This repository is licensed under the [Apache License 2.0](LICENSE).
