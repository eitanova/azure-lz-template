# Azure Landing Zone

This repository implements an Azure Landing Zone (LZ) with a hub-and-spoke architecture, providing a secure and scalable foundation for Azure deployments.

## Architecture

The landing zone is organized into several stages:

1. **Resource Management (1-resman)**
   - Management groups
   - Subscriptions
   - Top-level organization

2. **Global Shared Services (2-global-shared-services)**
   - Global networking hubs
   - Shared identity services
   - Management services

3. **Division Factory (3-divisions-factory)**
   - Division-level networking
   - Trusted/Untrusted zones
   - Basic firewall setup

4. **Subscription Factory (4-subscriptions-factory)**
   - Subscription-level resources
   - Application deployments

## Network Architecture

The network architecture follows a hub-and-spoke model with:

- **Trusted Zone**: For internal workloads
- **Untrusted Zone**: For internet-facing workloads
- **Internet Hub**: For internet connectivity
- **On-Prem Hub**: For connectivity to on-premises networks

Each zone includes:
- Azure Firewall
- Route tables
- Virtual network peering

## Configuration

The configuration is managed through YAML files in the `config-dev` directory:

- `divisions/`: Division-specific configurations
- `networking/`: Network configurations
- `providers/`: Azure provider configurations
- `tfvars/`: Terraform variable files

## Security

- Basic firewall setup
- Route tables for traffic control
- Virtual network peering with security controls

## Deployment

1. Authenticate to Azure:
   ```bash
   az login
   ```

2. Initialize the environment:
   ```bash
   ./stage_links.sh <environment>
   ```

3. Deploy in order:
   ```bash
   cd 1-resman && terraform init && terraform apply
   cd ../2-global-shared-services && terraform init && terraform apply
   cd ../3-divisions-factory && terraform init && terraform apply
   cd ../4-subscriptions-factory && terraform init && terraform apply
   ```

## Requirements

- Azure CLI
- Terraform >= 1.0.0
- Appropriate Azure permissions
- Access to required subscriptions

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## Security Considerations

- Route tables should be properly configured

## Support

For support, please contact the infrastructure team. 