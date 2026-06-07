# Architecture

This project uses a staged architecture model.

## MVP Runtime Architecture

The validated capstone deployment runs on a single DigitalOcean Droplet using Docker Compose.

Core services:

- OpenCTI platform
- OpenCTI workers
- Elasticsearch
- Redis
- RabbitMQ
- MinIO
- MITRE ATT&CK connector
- VirusTotal connector
- Caddy reverse proxy

## Access Model

Caddy listens on public HTTP/HTTPS ports and terminates TLS. The OpenCTI backend is bound to localhost and is not exposed directly to the public internet.

Traffic flow:

1. User accesses the public HTTPS hostname.
2. Caddy receives the request on port 443.
3. Caddy forwards traffic to OpenCTI on `127.0.0.1:8080`.
4. OpenCTI communicates with internal dependencies over the Docker network.

## Security Design

The design reduces public exposure by limiting direct access to backend services. SSH is restricted by firewall rules, and administrative work is performed through a non-root user.

## Future Architecture Path

The repository also includes:

- Terraform for infrastructure provisioning
- Kubernetes security prototype for future migration
- GitHub Actions for validation and scanning
