#!/bin/bash

# ====================================
#  Simple Calculator - Termux
# ====================================

echo "===================================="
echo "      Simple Calculator "
echo "===================================="

echo "------------------------------------"

# Fungsi untuk operasi matematika
function Kalkulator() {
    case $operator in
        1)
            hasil=$(($angka1 + $angka2))
            echo "Hasil: $angka1 + $angka2 = $hasil"
            ;;
        2)
            hasil=$(($angka1 - $angka2))
            echo "Hasil: $angka1 - $angka2 = $hasil"
            ;;
        3)
            hasil=$(($angka1 * $angka2))
            echo "Hasil: $angka1 * $angka2 = $hasil"
            ;;
        4)
            if [ $angka2 -eq 0 ]; then
                echo "Error: Pembagian dengan nol tidak diperbolehkan!"
            else
                hasil=$(($angka1 / $angka2))
                echo "Hasil: $angka1 / $angka2 = $hasil"
            fi
            ;;
        5)
            if [ $angka2 -eq 0 ]; then
                echo "Error: Modulo dengan nol tidak diperbolehkan!"
            else
                hasil=$(($angka1 % $angka2))
                echo "Hasil: $angka1 % $angka2 = $hasil"
            fi
            ;;
        *)
            echo "Pilihan tidak valid!"
            ;;
    esac
}

# Menu utama
while true; do
    echo "===================================="
    echo "         Menu Calculator"
    echo "===================================="
    echo "1. Penjumlahan (+)"
    echo "2. Pengurangan (-)"
    echo "3. Perkalian (*)"
    echo "4. Pembagian (/)"
    echo "5. Modulo (%)"
    echo "0. Keluar"
    echo "------------------------------------"
    
    read -p "Pilih operasi (0-5): " pilihan
    
    if [ "$pilihan" == "0" ]; then
        echo "Terima kasih telah menggunakan calculator!"
        break
    fi
    
    # Validasi pilihan
    if [[ ! "$pilihan" =~ ^[1-5]$ ]]; then
        echo "Pilihan tidak valid! Coba lagi."
        echo ""
        continue
    fi
    
    # Input angka
    read -p "Masukkan angka pertama: " angka1
    read -p "Masukkan angka kedua: " angka2
    
    # Validasi angka
    if [[ ! "$angka1" =~ ^-?[0-9]+$ ]] || [[ ! "$angka2" =~ ^-?[0-9]+$ ]]; then
        echo "Error: Masukkan angka yang valid!"
        echo ""
        continue
    fi
    
    operator=$pilihan
    Kalkulator
    
    echo ""
done

echo "===================================="
echo "   Program Selesai "
echo "===================================="
