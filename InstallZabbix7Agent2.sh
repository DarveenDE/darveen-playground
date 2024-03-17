echo "Starting the setup process..."

echo "1. Downloading Zabbix Repo..."
wget -q https://repo.zabbix.com/zabbix/6.5/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.5-1+ubuntu22.04_all.deb && echo "Downloaded Zabbix Repo."

echo "2. Installing Zabbix Repo..."
dpkg -i zabbix-release_6.5-1+ubuntu22.04_all.deb > /dev/null 2>&1 && echo "Installed Zabbix Repo."

echo "3. Updating apt repos..."
apt update -qq && echo "Updated apt repos."

echo "4. Installing Zabbix Agent 2..."
apt install -y zabbix-agent2 zabbix-agent2-plugin-* > /dev/null 2>&1 && echo "Installed Zabbix Agent 2."

# Setting the zabbix config as a variable
FILE="/etc/zabbix/zabbix_agent2.conf"

# Prompt the user for the new server IP or subnet
echo -n "Enter the IP/subnet from your Zabbix server (e.g., 192.168.178.0/24 for a subnet): "
read ZabbixServerIP

# Use sed to find and replace the Server IP address with the user-provided one
sed -i "s|Server=127.0.0.1|Server=$ZabbixServerIP|" $FILE && echo "Set the allowed IP for connections to $ZabbixServerIP."

echo "5. Restarting Zabbix Agent..."
if systemctl restart zabbix-agent2 > /dev/null 2>&1; then
    echo "Agent successfully restarted. Now add this server to your Zabbix server."
else
    echo "Failed to restart the agent. Check the service status for details."
fi
