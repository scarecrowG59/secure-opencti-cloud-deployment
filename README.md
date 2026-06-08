# Secure OpenCTI Cloud Deployment

[![Terraform Validate](https://github.com/scarecrowG59/secure-opencti-cloud-deployment/actions/workflows/terraform-validate.yaml/badge.svg)](https://github.com/scarecrowG59/secure-opencti-cloud-deployment/actions/workflows/terraform-validate.yaml)
[![YAML Lint](https://github.com/scarecrowG59/secure-opencti-cloud-deployment/actions/workflows/yaml-lint.yml/badge.svg)](https://github.com/scarecrowG59/secure-opencti-cloud-deployment/actions/workflows/yaml-lint.yml)
[![Trivy Security Scan](https://github.com/scarecrowG59/secure-opencti-cloud-deployment/actions/workflows/trivy-scan.yml/badge.svg)](https://github.com/scarecrowG59/secure-opencti-cloud-deployment/actions/workflows/trivy-scan.yml)

A portfolio-grade cloud security and cyber threat intelligence project demonstrating secure OpenCTI deployment, CTI enrichment workflows, Terraform infrastructure-as-code, Kubernetes security prototypes, and DevSecOps validation.

Originally developed as a cybersecurity capstone project, then extended with infrastructure automation, Kubernetes security patterns, and CI-based validation.

---

## Project Overview

This project deploys OpenCTI as a secure cloud-hosted cyber threat intelligence platform on DigitalOcean.

The deployment demonstrates:

- OpenCTI running in the cloud with Docker Compose
- HTTPS access through Caddy reverse proxy
- SSH and firewall hardening
- MITRE ATT&CK integration
- VirusTotal observable enrichment
- Terraform infrastructure provisioning
- Kubernetes security prototype with RBAC and NetworkPolicies
- GitHub Actions workflows for Terraform validation, YAML linting, and Trivy scanning

---

## Architecture

The validated MVP runs on a DigitalOcean Droplet using Docker Compose.

Core components:

- OpenCTI platform
- OpenCTI workers
- Elasticsearch
- Redis
- RabbitMQ
- MinIO
- MITRE ATT&CK connector
- VirusTotal connector
- Caddy reverse proxy

Access model:

    User Browser
        |
     HTTPS :443
        |
     Caddy Reverse Proxy
        |
     127.0.0.1:8080
        |
     OpenCTI Docker Compose Stack

Backend services are not directly exposed to the public internet.

---

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

---

## CTI Workflows Demonstrated

### 1. Automated VirusTotal Enrichment

An IPv4 observable was created in OpenCTI and enriched using the VirusTotal connector. The enrichment results were imported back into OpenCTI as linked analysis notes.

This demonstrates automated observable enrichment inside a centralized CTI platform.

### 2. Contextual MITRE ATT&CK Mapping

A second observable was investigated using external reporting and mapped to ATT&CK techniques such as:

- T1071.001 - Web Protocols
- T1571 - Non-Standard Port

This demonstrates analyst-driven contextual interpretation beyond raw enrichment results.

Key CTI lesson:

> Enrichment provides data, but meaningful threat intelligence requires context.

---

## Terraform Infrastructure as Code

The `terraform/` folder provisions DigitalOcean infrastructure:

- Droplet
- SSH key lookup
- Cloud firewall
- SSH restricted to administrator IP
- HTTP/HTTPS access for reverse proxy
- Outputs for public IP and SSH command

Terraform validation is automated through GitHub Actions.

---

## Kubernetes Security Prototype

The `kubernetes/` folder documents a future Kubernetes migration path.

Included security concepts:

- Dedicated namespace
- Dedicated ServiceAccount
- Namespace-scoped RBAC
- Role and RoleBinding
- NetworkPolicy examples
- SecurityContext example
- Secrets template
- k3s/DOKS migration notes

This does not claim to be a full production Kubernetes deployment. It demonstrates how the Docker Compose MVP could evolve into a Kubernetes-based architecture using least-privilege and network segmentation concepts.

---

## DevSecOps Layer

The repository includes GitHub Actions workflows for:

- Terraform format and validation
- YAML linting
- Trivy filesystem security scan

These workflows provide lightweight CI/security validation for the repository.

---

## Repository Structure

    .
    ├── docker-compose/        # Docker Compose deployment files
    ├── terraform/             # DigitalOcean infrastructure as code
    ├── kubernetes/            # Kubernetes security prototype
    ├── docs/                  # Architecture, deployment, security, validation, teardown docs
    ├── screenshots/           # Evidence screenshots
    └── .github/workflows/     # CI/security automation

---

## Documentation

Detailed documentation is available in the `docs/` folder:

- `architecture.md`
- `deployment-runbook.md`
- `security-hardening.md`
- `validation.md`
- `troubleshooting.md`
- `devsecops.md`
- `report-template.md`
- `teardown.md`

---

## Security Notes

No real secrets are committed to this repository.

The project uses templates instead:

- `docker-compose/.env.example`
- `terraform/terraform.tfvars.example`
- `kubernetes/secrets.example.yaml`

Private files such as `.env`, `terraform.tfvars`, Terraform state, private keys, and real Kubernetes secrets are excluded through `.gitignore`.

---

## Evidence

Screenshots can be added under `screenshots/`, including:

- OpenCTI dashboard over HTTPS
- VirusTotal enrichment results
- MITRE ATT&CK technique search
- OpenCTI reports page
- GitHub Actions successful checks

---

## Teardown

The project includes a teardown guide under:

    docs/teardown.md

Before deleting cloud infrastructure, export evidence, verify repository contents, revoke temporary API tokens, and confirm no billable cloud resources remain.
