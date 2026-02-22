#!/bin/bash

# ====================================
#  Variabel dalam Bash Script - Termux
# ====================================

echo "===================================="
echo "   Variabel dalam Bash Script "
echo "===================================="

echo "------------------------------------"

# --- Variabel String ---
echo "--- Variabel String ---"
nama="Andi"
echo "Nama: $nama"

# --- Variabel Numerik ---
echo "--- Variabel Numerik ---"
usia=20
echo "Usia: $usia"

# --- Variabel Array ---
echo "--- Variabel Array ---"
buah=("Apel" "Jeruk" "Mangga" "Pisang")
echo "Buah ke-1: ${buah[0]}"
echo "Buah ke-2: ${buah[1]}"
echo "Semua buah: ${buah[@]}"

echo "------------------------------------"

# --- Input Variabel dari User ---
echo "--- Input Variabel dari User ---"
read -p "Masukkan nama kamu: " nama_input
read -p "Masukkan umur kamu: " umur_input

echo "Halo, $nama_input! Kamu berusia $umur_input tahun."

echo "------------------------------------"

# --- Variabel Sistem ---
echo "--- Variabel Sistem ---"
echo "User       : $USER"
echo "Hostname   : $HOSTNAME"
echo "Home Dir   : $HOME"
echo "Current Dir: $PWD"
echo "Shell      : $SHELL"

echo "------------------------------------"

# --- Variabel Aritmatika ---
echo "--- Variabel Aritmatika ---"
angka1=10
angka2=5
hasil=$((angka1 + angka2))
echo "$angka1 + $angka2 = $hasil"

hasil=$((angka1 - angka2))
echo "$angka1 - $angka2 = $hasil"

hasil=$((angka1 * angka2))
echo "$angka1 * $angka2 = $hasil"

hasil=$((angka1 / angka2))
echo "$angka1 / $angka2 = $hasil"

echo "------------------------------------"

# --- Variabel Read-Only (Constant) ---
echo "--- Variabel Read-Only ---"
PI=3.14
readonly PI
echo "Nilai PI: $PI"

echo "------------------------------------"

# --- Variabel Special ---
echo "--- Variabel Special ---"
echo "Jumlah argumen: $#"
echo "Semua argumen: $@"
echo "Nama script: $0"

echo "===================================="
echo "   Selesai! "
echo "===================================="
