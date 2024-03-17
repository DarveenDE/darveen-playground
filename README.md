# Personal Playground #

Started to play around with Ansible for automation and proxmox for virtualization, i've had increasing needs for scripts, so i decided to just host them bc my pc is always a mess and yeah, here we go.

## Ansible Playbooks ##

Since i'm just getting started, there is not much to see. Just a simple playbook for apt update/upgrade for now, while i dial in my vm's

## Using the "Zabbix-Agent Installer" ##
To execute the Installer for zabbix-agent2, you can use this:

```shell
curl -sSL -o InstallZabbix7Agent2.sh https://raw.githubusercontent.com/DarveenDE/darveen-playground/main/InstallZabbix7Agent2.sh && chmod +x InstallZabbix7Agent2.sh && sudo ./InstallZabbix7Agent2.sh
```
It's basically downloading the script, making it executable (chmod +x) and then staring it with sudo. Enter your password and wheee!