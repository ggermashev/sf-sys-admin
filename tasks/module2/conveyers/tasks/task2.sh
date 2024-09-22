#!/bin/bash

# Напишите конвейер, который сравнивает содержимое двух директорий. 
# Используйте команды find, sort, и diff для поиска и сравнения файлов в двух директориях. 
# Результат сравнения сохраните в файл «directory_comparison.txt».

find -type f|sort|diff -qr ../dir1 ../dir2 > ../directory_comparison.txt
echo "Task2 finished successfully. Check directory_comparison.txt"