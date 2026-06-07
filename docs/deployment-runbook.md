# Deployment Runbook

This runbook summarizes the Docker Compose deployment workflow used for the OpenCTI cloud deployment.

## 1. Provision Infrastructure

Create a DigitalOcean Droplet running Ubuntu 22.04 LTS.

Recommended minimum size:

- 4 vCPU
- 8 GB RAM
- 100+ GB SSD

## 2. Prepare Server

Update packages:

    sudo apt update
    sudo apt upgrade -y

Create a non-root admin user and configure SSH key-based access.

## 3. Install Docker

Install Docker Engine and Docker Compose plugin using the official Docker repository.

Verify:

    docker version
    docker compose version

## 4. Configure OpenCTI

Create deployment directory:

    sudo mkdir -p /opt/opencti

Copy Docker Compose files and create a `.env` file based on `.env.example`.

Required values include:

- OpenCTI admin email
- OpenCTI admin password
- OpenCTI admin token
- OpenCTI encryption key
- MinIO credentials
- RabbitMQ credentials
- VirusTotal API token

Do not commit the real `.env` file.

## 5. Start Stack

Run:

    cd /opt/opencti
    docker compose up -d

Validate:

    docker compose ps
    docker compose logs --tail=100 opencti

## 6. Configure HTTPS

Install Caddy and configure a reverse proxy to forward requests to:

    127.0.0.1:8080

Example Caddyfile:

    capstone-opencti.example.com {
        reverse_proxy 127.0.0.1:8080
    }

## 7. Validate Connectors

Validate MITRE ATT&CK:

    Search for T1059 in OpenCTI.

Validate VirusTotal:

    Create an observable and run VirusTotal enrichment.
