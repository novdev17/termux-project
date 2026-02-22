#!/bin/bash

# ====================================
#  Password Generator - Termux
# ====================================

echo "===================================="
echo "     Password Generator "
echo "===================================="

echo "------------------------------------"

# Karakter yang dapat digunakan
huruf_kecil="abcdefghijklmnopqrstuvwxyz"
huruf_besar="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
angka="0123456789"
simbol="!@#$%^&*()_+-=[]{}|;:,.<>?"

# Fungsi untuk menghasilkan password
function generate_password() {
    local panjang=$1
    local gunakan_kecil=$2
    local gunakan_besar=$3
    local gunakan_angka=$4
    local gunakan_simbol=$5
    
    # Bangun karakter pool
    karakter=""
    if [ "$gunakan_kecil" == "y" ]; then
        karakter="$karakter$huruf_kecil"
    fi
    if [ "$gunakan_besar" == "y" ]; then
        karakter="$karakter$huruf_besar"
    fi
    if [ "$gunakan_angka" == "y" ]; then
        karakter="$karakter$angka"
    fi
    if [ "$gunakan_simbol" == "y" ]; then
        karakter="$karakter$simbol"
    fi
    
    # Validasi jika tidak ada karakter yang dipilih
    if [ -z "$karakter" ]; then
        echo "Error: Pilih setidaknya satu jenis karakter!"
        return 1
    fi
    
    # Generate password
    password=""
    for ((i=0; i<panjang; i++)); do
        # Ambil karakter acak
        random_index=$(($RANDOM % ${#karakter}))
        password="${password}${karakter:$random_index:1}"
    done
    
    echo "$password"
}

# Menu utama
while true; do
    echo "===================================="
    echo "     Menu Password Generator"
    echo "===================================="
    echo "1. Generate Password"
    echo "2. Pengaturan Default"
    echo "0. Keluar"
    echo "------------------------------------"
    
    read -p "Pilih menu (0-2): " menu
    
    case $menu in
        1)
            echo ""
            echo "--- Generate Password ---"
            read -p "Masukkan panjang password (8-64): " panjang
            
            # Validasi panjang
            if ! [[ "$panjang" =~ ^[0-9]+$ ]] || [ $panjang -lt 8 ] || [ $panjang -gt 64 ]; then
                echo "Error: Panjang password harus antara 8 dan 64!"
                continue
            fi
            
            echo ""
            echo "Pilih karakter yang ingin digunakan:"
            read -p "Huruf kecil? (y/n): " gunakan_kecil
            read -p "Huruf besar? (y/n): " gunakan_besar
            read -p "Angka? (y/n): " gunakan_angka
            read -p "Simbol? (y/n): " gunakan_simbol
            
            echo ""
            echo "Password yang dihasilkan:"
            echo "------------------------------------"
            generate_password "$panjang" "$gunakan_kecil" "$gunakan_besar" "$gunakan_angka" "$gunakan_simbol"
            echo "------------------------------------"
            ;;
        2)
            echo ""
            echo "--- Pengaturan Default ---"
            echo "Panjang: 16 karakter"
            echo "Karakter: Semua (huruf kecil, besar, angka, simbol)"
            echo ""
            echo "Password default:"
            echo "------------------------------------"
            generate_password 16 y y y y
            echo "------------------------------------"
            ;;
        0)
            echo "Terima kasih!"
            break
            ;;
        *)
            echo "Pilihan tidak valid!"
            ;;
    esac
    
    echo ""
done

echo "===================================="
echo "   Program Selesai "
echo "===================================="
