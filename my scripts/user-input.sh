#!/bin/bash

# ====================================
#  User Input dalam Bash Script
# ====================================

echo "===================================="
echo "   User Input dalam Bash Script "
echo "===================================="

echo "------------------------------------"

# --- Input Sederhana ---
echo "--- Input Sederhana ---"
echo -n "Masukkan nama kamu: "
read nama
echo "Halo, $nama!"

echo "------------------------------------"

# --- Input dengan -p (prompt) ---
echo "--- Input dengan -p ---"
read -p "Masukkan usia kamu: " usia
echo "Kamu berusia $usia tahun"

echo "------------------------------------"

# --- Input dengan Default Value ---
echo "--- Input dengan Default Value ---"
read -p "Masukkan kota [Jakarta]: " kota
kota=${kota:-Jakarta}
echo "Kota: $kota"

echo "------------------------------------"

# --- Input dengan Timeout ---
echo "--- Input dengan Timeout ---"
read -t 3 -p "Masukkan hobby (timeout 3 detik): " hobby
if [ -z "$hobby" ]; then
    echo "Tidak ada input (timeout)"
else
    echo "Hobby: $hobby"
fi

echo "------------------------------------"

# --- Input Password (hidden) ---
echo "--- Input Password ---"
read -s -p "Masukkan password: " password
echo ""
echo "Password telah disimpan"

echo "------------------------------------"

# --- Input dengan Validasi Angka ---
echo "--- Input dengan Validasi ---"
read -p "Masukkan nomor telepon: " nomor
if [[ "$nomor" =~ ^[0-9]+$ ]]; then
    echo "Nomor valid: $nomor"
else
    echo "Nomor tidak valid"
fi

echo "------------------------------------"

# --- Input Multiple Values ---
echo "--- Input Multiple Values ---"
read -p "Masukkan nama dan umur (pisahkan dengan spasi): " nama_usr umur_usr
echo "Nama: $nama_usr"
echo "Umur: $umur_usr"

echo "------------------------------------"

# --- Input dengan Array ---
echo "--- Input dengan Array ---"
echo "Masukkan 3 buah favorit (pisahkan dengan spasi):"
read -a buah
echo "Buah pertama: ${buah[0]}"
echo "Buah kedua: ${buah[1]}"
echo "Buah ketiga: ${buah[2]}"

echo "------------------------------------"

# --- Input dari Command Line Argumen ---
echo "--- Input dari Command Line ---"
echo "Argumen ke-1: $1"
echo "Argumen ke-2: $2"
echo "Argumen ke-3: $3"
echo "Jumlah argumen: $#"

echo "===================================="
echo "   Selesai! "
echo "===================================="
