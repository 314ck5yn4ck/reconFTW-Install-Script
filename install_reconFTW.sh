#!/bin/bash

# Update and upgrade the system
apt-get update && apt-get upgrade -y

# Install Git, Tmux, and UFW
apt-get install -y git tmux ufw

# UFW - allow SSH, disable logging in UFW and enable
ufw allow ssh
ufw logging off # optional
ufw enable

# Disable ICMP echo requests
echo "net.ipv4.icmp_echo_ignore_all=1" >> /etc/sysctl.conf
sysctl -p

# Install reconfTW
cd ~
git clone https://github.com/six2dez/reconftw
cd reconftw/
./install.sh

# Create new ~/.config/notify/provider-config.yaml
rm ~/.config/notify/provider-config.yaml
touch ~/.config/notify/provider-config.yaml

# Build Slack notifications
# Ref - https://github.com/projectdiscovery/notify
echo "slack:" >> ~/.config/notify/provider-config.yaml
echo "  - id: \"slack\"" >> ~/.config/notify/provider-config.yaml
echo "    slack_channel: \"recon\"" >> ~/.config/notify/provider-config.yaml
echo "    slack_username: \"test\"" >> ~/.config/notify/provider-config.yaml
echo "    slack_format: \"{{data}}\"" >> ~/.config/notify/provider-config.yaml
echo "    slack_webhook_url: \"https://hooks.slack.com/services/XXXXXX\"" >> ~/.config/notify/provider-config.yaml

# Install and start Axiom configuration
cd ~
git clone https://github.com/pry0cc/axiom ~/.axiom/
cd ~/.axiom/interact/
./axiom-configure
