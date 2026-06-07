# Validation

This document summarizes validation evidence for the OpenCTI deployment.

## Platform Health

Command:

    cd /opt/opencti
    docker compose ps

Expected result:

- OpenCTI running
- Elasticsearch healthy
- Redis healthy
- RabbitMQ healthy
- MinIO healthy
- Workers running

## HTTPS Access

Validation:

    https://capstone-opencti.servebeer.com

Expected result:

- OpenCTI login page loads over HTTPS
- Dashboard accessible after login

## MITRE ATT&CK

Validation:

- Search for `T1059`
- Confirm ATT&CK technique objects are visible

## VirusTotal

Validation:

- Create an IPv4 observable
- Run VirusTotal enrichment
- Confirm VirusTotal Results note appears under analyses

## CTI Reports

Two OpenCTI report objects were created:

1. VirusTotal enrichment report
2. Contextual ATT&CK mapping report

These demonstrate automated enrichment and analyst-driven contextual analysis.
