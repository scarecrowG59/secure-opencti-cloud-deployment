# Security Hardening

This project applies a practical cloud security baseline for a student-scale OpenCTI deployment.

## SSH Hardening

Controls:

- Password authentication disabled
- Public key authentication enabled
- Root login restricted
- Non-root admin user used for operations

Validation:

    sudo sshd -T | egrep 'passwordauthentication|pubkeyauthentication|permitrootlogin'

## Firewall Controls

DigitalOcean Cloud Firewall rules:

- TCP/22 restricted to administrator public IP
- TCP/80 open for HTTP validation and redirect
- TCP/443 open for HTTPS access
- Backend application ports not exposed directly

## Service Exposure

OpenCTI is bound to localhost on the host:

    127.0.0.1:8080

Caddy handles public HTTPS access and forwards traffic internally.

## Secrets Hygiene

Real secrets are excluded from GitHub.

Public examples:

- `.env.example`
- `terraform.tfvars.example`
- `kubernetes/secrets.example.yaml`

Private files must not be committed.

## Resource Stability

A 2 GB swap file was added to improve stability on an 8 GB RAM droplet. Elasticsearch memory was reduced to better fit the host.
