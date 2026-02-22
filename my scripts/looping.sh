#!/bin/bash

# ====================================
#  Looping dalam Bash Script
# ====================================

echo "===================================="
echo "   Looping dalam Bash Script "
echo "===================================="

echo "------------------------------------"

# --- For Loop dengan List ---
echo "--- For Loop dengan List ---"
for nama in Lani Mawar Cika Dewi; do
    echo "Nama: $nama"
done

echo "------------------------------------"

# --- For Loop dengan Range ---
echo "--- For Loop dengan Range ---"
echo "Angka 1 sampai 5:"
for i in {1..5}; do
    echo "Angka: $i"
done

echo "------------------------------------"

# --- For Loop dengan Step ---
echo "--- For Loop dengan Step ---"
echo "Angka genap 2 sampai 10:"
for i in {2..10..2}; do
    echo "Angka: $i"
done

echo "------------------------------------"

# --- For Loop dengan Array ---
echo "--- For Loop dengan Array ---"
buah=("Apel" "Jeruk" "Mangga" "Pisang")
for item in "${buah[@]}"; do
    echo "Buah: $item"
done

echo "------------------------------------"

# --- For Loop dengan Command Output ---
echo "--- For Loop dengan Command Output ---"
echo "File di direktori saat ini:"
for file in $(ls *.sh 2>/dev/null); do
    echo "  - $file"
done

echo "------------------------------------"

# --- While Loop ---
echo "--- While Loop ---"
counter=1
while [ $counter -le 5 ]; do
    echo "Counter: $counter"
    ((counter++))
done

echo "------------------------------------"

# --- While Loop dengan Input ---
echo "--- While Loop dengan Input ---"
echo "Masukkan angka (0 untuk keluar):"
while read -p "Angka: " num && [ "$num" -ne 0 ]; do
    echo "Anda memasukkan: $num"
done
echo "Keluar dari loop"

echo "------------------------------------"

# --- Until Loop ---
echo "--- Until Loop ---"
x=1
until [ $x -gt 5 ]; do
    echo "Nilai x: $x"
    ((x++))
done

echo "------------------------------------"

# --- Nested Loop ---
echo "--- Nested Loop ---"
for i in 1 2; do
    for j in A B; do
        echo "i=$i, j=$j"
    done
done

echo "------------------------------------"

# --- Loop dengan Break ---
echo "--- Loop dengan Break ---"
for i in {1..10}; do
    if [ $i -eq 5 ]; then
        echo "Ketemu angka 5, keluar!"
        break
    fi
    echo "Angka: $i"
done

echo "------------------------------------"

# --- Loop dengan Continue ---
echo "--- Loop dengan Continue ---"
for i in {1..5}; do
    if [ $i -eq 3 ]; then
        echo "Lewati angka 3"
        continue
    fi
    echo "Angka: $i"
done

echo "------------------------------------"

# --- C-style For Loop ---
echo "--- C-style For Loop ---"
for ((i=0; i<5; i++)); do
    echo "Index: $i"
done

echo "===================================="
echo "   Selesai! "
echo "===================================="
