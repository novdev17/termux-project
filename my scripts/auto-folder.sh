#!/bin/bash

# ====================================
#  Auto Folder Manager - Termux
# ====================================

echo "===================================="
echo "    Auto Folder Manager "
echo "===================================="

echo "------------------------------------"

# Fungsi untuk membuat satu folder
function buat_folder() {
    local nama=$1
    if [ -d "$nama" ]; then
        echo "[!] Folder '$nama' sudah ada!"
    else
        mkdir -p "$nama"
        if [ $? -eq 0 ]; then
            echo "[✓] Folder '$nama' berhasil dibuat!"
        else
            echo "[✗] Gagal membuat folder '$nama'!"
        fi
    fi
}

# Fungsi untuk membuat struktur folder projekt
function buat_struktur_projekt() {
    local nama_projek=$1
    
    echo ""
    echo "--- Membuat Struktur Projek: $nama_projek ---"
    
    # Struktur folder umum
    mkdir -p "$nama_projek/src"
    mkdir -p "$nama_projek/assets"
    mkdir -p "$nama_projek/docs"
    mkdir -p "$nama_projek/config"
    mkdir -p "$nama_projek/lib"
    mkdir -p "$nama_projek/tests"
    
    echo "[✓] Struktur projek '$nama_projek' dibuat!"
    echo "Struktur:"
    find "$nama_projek" -type d | sort
}

# Fungsi untuk membuat struktur website
function buat_struktur_website() {
    local nama_website=$1
    
    echo ""
    echo "--- Membuat Struktur Website: $nama_website ---"
    
    mkdir -p "$nama_website/images"
    mkdir -p "$nama_website/css"
    mkdir -p "$nama_website/js"
    mkdir -p "$nama_website/fonts"
    mkdir -p "$nama_website/data"
    
    echo "[✓] Struktur website '$nama_website' dibuat!"
}

# Fungsi untuk membuat struktur Python project
function buat_struktur_python() {
    local nama_project=$1
    
    echo ""
    echo "--- Membuat Struktur Python: $nama_project ---"
    
    mkdir -p "$nama_project/$nama_project"
    mkdir -p "$nama_project/tests"
    mkdir -p "$nama_project/docs"
    mkdir -p "$nama_project/scripts"
    
    # Buat file __init__.py
    touch "$nama_project/$nama_project/__init__.py"
    touch "$nama_project/tests/__init__.py"
    
    # Buat file requirements.txt
    echo "# Requirements" > "$nama_project/requirements.txt"
    echo "# Add your dependencies here" >> "$nama_project/requirements.txt"
    
    # Buat README.md
    echo "# $nama_project" > "$nama_project/README.md"
    echo "" >> "$nama_project/README.md"
    echo "Description of the project." >> "$nama_project/README.md"
    
    echo "[✓] Struktur Python '$nama_project' dibuat!"
}

# Fungsi untuk buat beberapa folder sekaligus
function buat_multi_folder() {
    echo ""
    echo "--- Buat Multiple Folder ---"
    read -p "Masukkan nama folder (pisahkan dengan spasi): " -a folders
    
    for folder in "${folders[@]}"; do
        buat_folder "$folder"
    done
}

# Fungsi untuk hapus folder
function hapus_folder() {
    local nama=$1
    if [ -d "$nama" ]; then
        read -p "Yakin ingin hapus '$nama'? (y/n): " konfirmasi
        if [ "$konfirmasi" == "y" ]; then
            rm -rf "$nama"
            echo "[✓] Folder '$nama' dihapus!"
        else
            echo "Batal."
        fi
    else
        echo "[!] Folder '$nama' tidak ada!"
    fi
}

# Fungsi untuk rename folder
function rename_folder() {
    local lama=$1
    local baru=$2
    if [ -d "$lama" ]; then
        mv "$lama" "$baru"
        echo "[✓] Folder '$lama'改名 menjadi '$baru'!"
    else
        echo "[!] Folder '$lama' tidak ada!"
    fi
}

# Menu utama
while true; do
    echo "===================================="
    echo "       Menu Auto Folder"
    echo "===================================="
    echo "1. Buat Folder Tunggal"
    echo "2. Buat Multiple Folder"
    echo "3. Buat Struktur Projek"
    echo "4. Buat Struktur Website"
    echo "5. Buat Struktur Python"
    echo "6. Hapus Folder"
    echo "7. Rename Folder"
    echo "8. Lihat Isi Folder"
    echo "0. Keluar"
    echo "------------------------------------"
    
    read -p "Pilih menu (0-8): " pilihan
    
    case $pilihan in
        1)
            echo ""
            echo "--- Buat Folder Tunggal ---"
            read -p "Masukkan nama folder: " nama_folder
            buat_folder "$nama_folder"
            ;;
        2)
            buat_multi_folder
            ;;
        3)
            echo ""
            echo "--- Buat Struktur Projek ---"
            read -p "Masukkan nama projek: " nama_projek
            buat_struktur_projekt "$nama_projek"
            ;;
        4)
            echo ""
            echo "--- Buat Struktur Website ---"
            read -p "Masukkan nama website: " nama_website
            buat_struktur_website "$nama_website"
            ;;
        5)
            echo ""
            echo "--- Buat Struktur Python ---"
            read -p "Masukkan nama project: " nama_project
            buat_struktur_python "$nama_project"
            ;;
        6)
            echo ""
            echo "--- Hapus Folder ---"
            read -p "Masukkan nama folder: " nama_hapus
            hapus_folder "$nama_hapus"
            ;;
        7)
            echo ""
            echo "--- Rename Folder ---"
            read -p "Nama folder lama: " nama_lama
            read -p "Nama folder baru: " nama_baru
            rename_folder "$nama_lama" "$nama_baru"
            ;;
        8)
            echo ""
            echo "--- Lihat Isi Folder ---"
            read -p "Masukkan path folder (default: .): " path_folder
            path_folder=${path_folder:-.}
            if [ -d "$path_folder" ]; then
                echo "Isi $path_folder:"
                ls -lh "$path_folder"
            else
                echo "Error: Folder tidak ditemukan!"
            fi
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
