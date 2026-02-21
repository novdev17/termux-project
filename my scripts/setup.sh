#!/bin/bash

# =========================================
# SETUP SCRIPT - TERMUX PROJECT
# Author: NovDev
# =========================================

clear

echo "====================================="
echo "        SETUP TERMUX PROJECT"
echo "====================================="

# Warna
green='\033[0;32m'
yellow='\033[1;33m'
red='\033[0;31m'
nc='\033[0m'

# Update package (untuk Termux/Linux)
echo -e "${yellow}[*] Updating system...${nc}"
pkg update -y && pkg upgrade -y 2>/dev/null || sudo apt update -y && sudo apt upgrade -y

# Install dependency
echo -e "${yellow}[*] Installing dependencies...${nc}"
pkg install -y git bash 2>/dev/null || sudo apt install -y git bash

# Permission file
echo -e "${yellow}[*] Setting permission...${nc}"
chmod +x main.sh
chmod +x scripts/hello-world.sh

# Selesai
echo ""
echo -e "${green}[✔] Setup selesai!${nc}"
echo -e "${green}Sekarang jalankan:${nc}"
echo ""
echo -e "${yellow}./main.sh${nc}"
echo ""