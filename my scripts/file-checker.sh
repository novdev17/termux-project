#!/bin/bash

# ====================================
#  File Checker - Termux
# ====================================

echo "===================================="
echo "      File Checker "
echo "===================================="

echo "------------------------------------"

# Fungsi untuk cek file
function check_file() {
    local filepath=$1
    
    echo ""
    echo "--- Hasil Cek: $filepath ---"
    echo "------------------------------------"
    
    # Cek apakah file ada
    if [ -e "$filepath" ]; then
        echo "[✓] File/Direktori ADA"
    else
        echo "[✗] File/Direktori TIDAK ADA"
        return 1
    fi
    
    # Cek jenis file
    if [ -f "$filepath" ]; then
        echo "[✓] Jenis: File Biasa"
    elif [ -d "$filepath" ]; then
        echo "[✓] Jenis: Direktori"
    elif [ -L "$filepath" ]; then
        echo "[✓] Jenis: Symlink"
    else
        echo "[?] Jenis: File Khusus"
    fi
    
    # Cek izin akses
    echo "Izin Akses:"
    if [ -r "$filepath" ]; then
        echo "  [✓] Baca (Readable)"
    else
        echo "  [✗] Baca (Not Readable)"
    fi
    
    if [ -w "$filepath" ]; then
        echo "  [✓] Tulis (Writable)"
    else
        echo "  [✗] Tulis (Not Writable)"
    fi
    
    if [ -x "$filepath" ]; then
        echo "  [✓] Eksekusi (Executable)"
    else
        echo "  [✗] Eksekusi (Not Executable)"
    fi
    
    # Cek pemilik
    if [ -O "$filepath" ]; then
        echo "[✓] File ini milik Anda (Owner)"
    else
        echo "[✗] File ini bukan milik Anda"
    fi
    
    # Cek ukuran file
    if [ -f "$filepath" ]; then
        size=$(stat -c%s "$filepath" 2>/dev/null || stat -f%z "$filepath" 2>/dev/null)
        echo "Ukuran: $size bytes"
    fi
    
    # Cek waktu modifikasi
    if [ -f "$filepath" ] || [ -d "$filepath" ]; then
        modtime=$(stat -c "%y" "$filepath" 2>/dev/null || stat -f "%Sm" "$filepath" 2>/dev/null)
        echo "Terakhir Dimodifikasi: $modtime"
    fi
    
    echo "------------------------------------"
}

# Fungsi untuk列出 file
function list_files() {
    local dir=$1
    
    echo ""
    echo "--- Daftar File di: $dir ---"
    echo "------------------------------------"
    
    if [ ! -d "$dir" ]; then
        echo "Error: $dir bukan direktori!"
        return 1
    fi
    
    echo "Nama File | Tipe | Ukuran"
    echo "------------------------------------"
    
    for item in "$dir"/*; do
        if [ -e "$item" ]; then
            name=$(basename "$item")
            if [ -d "$item" ]; then
                echo "$name | DIR | -"
            elif [ -f "$item" ]; then
                size=$(stat -c%s "$item" 2>/dev/null || stat -f%z "$item" 2>/dev/null)
                echo "$name | FILE | $size bytes"
            fi
        fi
    done
    
    echo "------------------------------------"
}

# Menu utama
while true; do
    echo "===================================="
    echo "        Menu File Checker"
    echo "===================================="
    echo "1. Cek File Tunggal"
    echo "2. Daftar File di Direktori"
    echo "3. Cek Multiple File"
    echo "4. Quick Check (File Terkini)"
    echo "0. Keluar"
    echo "------------------------------------"
    
    read -p "Pilih menu (0-4): " pilihan
    
    case $pilihan in
        1)
            echo ""
            echo "--- Cek File Tunggal ---"
            read -p "Masukkan path file: " filepath
            check_file "$filepath"
            ;;
        2)
            echo ""
            echo "--- Daftar File ---"
            read -p "Masukkan path direktori (default: .): " dirpath
            dirpath=${dirpath:-.}
            list_files "$dirpath"
            ;;
        3)
            echo ""
            echo "--- Cek Multiple File ---"
            echo "Masukkan nama file (pisahkan dengan spasi):"
            read -a files
            
            for file in "${files[@]}"; do
                check_file "$file"
                echo ""
            done
            ;;
        4)
            echo ""
            echo "--- Quick Check ---"
            echo "File terkini di direktori saat ini:"
            echo "------------------------------------"
            ls -lh
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
