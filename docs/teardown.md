# Teardown Guide

Use this guide before deleting cloud resources.

## 1. Export Evidence

Save:

- Screenshots
- Docker Compose configuration
- Sanitized `.env.example`
- Caddyfile
- Final report
- Validation command outputs

## 2. Remove Secrets

Confirm no private secrets are in the repository:

    grep -RniE "token|password|secret|key" . \
      --exclude=".gitignore" \
      --exclude=".env.example"

Review results manually.

## 3. Optional Snapshot

If long-term recovery is needed, create a DigitalOcean snapshot before deletion.

## 4. Destroy Infrastructure

If using Terraform:

    terraform destroy

If manually deleting:

- Delete Droplet
- Delete unused volumes
- Delete snapshots if not needed
- Delete unused floating IPs
- Delete unused firewalls
- Confirm billing resources are gone

## 5. Revoke API Tokens

Revoke or rotate:

- DigitalOcean API tokens
- VirusTotal API tokens
- Any leaked or temporary keys
