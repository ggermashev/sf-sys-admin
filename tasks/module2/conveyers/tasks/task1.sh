#!/bin/bash

# Напишите конвейер, который будет использовать команды 
# ps, grep и awk для мониторинга активных процессов в системе. 
# Результаты должны быть отсортированы по использованию ресурсов, 
# и информация должна быть записана в файл «system_monitoring.txt».

ps -A -l | awk '{if ($2 == "R") print $0}' | sort -k10 > ../system_monitoring.txt
echo "Task1 finished successfully. Check system_monitoring.txt"
