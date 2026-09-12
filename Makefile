# Copyright CloudZero, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

PYTHON_DIR := python
JS_DIR := javascript

.PHONY: help install install-dev test lint lint-md lint-links format check clean build \
	docker-build docker-up docker-down docker-logs npm-install npm-test npm-lint npm-format

# Default target
help:
	@echo "Available targets:"
	@echo "  install        - Install Python production dependencies (in $(PYTHON_DIR)/)"
	@echo "  install-dev    - Install Python development dependencies"
	@echo "  test           - Run Python tests with coverage"
	@echo "  lint           - Run Python format check + Ruff lint"
	@echo "  lint-md        - Lint Markdown with markdownlint-cli2"
	@echo "  lint-links     - Check Markdown links with lychee"
	@echo "  format         - Format Python with Ruff"
	@echo "  check          - Format, lint, and test Python"
	@echo "  clean          - Remove build artifacts and caches"
	@echo "  build          - Build Python distribution packages"
	@echo "  docker-build   - Build Docker image"
	@echo "  docker-up      - Start Docker Compose services"
	@echo "  docker-down    - Stop Docker Compose services"
	@echo "  npm-install    - Install JavaScript dependencies"
	@echo "  npm-test       - Run JavaScript tests"
	@echo "  npm-lint       - Run ESLint, Prettier check, and tsc --noEmit"
	@echo "  npm-format     - Format JavaScript with Prettier"

# Python: Install production dependencies
install:
	cd $(PYTHON_DIR) && uv sync

# Python: Install development dependencies
install-dev:
	cd $(PYTHON_DIR) && uv sync --extra dev --group dev

# Python: Run tests with coverage
test:
	cd $(PYTHON_DIR) && uv run pytest --cov --cov-report=term-missing --cov-report=html

# Python: Run linting checks
lint:
	cd $(PYTHON_DIR) && uv run ruff format --check . && uv run ruff check .

# Python: Format code
format:
	cd $(PYTHON_DIR) && uv run ruff format .

# Docs: Markdown lint (requires npx / markdownlint-cli2)
lint-md:
	npx --yes markdownlint-cli2

# Docs: Link check (requires lychee)
lint-links:
	lychee --config lychee.toml './**/*.md'

# Python: Run all checks (format, lint, test)
check: format lint test

# Clean build artifacts and caches
clean:
	rm -rf $(PYTHON_DIR)/build/ $(PYTHON_DIR)/dist/ $(PYTHON_DIR)/*.egg-info/
	rm -rf $(PYTHON_DIR)/.pytest_cache/ $(PYTHON_DIR)/.ruff_cache/ $(PYTHON_DIR)/.mypy_cache/
	rm -rf $(PYTHON_DIR)/htmlcov/ $(PYTHON_DIR)/.coverage $(PYTHON_DIR)/coverage.xml
	rm -rf $(JS_DIR)/coverage/ $(JS_DIR)/dist/
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	find . -type f -name "*.py,cover" -delete

# Build Python distribution packages
build:
	cd $(PYTHON_DIR) && uv build

# Docker: Build image
docker-build:
	docker build -t template-cloudzero-open-source:latest .

# Docker: Start containers
docker-up:
	docker compose up -d

# Docker: Stop containers
docker-down:
	docker compose down

# Docker: View logs
docker-logs:
	docker compose logs -f

npm-install:
	cd $(JS_DIR) && npm ci

npm-test:
	cd $(JS_DIR) && npm test

npm-lint:
	cd $(JS_DIR) && npm run format:check && npm run lint && npm run type-check

npm-format:
	cd $(JS_DIR) && npm run format
