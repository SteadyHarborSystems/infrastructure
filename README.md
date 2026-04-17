# infrastructure
Automated provisioning, security hardening, and infrastructure-as-code for The Steady Harbor ecosystem.

# ⚓ The Steady Harbor | Infrastructure

**Status:** Private / Internal Use Only  
**Primary Architect:** Strategic Systems Analyst  

## Purpose
This repository manages the automated provisioning and security hardening for all managed environments within the Steady Harbor ecosystem. It ensures that every AWS Lightsail instance is deployed with a consistent, secure, and orderly foundation.

## Core Components
* **`setup-ubuntu.sh`**: The master launch script for Ubuntu LTS instances.
* **Security Baseline**: Automated UFW configuration, Fail2Ban setup, and unattended security upgrades.
* **Stack Configuration**: Standardized environment for PHP/MariaDB/Nginx.

## Usage
When launching a new Lightsail instance, use the following "fetch-and-run" command in the User Data field:
```bash
curl -s [https://raw.githubusercontent.com/SteadyHarborSystems/infrastructure/main/setup-ubuntu.sh](https://raw.githubusercontent.com/SteadyHarborSystems/infrastructure/main/setup-ubuntu.sh) | bash
