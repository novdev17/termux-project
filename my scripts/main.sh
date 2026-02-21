#!/bin/bash

# =========================================
# TERMUX PROJECT - MAIN MENU
# Author: NovDev
# =========================================

clear

# Warna
green='\033[0;32m'
cyan='\033[0;36m'
red='\033[0;31m'
yellow='\033[1;33m'
nc='\033[0m'

# Banner
echo -e "${cyan}"
echo "====================================="
echo "        TERMUX PROJECT TOOL"
echo "====================================="
echo -e "${nc}"

# Menu
echo -e "${green}1.${nc} Hello World"
echo -e "${green}2.${nc} Info System"
echo -e "${green}3.${nc} Run Script Hello"
echo -e "${green}0.${nc} Exit"
echo ""
read -p "Pilih menu: " pilihan

case $pilihan in
    1)
        echo -e "${yellow}Hello, Selamat datang di project kamu!${nc}"
        ;;

    2)
        echo -e "${cyan}Informasi Sistem:${nc}"
        echo "User: $(whoami)"
        echo "OS: $(uname -o)"
        echo "Kernel: $(uname -r)"
        ;;

    3)
        echo -e "${green}Menjalankan hello-world.sh...${nc}"
        bash scripts/hello-world.sh
        ;;

    0)
        echo -e "${red}Keluar dari program...${nc}"
        exit
        ;;

    *)
        echo -e "${red}Pilihan tidak valid!${nc}"
        ;;
esac
