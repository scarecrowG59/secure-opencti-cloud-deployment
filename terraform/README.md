# Terraform Infrastructure

This folder contains Terraform code for provisioning DigitalOcean infrastructure for the Secure OpenCTI Cloud Deployment project.

## Resources

The Terraform configuration provisions:

- DigitalOcean Droplet
- Existing DigitalOcean SSH key lookup
- DigitalOcean Cloud Firewall
- SSH restricted to a single administrator IPv4 CIDR
- HTTP/HTTPS access for Caddy reverse proxy
- Outputs for public IP and SSH command

## Security Notes

Do not commit real secrets or tokens.

The following files must remain untracked:

- terraform.tfvars
- *.tfstate
- .terraform/

Use terraform.tfvars.example as a template.

## Usage

Copy the example variables file:

    cp terraform.tfvars.example terraform.tfvars

Edit the values:

    nano terraform.tfvars

Initialize Terraform:

    terraform init

Format and validate:

    terraform fmt
    terraform validate

Preview changes:

    terraform plan

Apply:

    terraform apply

Destroy resources when finished:

    terraform destroy

## Notes

This Terraform layer provisions infrastructure only. Application deployment is handled by Docker Compose under ../docker-compose/.
