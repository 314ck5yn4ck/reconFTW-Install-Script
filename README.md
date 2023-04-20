# reconFTW Install Script

A BASH script to help streamline VPS installation and initial configuration of reconFTW. The script also installs and initiates Axiom.

This script is for Debian based Linux systems and will need modification for other Linux distributions.

Ref: ReconFTW https://github.com/six2dez/reconftw
<br/>
Ref: notify https://github.com/projectdiscovery/notify

# Workflow

- Create a Slack bot: [https://api.slack.com/apps](https://api.slack.com/apps)
- Create a Slack channel: {domain_ext}
- Update ~/.config/notify/provider-config.yaml with webhook URL and Slack channel
- Verify webhook is functional: echo "hello" | notify
- Create subdomain list: subfinder -d {domain} -all > {domain_subdomains.txt}
- Alphabetically sort subdomain list: sort dsg.txt -d -o {domain_subdomains.txt}
- Change directory to reconFTW: cd ~/reconftw/
- Update reconFTW.cfg and change Axiom fleet name
- Start tmux session: tmux
- Start recon: ./reconftw.sh -m {CompanyName} -l {domain_subdomains.txt} -r -v

#tmux

tmux will keep the SSH session alive when logged out and can be reattached when logged in. 

To detach the tmux session: Ctrl-B,D
To attach the tmux session: tmux attach
