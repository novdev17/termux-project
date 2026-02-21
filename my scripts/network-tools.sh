#!/bin/bash

# --- Script untuk cek koneksi internet ---
echo "======================================"
echo "      NETWORK TOOLS BY NOV-DEV        "
echo "======================================"

# 1. Cek Koneksi ke Google
echo "[1] Checking connection to Google..."
if ping -c 3 google.com > /dev/null; then
    echo "Status: Connected! (Internet OK)"
else
    echo "Status: Disconnected! (Check your signal)"
fi

echo "--------------------------------------"

# 2. Cek Alamat IP Lokal
echo "[2] Your Local IP Address:"
hostname -I | awk '{print $1}'

echo "--------------------------------------"

# 3. Tes Kecepatan Respon (Ping)
echo "[3] Testing network latency..."
ping -c 4 8.8.8.8 | tail -1

echo "======================================"
echo "           Check Complete!            "
echo "======================================"
