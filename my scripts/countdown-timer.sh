#!/bin/bash

# ====================================
#  Countdown Timer - Termux
# ====================================

echo "===================================="
echo "      Countdown Timer "
echo "===================================="

echo "------------------------------------"

# Fungsi untuk countdown
function start_countdown() {
    local seconds=$1
    local label=$2
    
    echo ""
    echo "--- $label ---"
    echo "Mulai dalam $seconds detik..."
    echo "------------------------------------"
    
    while [ $seconds -gt 0 ]; do
        # Tampilkan waktu tersisa
        printf "\rWaktu tersisa: %02d:%02d" $((seconds / 60)) $((seconds % 60))
        
        # Sleep 1 detik
        sleep 1
        
        # Kurangi detik
        ((seconds--))
    done
    
    printf "\rWaktu tersisa: 00:00      "
    echo ""
    echo "------------------------------------"
    echo "WAKTU HABIS! $label Selesai!"
    echo "------------------------------------"
    
    # Bunyi alarm (jika tersedia)
    echo -e "\a"
}

# Menu utama
while true; do
    echo "===================================="
    echo "       Menu Countdown Timer"
    echo "===================================="
    echo "1. Timer 1 Menit"
    echo "2. Timer 5 Menit"
    echo "3. Timer 10 Menit"
    echo "4. Timer 30 Menit"
    echo "5. Timer Custom"
    echo "6. Timer Mundur (Input Manual)"
    echo "0. Keluar"
    echo "------------------------------------"
    
    read -p "Pilih timer (0-6): " pilihan
    
    case $pilihan in
        1)
            start_countdown 60 "Timer 1 Menit"
            ;;
        2)
            start_countdown 300 "Timer 5 Menit"
            ;;
        3)
            start_countdown 600 "Timer 10 Menit"
            ;;
        4)
            start_countdown 1800 "Timer 30 Menit"
            ;;
        5)
            echo ""
            echo "--- Timer Preset ---"
            echo "a. Timer 15 Detik"
            echo "b. Timer 2 Menit"
            echo "c. Timer 15 Menit"
            echo "d. Timer 1 Jam"
            read -p "Pilih preset (a-d): " preset
            
            case $preset in
                a) start_countdown 15 "Timer 15 Detik" ;;
                b) start_countdown 120 "Timer 2 Menit" ;;
                c) start_countdown 900 "Timer 15 Menit" ;;
                d) start_countdown 3600 "Timer 1 Jam" ;;
                *) echo "Preset tidak valid!" ;;
            esac
            ;;
        6)
            echo ""
            echo "--- Timer Custom ---"
            read -p "Masukkan jam (0-23): " jam
            read -p "Masukkan menit (0-59): " menit
            read -p "Masukkan detik (0-59): " detik
            
            # Validasi input
            if ! [[ "$jam" =~ ^[0-9]+$ ]] || ! [[ "$menit" =~ ^[0-9]+$ ]] || ! [[ "$detik" =~ ^[0-9]+$ ]]; then
                echo "Error: Masukkan angka yang valid!"
                continue
            fi
            
            if [ $jam -gt 23 ] || [ $menit -gt 59 ] || [ $detik -gt 59 ]; then
                echo "Error: Input tidak valid!"
                continue
            fi
            
            # Hitung total detik
            total_detik=$((jam * 3600 + menit * 60 + detik))
            
            if [ $total_detik -eq 0 ]; then
                echo "Error: Waktu tidak boleh 0!"
                continue
            fi
            
            start_countdown $total_detik "Timer Custom ($jam jam $menit menit $detik detik)"
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
