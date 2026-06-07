# OpenCTI Kubernetes Migration Notes

This folder is a Kubernetes security prototype and migration path for the Docker Compose MVP.

The original capstone deployment was validated with Docker Compose on a single DigitalOcean droplet. A future Kubernetes deployment could use either:

- k3s on a single VM for lightweight self-managed Kubernetes
- DigitalOcean Kubernetes (DOKS) for managed Kubernetes

## Migration Considerations

OpenCTI depends on several stateful services:

- Elasticsearch
- Redis
- RabbitMQ
- MinIO
- OpenCTI workers
- OpenCTI platform
- Connectors

A production-grade Kubernetes deployment should avoid treating these services as simple stateless pods. Elasticsearch, RabbitMQ, Redis, and MinIO require careful storage, backups, resource limits, and upgrade planning.

## Security Concepts Included

This prototype includes:

- Dedicated namespace
- Dedicated ServiceAccount
- Namespace-scoped RBAC
- Example NetworkPolicies
- Example SecurityContext
- Secrets template
- Resource request and limit examples

## Recommended Future Direction

For a realistic production migration, use Helm charts or operator-backed deployments for stateful dependencies where available. Start with a non-production k3s lab, validate service dependencies, then consider DOKS only after storage, ingress, backups, and monitoring are planned.
