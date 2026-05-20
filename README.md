### Hexlet tests and linter status:
[![Actions Status](https://github.com/Nikita5343/devops-for-developers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Nikita5343/devops-for-developers-project-77/actions)

# Terraform Project 3

# DevOps for Developers Project 77

## Description

Infrastructure project with Terraform and Ansible.

The project creates:

- 2 virtual machines in Yandex Cloud
- Application Load Balancer
- HTTPS listener
- Cloud DNS zone for `voitov.online`
- DNS A record for the load balancer
- Managed TLS certificate in Yandex Certificate Manager
- Datadog monitor
- Docker application deployed with Ansible
- Datadog Agent installed with Ansible

Application URL:

https://voitov.online

## Requirements

- Terraform
- Ansible
- Yandex Cloud CLI
- Ansible Vault
- Existing Yandex Cloud account
- Domain `voitov.online`
- Datadog API key and Application key

## Project structure

```text
terraform/
  backend.tf
  provider.tf
  variables.tf
  main.tf
  dns.tf
  datadog.tf
  outputs.tf

ansible/
  playbook.yml
  requirements.yml
  backend.env
  terraform-secrets.auto.tfvars

Makefile
README.md