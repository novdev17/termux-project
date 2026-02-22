bu#!/bin/bash

# ====================================
#  Simple Menu - Termux
# ====================================

# Fungsi untuk menampilkan header
function show_header() {
    echo "===================================="
    echo "      Simple Menu Program"
    echo "===================================="
}

# Fungsi untuk menampilkan menu
function show_menu() {
    echo "------------------------------------"
    echo "         Menu Utama"
    echo "------------------------------------"
    echo "1. Lihat Tanggal & Waktu"
    echo "2. Lihat Informasi User"
    echo "3. Lihat Direktori Saat Ini"
    echo "4. Daftar File"
    echo "5. Cek Sistem"
    echo "6. Kalkulator Sederhana"
    echo "7. Generate Password"
    echo "8. Backup File"
    echo "9. Text Editor Sederhana"
    echo "0. Keluar"
    echo "------------------------------------"
}

# Fungsi tanggal dan waktu
function menu_tanggal() {
    echo ""
    echo "--- Tanggal & Waktu ---"
    echo "Tanggal: $(date +%d/%m/%Y)"
    echo "Waktu: $(date +%H:%M:%S)"
    echo "Hari: $(date +%A)"
}

# Fungsi informasi user
function menu_user() {
    echo ""
    echo "--- Informasi User ---"
    echo "Username: $(whoami)"
    echo "Home Dir: $HOME"
    echo "Shell: $SHELL"
    echo "Hostname: $HOSTNAME"
}

# Fungsi direktori saat ini
function menu_dir() {
    echo ""
    echo "--- Direktori Saat Ini ---"
    echo "Path: $(pwd)"
    echo "Isi direktori:"
    ls -lh
}

# Fungsi daftar file
function menu_list() {
    echo ""
    echo "--- Daftar File ---"
    read -p "Masukkan path direktori: " dirpath
    if [ -d "$dirpath" ]; then
        echo "Isi $dirpath:"
        ls -lh "$dirpath"
    else
        echo "Error: Direktori tidak ditemukan!"
    fi
}

# Fungsi cek sistem
function menu_sistem() {
    echo ""
    echo "--- Informasi Sistem ---"
    echo "OS: $(uname -s)"
    echo "Kernel: $(uname -r)"
    echo "Architecture: $(uname -m)"
    echo "Uptime: $(uptime -p 2>/dev/null || uptime)"
    echo "Memory Usage:"
    free -h 2>/dev/null || vm_stat
}

# Fungsi kalkulator
function menu_kalkulator() {
    echo ""
    echo "--- Kalkulator Sederhana ---"
    read -p "Angka 1: " a
    read -p "Angka 2: " b
    echo "Pilih operasi: + - * /"
    read -p "Operasi: " op
    
    case $op in
        +) echo "Hasil: $((a + b))" ;;
        -) echo "Hasil: $((a - b))" ;;
        \*) echo "Hasil: $((a * b))" ;;
        /) 
            if [ $b -eq 0 ]; then
                echo "Error: Pembagian dengan nol!"
            else
                echo "Hasil: $((a / b))"
            fi
            ;;
        *) echo "Operasi tidak valid!" ;;
    esac
}

# Fungsi generate password
function menu_password() {
    echo ""
    echo "--- Generate Password ---"
    read -p "Panjang password: " length
    if [[ "$length" =~ ^[0-9]+$ ]] && [ $length -ge 4 ] && [ $length -le 32 ]; then
        password=$(< /dev/urandom tr -dc 'A-Za-z0-9!@#$%^&*' | head -c $length)
        echo "Password: $password"
    else
        echo "Error: Panjang harus antara 4-32!"
    fi
}

# Fungsi backup file
function menu_backup() {
    echo ""
    echo "--- Backup File ---"
    read -p "Nama file yang di-backup: " filename
    if [ -f "$filename" ]; then
        backup="${filename}.bak.$(date +%Y%m%d%H%M%S)"
        cp "$filename" "$backup"
        echo "Berhasil di-backup ke: $backup"
    else
        echo "Error: File tidak ditemukan!"
    fi
}

# Fungsi text editor sederhana
function menu_editor() {
    echo ""
    echo "--- Text Editor Sederhana ---"
    echo "(Ketik teks, tekan Ctrl+D untuk menyimpan)"
    read -p "Nama file: " filename
    if [ -n "$filename" ]; then
        cat > "$filename"
        echo "File '$filename' telah disimpan!"
    else
        echo "Error: Nama file tidak boleh kosong!"
    fi
}

# Main program
while true; do
    show_header
    show_menu
    
    read -p "Pilih menu (0-9): " pilihan
    
    case $pilihan in
        1) menu_tanggal ;;
        2) menu_user ;;
        3) menu_dir ;;
        4) menu_list ;;
        5) menu_sistem ;;
        6) menu_kalkulator ;;
        7) menu_password ;;
        8) menu_backup ;;
        9) menu_editor ;;
        0) 
            echo "Terima kasih! Sampai jumpa!"
            break
            ;;
        *) echo "Pilihan tidak valid!" ;;
    esac
    
    echo ""
    read -p "Tekan Enter untuk lanjut..."
    clear 2>/dev/null || cls
done

echo "===================================="
echo "   Program Selesai "
echo "===================================="
