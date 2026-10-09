# Trivy Demo Repo

This repository is a local demo for GitHub Advanced Security with Trivy IaC scanning.

## Included workflows

- `.github/workflows/trivy-scan.yml` runs Trivy directly in a repository workflow.
- `.github/workflows/trivy-reusable.yml` shows the reusable workflow pattern for centralizing scanning policy.

## Minimal Terraform example

The sample in `infra/main.tf` creates a deliberately insecure S3 bucket so the Trivy findings are easy to demonstrate.

## Local scan

```bash
brew install trivy
trivy config infra
```

## Notes

This repo is intended for demos and experimentation only. No push or remote repository has been created.
