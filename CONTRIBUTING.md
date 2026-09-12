# Contribution

Thank you for your interest in contributing. Please read
[CloudZero's general contribution guidelines](GENERAL-CONTRIBUTING.md) before
getting started.

## Documentation

All code changes should include appropriate documentation:

- **Code-level documentation**: Add docstrings for all public functions,
  classes, and modules
- **README updates**: Update `README.md` if your changes affect installation,
  usage, or features
- **Docs site**: If this project has external documentation, include a link to
  the corresponding docs PR
- **CloudZero integration**: Link to relevant
  [CloudZero documentation](https://docs.cloudzero.com/) where it helps

Documentation standards:

- Aim for 100% documentation coverage for new public APIs
- Use clear, concise language
- Include code examples where helpful
- Document parameters, return values, and exceptions

## Environment Setup

### Prerequisites

Before contributing, ensure you have:

- Python 3.11 or higher (for Python projects)
- [uv](https://docs.astral.sh/uv/) (for Python projects)
- Node.js 20 or higher and npm 9 or higher (for JavaScript projects)
- Git configured with your GitHub account

This template's CI currently tests Python 3.11–3.13 and Node.js 22, 24, and 26.

### Initial Setup

1. Fork the repository on GitHub
2. Clone your fork locally:

   ```bash
   git clone https://github.com/YOUR_USERNAME/REPO_NAME.git
   cd REPO_NAME
   ```

3. Add the upstream repository:

   ```bash
   git remote add upstream https://github.com/cloudzero/REPO_NAME.git
   ```

4. Install dependencies.

   For Python projects:

   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   cd python
   uv sync --extra dev --group dev
   ```

   For JavaScript projects:

   ```bash
   cd javascript
   npm ci
   ```

5. Create a branch for your changes:

   ```bash
   git checkout -b feature/your-feature-name
   ```

For how to adopt this template in a new repo, see
[Getting Started](README.md#getting-started).

## Testing

We keep high test coverage to protect quality and catch regressions.

### Test Structure

- Place tests in the `tests/` directory
- Name test files `test_*.py` (Python) or `*.test.ts` / `*.test.js`
  (JavaScript)
- Group related tests in classes or `describe` blocks
- Use names that explain what is being tested

### Writing Tests

Python:

- Use `pytest` for all tests
- Follow Arrange-Act-Assert
- Use fixtures for shared setup
- Mock external dependencies

JavaScript:

- Use Jest (or the project's test runner)
- Write unit tests for individual functions
- Write integration tests for component interactions
- Keep tests isolated

### Running Tests

Python (from `python/`):

```bash
uv run pytest
uv run pytest --cov
uv run pytest tests/test_module.py
uv run pytest tests/test_module.py::test_function_name
```

JavaScript:

```bash
npm test
npm test -- --watch
npm test -- --coverage
```

### Test Coverage Requirements

- New code should have at least 80% test coverage
- Critical paths should have 100% coverage
- PRs that lower overall coverage may be rejected unless justified

## Code Quality Tools

### Python

From `python/`:

```bash
uv run ruff format .
uv run ruff check .
uv run ruff check --fix .
uv run ruff format . && uv run ruff check . && uv run pytest
```

### JavaScript

```bash
npm run format
npm run format:check
npm run lint
npm run lint:fix
npm run type-check
```

### Documentation

From the repository root (requires
[markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2) and
[lychee](https://github.com/lycheeverse/lychee)):

```bash
npx markdownlint-cli2
lychee --config lychee.toml './**/*.md'
```

CI runs the same Markdown lint and link checks on every pull request.

### Pre-commit hooks

This template does not ship a `.pre-commit-config.yaml`. If you add one,
install [pre-commit](https://pre-commit.com/) with pipx or uv and run
`pre-commit install`.

## Code Style Guidelines

### Python Style

- Follow [PEP 8](https://pep8.org/)
- Use type hints on function signatures
- Maximum line length: 100 characters
- Use meaningful names
- Write docstrings for public APIs (Google or NumPy style)
- Let the Ruff formatter handle layout

Preferred libraries in new CloudZero Python projects:

- **Data**: `polars` (prefer over `pandas`)
- **HTTP**: `httpx` (prefer over `requests`)
- **Validation**: `pydantic` v2
- **AWS Lambda**: `aws-lambda-powertools`

### JavaScript Style

- Use ES2015+ (and TypeScript where the project already does)
- Prefer `const` over `let`; do not use `var`
- Use meaningful names
- Add JSDoc for non-obvious functions
- Follow the project's ESLint config

### Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```text
type(scope): subject

body (optional)

footer (optional)
```

Types:

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Formatting only
- `refactor`: Code refactoring
- `test`: Test changes
- `chore`: Build or tooling changes

Examples:

```text
feat(api): add support for new endpoint

fix(auth): resolve token expiration issue

docs(readme): update installation instructions
```

## Assets Compilation

### Python

```bash
cd python
uv build
```

From the repository root:

```bash
docker build -t project-name .
```

### JavaScript

```bash
npm run build
npm run build:watch
```

## CI/CD Information

Pull requests must pass CI before merge.

### GitHub Actions Checks

1. **JavaScript CI**: Prettier, ESLint, TypeScript `--noEmit`, and Jest with
   coverage on Node.js 22, 24, and 26
2. **Python CI**: Ruff format + lint, pytest with coverage on Python 3.11–3.13
3. **Docs CI**: markdownlint-cli2 on all `*.md` files and lychee link checks
4. **CodeQL**: Security scanning when that workflow is enabled on the repo

### Passing CI Checks

1. Run the same checks locally before you push
2. Fix lint and format errors
3. Ensure tests pass and coverage holds
4. Fix broken documentation links
5. Resolve actionable dependency vulnerabilities

If CI fails, read the GitHub Actions log, fix the issue locally, and push.
CI re-runs on the new commit.

## Pull Request Guidelines

### Before Submitting

- [ ] Code follows the project's style guidelines
- [ ] All tests pass locally
- [ ] New tests cover new behavior
- [ ] Documentation is updated when needed
- [ ] Commit messages follow Conventional Commits
- [ ] Branch is up to date with `main`

### PR Description

Include:

- **Summary**: What does this PR change?
- **Motivation**: Why is the change needed?
- **Testing**: How did you test it?
- **Screenshots**: For user-visible UI changes
- **Breaking changes**: Call these out explicitly
- **Related issues**: Link related GitHub issues

### Review Process

- PRs need at least one maintainer approval
- Address reviewer feedback
- Keep PRs focused and reasonably sized
- Respond to comments
- A maintainer merges after approval

Repos that use [CODEOWNERS](.github/CODEOWNERS) also require a review from
the listed owners (this template uses
`@cloudzero/open-source-maintainers`). Replace that team when you create a
new project.

## Getting Help

- Check existing
  [GitHub Issues](https://github.com/cloudzero/template-cloudzero-open-source/issues)
- Review the [README](README.md)
- Ask questions on the PR
- Email [support@cloudzero.com](mailto:support@cloudzero.com)

## Additional Resources

- [CloudZero General Contributing Guidelines](GENERAL-CONTRIBUTING.md)
- [Code of Conduct](CODE-OF-CONDUCT.md)
- [Security Policy](SECURITY.md)
- [CloudZero Documentation](https://docs.cloudzero.com/)

Thank you for contributing.
