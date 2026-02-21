#!/bin/bash

# =========================================
# SYSTEM MONITOR TOOL
# Author: NovDev
# =========================================

clear

# Warna
green='\033[0;32m'
cyan='\033[0;36m'
yellow='\033[1;33m'
red='\033[0;31m'
nc='\033[0m'

echo -e "${cyan}"
echo "====================================="
echo "        SYSTEM MONITOR"
echo "====================================="
echo -e "${nc}"

# Info User
echo -e "${green}User:${nc} $(whoami)"

# Info OS
echo -e "${green}OS:${nc} $(uname -o)"

# Kernel
echo -e "${green}Kernel:${nc} $(uname -r)"

# Uptime
echo -e "${green}Uptime:${nc}"
uptime

echo ""

# CPU Usage
echo -e "${yellow}CPU Usage:${nc}"
top -bn1 | grep "Cpu(s)" || top -l 1 | grep "CPU usage"

echo ""

# RAM Usage
echo -e "${yellow}Memory Usage:${nc}"
free -h || vm_stat

echo ""

# Disk Usage
echo -e "${yellow}Disk Usage:${nc}"
df -h

echo ""

# Network Info
echo -e "${yellow}Network:${nc}"
ip a 2>/dev/null || ifconfig

echo ""

# Battery (kalau ada)
echo -e "${yellow}Battery:${nc}"
if [ -d "/sys/class/power_supply/BAT0" ]; then
    cat /sys/class/power_supply/BAT0/capacity
else
    echo "Battery info not available"
fi

echo ""
echo -e "${green}[✔] Selesai menampilkan system info${nc}"