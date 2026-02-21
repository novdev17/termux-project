#!/bin/bash

# ====================================
#  Simple Hello World Script - Termux
# ====================================

echo "===================================="
echo "   Hello World from Termux "
echo "===================================="

# Tampilkan info user
echo "User       : $(whoami)"
echo "Directory  : $(pwd)"
echo "Date       : $(date)"

echo "------------------------------------"

# Input nama
read -p "Masukkan nama kamu: " name

echo "Halo, $name! Selamat belajar Bash Script"

echo "------------------------------------"

# Simulasi loading
echo "Memproses..."
sleep 1
echo "Selesai!"

echo "===================================="