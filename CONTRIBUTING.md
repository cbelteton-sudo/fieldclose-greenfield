# Contributing to FieldClose-Greenfield

## Multi-Agent Development Rules

1.  **Contracts Freeze**: API and Data Contracts must be defined in `/spec` before implementation code is written.
2.  **Merge Train**: Changes flow in order: DevOps -> Backend -> Frontend -> QA.
3.  **Small PRs**: Pull Requests should trigger only one or two contexts (e.g., specific folder paths).

## Development Workflow

1.  Create a feature branch from based on `main`.
2.  Implement changes.
3.  Ensure CI passes (lint, typecheck, test).
4.  Open a PR targeting `main`.
5.  Request review from CODEOWNERS.

## Commit Messages

Use conventional commits:

- `feat(...)`: New features
- `fix(...)`: Bug fixes
- `chore(...)`: Maintenance
- `docs(...)`: Documentation
