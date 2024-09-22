#!/bin/bash

# Напишите конвейер, который использует команды 
# cat, grep, awk, sort и tar 
# для фильтрации строк с ключевым словом в лог-файлах, 
# сортировки и архивации результатов.

find / -name "*.log" -type f | xargs cat | grep status | sort > ../file_for_arch.txt | 
tar -cf ../archive.tar ../file_for_arch.txt
echo "Task5 finished successfully. Check archive.tar"