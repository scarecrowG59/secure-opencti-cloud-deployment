# DevSecOps Layer

This project includes a lightweight DevSecOps layer to demonstrate secure engineering practices beyond the original Docker Compose deployment.

## GitHub Actions

The repository includes CI workflows for:

- Terraform formatting and validation
- YAML linting
- Trivy filesystem scanning

## Terraform Validation

The Terraform workflow validates infrastructure-as-code quality without requiring live DigitalOcean credentials.

## Trivy Scanning

The Trivy workflow performs a repository filesystem scan to identify high and critical vulnerabilities in included artifacts.

The scan currently runs in reporting mode and does not fail the pipeline. This is intentional for a portfolio repository because the project includes deployment templates and examples. In a production repository, the scan could be changed to fail on critical findings.

## Secrets Hygiene

Real secrets are excluded from the repository. The project uses:

- `.env.example`
- `terraform.tfvars.example`
- `kubernetes/secrets.example.yaml`
- `.gitignore` rules for private values

Secrets should be supplied through local files, cloud secret managers, or GitHub Secrets depending on the deployment model.

## Supply Chain Notes

Container image versions should be pinned for reproducibility. The project pins the VirusTotal connector to a platform-compatible version and documents future work for broader image version pinning across all services.
