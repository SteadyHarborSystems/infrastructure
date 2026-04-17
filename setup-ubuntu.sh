#!/bin/bash
# =================================================================
# THE STEADY HARBOR - Infrastructure Provisioning Script
# Target OS: Ubuntu 24.04 / 22.04 LTS
# =================================================================

# 1. Non-Interactive Update
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get upgrade -y

# 2. Install Essential Tools
apt-get install -y ufw fail2ban unattended-upgrades curl git

# 3. Security Hardening: Firewall (UFW)
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow http
ufw allow https
ufw --force enable

# 4. Security Hardening: Automated Security Patches
cat <<EOF > /etc/apt/apt.conf.d/20auto-upgrades
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
EOF

# 5. Fail2Ban Setup (Protects against Brute Force)
systemctl enable fail2ban
systemctl start fail2ban

# 6. Finalize Log
echo "The Steady Harbor: Infrastructure Provisioned Successfully on $(date)" > /var/log/harbor_setup.log
