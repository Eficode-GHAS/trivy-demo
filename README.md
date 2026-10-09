# Trivy Demo Repo

This repository is a local demo for GitHub Advanced Security with Trivy IaC scanning.

## Included workflows

- `.github/workflows/trivy-scan.yml` runs Trivy directly in a repository workflow (SARIF category `trivy-demo`).
- `.github/workflows/trivy-reusable.yml` is the reusable workflow that centralizes the scanning policy.
- `.github/workflows/trivy-reusable-caller.yml` calls the reusable workflow (SARIF category `trivy-reusable-demo`).
- `.github/workflows/codeql.yml` runs CodeQL on the GitHub Actions workflow files.

All scans run on pull requests to `main` and can be started manually from the Actions tab.

## Minimal Terraform example

The sample in `infra/main.tf` creates a deliberately insecure S3 bucket so the Trivy findings are easy to demonstrate.

## Local scan

```bash
brew install trivy
trivy config infra
```

## Notes

This repo is intended for demos and experimentation only. No push or remote repository has been created.
