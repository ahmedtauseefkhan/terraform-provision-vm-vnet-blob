
**Azure Infrastructure Provisioning with CI/CD and Ansible Automation**

**Overview**

This repository contains code and automation scripts for provisioning infrastructure on Azure using **Terraform** and deploying software on the provisioned Virtual Machine (VM) using **Ansible**. The CI/CD pipeline is managed with **GitHub Actions**, automating the deployment, configuration, and teardown of resources.

**Key Features:**
- **Infrastructure as Code (IaC)**: The infrastructure (Virtual Network, Virtual Machine, and Blob Storage) is provisioned on Azure using Terraform.
- **CI/CD with GitHub Actions**: Automated deployment and resource cleanup are triggered via GitHub Actions.
- **Ansible Automation**: Post-provisioning configuration using Ansible
