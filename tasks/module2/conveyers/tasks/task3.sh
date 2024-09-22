#!/bin/bash

# Напишите конвейер для подсчета общего числа строк 
# во всех текстовых файлах в указанной директории, 
# используя find, xargs и wc.

find ../ -name "*.txt*" -not -name "task3_ans.txt" | xargs wc -l > ../task3_ans.txt
echo "Task3 finished successfully. Check task3_ans.txt"