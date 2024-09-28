#!/bin/bash

# Создайте Bash-скрипт, который будет проверять доступность нескольких хостов в вашей локальной сети. 
# Список хостов (IP-адреса или доменные имена) должен быть задан в переменной в начале скрипта. 
# Скрипт должен последовательно проверять каждый хост на доступность с использованием команды ping. 
# Если хост доступен, выведите сообщение «Хост [ИМЯ ХОСТА] доступен», 
# если нет — выведите сообщение «Хост [ИМЯ ХОСТА] недоступен». 
# В конце скрипта выведите общее количество доступных и недоступных хостов.

available=0
unavailable=0
#Хосты для проверки
hosts=(192.168.0.0 192.168.0.1 127.0.0.1 192.168.1.1 192.168.0.2 193.168.0.0 193.168.0.1)

# Перебираем хосты по одному и проверяем
# В случае успеха хост доступен, иначе - нет
for host in "${hosts[@]}"; do
  ping -c 1 -s 1 -W 1 $host >/dev/null && { echo "Хост $host доступен"; available=$(( available + 1 )); } || { echo "Хост $host недоступен"; unavailable=$(( unavailable + 1 )); }
done

echo "Доступно: $available"
echo "Не доступно: $unavailable"