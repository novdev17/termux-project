#!/bin/bash

# ====================================
#  Logic Test dalam Bash Script
# ====================================

echo "===================================="
echo "   Logic Test dalam Bash Script "
echo "===================================="

echo "------------------------------------"

# --- Variabel untuk Testing ---
a=10
b=20
c=10
nama1="Andi"
nama2="Budi"
file1="test.txt"
file2="/home"

echo "Nilai a = $a, b = $b, c = $c"
echo "Nama1 = $nama1, Nama2 = $nama2"
echo "File1 = $file1, File2 = $file2"

echo "------------------------------------"

# --- Numerik Comparison (test atau []) ---
echo "--- Numerik Comparison ---"

# Equal (= atau -eq)
if [ "$a" -eq "$c" ]; then
    echo "a ($a) == c ($c) : BENAR"
fi

# Not Equal (!= atau -ne)
if [ "$a" -ne "$b" ]; then
    echo "a ($a) != b ($b) : BENAR"
fi

# Greater Than (-gt)
if [ "$b" -gt "$a" ]; then
    echo "b ($b) > a ($a) : BENAR"
fi

# Less Than (-lt)
if [ "$a" -lt "$b" ]; then
    echo "a ($a) < b ($b) : BENAR"
fi

# Greater or Equal (-ge)
if [ "$b" -ge "$a" ]; then
    echo "b ($b) >= a ($a) : BENAR"
fi

# Less or Equal (-le)
if [ "$a" -le "$c" ]; then
    echo "a ($a) <= c ($c) : BENAR"
fi

echo "------------------------------------"

# --- String Comparison ---
echo "--- String Comparison ---"

# Equal
if [ "$nama1" = "Andi" ]; then
    echo "nama1 = 'Andi' : BENAR"
fi

# Not Equal
if [ "$nama1" != "$nama2" ]; then
    echo "nama1 != nama2 : BENAR"
fi

# Zero Length (-n)
str="Hello"
if [ -n "$str" ]; then
    echo "String '$str' tidak kosong : BENAR"
fi

# Zero Length (-z)
empty=""
if [ -z "$empty" ]; then
    echo "String '$empty' kosong : BENAR"
fi

echo "------------------------------------"

# --- File Test Operators ---
echo "--- File Test Operators ---"

# Check if file exists
if [ -e "$file1" ]; then
    echo "File $file1 exists"
else
    echo "File $file1 does not exist"
fi

# Check if it's a file (-f) or directory (-d)
if [ -f "$file1" ]; then
    echo "$file1 is a regular file"
fi

if [ -d "$file2" ]; then
    echo "$file2 is a directory"
fi

# Check read/write/execute permissions
if [ -r "$file1" ]; then
    echo "$file1 is readable"
fi

if [ -w "$file1" ]; then
    echo "$file1 is writable"
fi

if [ -x "$file1" ]; then
    echo "$file1 is executable"
fi

echo "------------------------------------"

# --- Logical Operators (AND, OR, NOT) ---
echo "--- Logical Operators ---"

# AND (&& atau -a)
if [ "$a" -gt 5 ] && [ "$a" -lt 15 ]; then
    echo "a ($a) antara 5 dan 15 : BENAR"
fi

# OR (|| atau -o)
if [ "$a" -eq 5 ] || [ "$a" -eq 10 ]; then
    echo "a ($a) sama dengan 5 atau 10 : BENAR"
fi

# NOT (!)
if [ ! "$a" -eq 15 ]; then
    echo "a ($a) TIDAK sama dengan 15 : BENAR"
fi

echo "------------------------------------"

# --- Case Statement (Multiple Conditions) ---
echo "--- Case Statement ---"
read -p "Masukkan hari (1-7): " hari

case $hari in
    1) echo "Senin" ;;
    2) echo "Selasa" ;;
    3) echo "Rabu" ;;
    4) echo "Kamis" ;;
    5) echo "Jumat" ;;
    6|7) echo "Weekend" ;;
    *) echo "Input tidak valid" ;;
esac

echo "------------------------------------"

# --- Ternary-like Logic with && and || ---
echo "--- Ternary-like Logic ---"
age=18
[ "$age" -ge 18 ] && echo "Dewasa" || echo "Anak-anak"

score=85
[ "$score" -ge 90 ] && echo "A" || [ "$score" -ge 80 ] && echo "B" || echo "C"

echo "===================================="
echo "   Selesai! "
echo "===================================="
