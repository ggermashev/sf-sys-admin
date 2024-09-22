#!/bin/bash

# Напишите конвейер, который использует команды df, sort и awk 
# для мониторинга использования дискового пространства 
# и записывает результаты в файл «disk_space_usage.txt».

df -h | sort -rk5 | awk '{print $1,$5}' > ../disk_space_usage.txt
echo "Task4 finished successfully. Check disk_space_usage.txt"