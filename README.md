# Secure OpenCTI Cloud Deployment

Portfolio-grade cloud security and cyber threat intelligence project.

This project demonstrates a secure cloud deployment of OpenCTI with Docker Compose, HTTPS access, MITRE ATT&CK integration, VirusTotal enrichment, Terraform-based infrastructure provisioning, and a Kubernetes security prototype.

## Project Layers

| Layer | Status |
|---|---|
| Cloud deployment on DigitalOcean | Completed |
| Docker Compose OpenCTI stack | Completed |
| SSH and firewall hardening | Completed |
| HTTPS via Caddy reverse proxy | Completed |
| MITRE ATT&CK integration | Completed |
| VirusTotal enrichment | Completed |
| Terraform IaC | Added post-capstone |
| GitHub Actions / Trivy | Added post-capstone |
| Kubernetes security prototype | Added post-capstone |

## Repository Structure

- `docker-compose/` - Docker Compose deployment files and sanitized environment example
- `terraform/` - DigitalOcean infrastructure as code
- `kubernetes/` - Kubernetes migration/security prototype
- `docs/` - deployment, security, validation, troubleshooting, and teardown documentation
- `screenshots/` - evidence screenshots from the working deployment
- `.github/workflows/` - CI/security automation
