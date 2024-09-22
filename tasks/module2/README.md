# Конвейеры

- [Напишите конвейер, который будет использовать команды ps, grep и awk для мониторинга активных процессов в системе. Результаты должны быть отсортированы по использованию ресурсов, и информация должна быть записана в файл «system_monitoring.txt».](conveyers/tasks/task1.sh)

```bash
ps -A -l | awk '{if ($2 == "R") print $0}' | sort -k10 > ../system_monitoring.txt
echo "Task1 finished successfully. Check system_monitoring.txt"
```

- [Напишите конвейер, который сравнивает содержимое двух директорий. Используйте команды find, sort, и diff для поиска и сравнения файлов в двух директориях.  Результат сравнения сохраните в файл «directory_comparison.txt».](conveyers/tasks/task2.sh)

```bash
find -type f|sort|diff -qr ../dir1 ../dir2 > ../directory_comparison.txt
echo "Task2 finished successfully. Check directory_comparison.txt"
```

- [Напишите конвейер для подсчета общего числа строк во всех текстовых файлах в указанной директории, используя find, xargs и wc.](conveyers/tasks/task3.sh)
```bash
find ../ -name "*.txt*" -not -name "task3_ans.txt" | xargs wc -l > ../task3_ans.txt
echo "Task3 finished successfully. Check task3_ans.txt"
```

- [Напишите конвейер, который использует команды df, sort и awk для мониторинга использования дискового пространства и записывает результаты в файл «disk_space_usage.txt».](conveyers/tasks/task4.sh)

```bash
df -h | sort -rk5 | awk '{print $1,$5}' > ../disk_space_usage.txt
echo "Task4 finished successfully. Check disk_space_usage.txt"
```

- [Напишите конвейер, который использует команды cat, grep, awk, sort и tar для фильтрации строк с ключевым словом в лог-файлах, сортировки и архивации результатов.](conveyers/tasks/task5.sh)

```bash
find / -name "*.log" -type f | xargs cat | grep status | sort > ../file_for_arch.txt | 
tar -cf ../archive.tar ../file_for_arch.txt
echo "Task5 finished successfully. Check archive.tar"
```

# Скрипты

- [Создайте Bash-скрипт, который будет проверять доступность нескольких хостов в вашей локальной сети. Список хостов (IP-адреса или доменные имена) должен быть задан в переменной в начале скрипта. Скрипт должен последовательно проверять каждый хост на доступность с использованием команды ping. Если хост доступен, выведите сообщение «Хост [ИМЯ ХОСТА] доступен», если нет — выведите сообщение «Хост [ИМЯ ХОСТА] недоступен». В конце скрипта выведите общее количество доступных и недоступных хостов.](scripts/tasks/task1.sh)

```bash
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
```

- [Напишите Bash-скрипт для анализа лог-файлов в указанной директории. Скрипт должен найти все файлы с расширением «.log» в указанной директории и подсчитать количество строк, содержащих определенное ключевое слово (например, «ERROR» или «Exception»). Ключевое слово должно быть задано в переменной в начале скрипта. Скрипт должен выводить сообщение в формате: «Файл [ИМЯ ФАЙЛА] содержит [КОЛИЧЕСТВО СТРОК С КЛЮЧЕВЫМ СЛОВОМ] строк с ключевым словом [КЛЮЧЕВОЕ СЛОВО]». В конце скрипта выведите общее количество строк с ключевым словом по всем лог-файлам в данной директории.](scripts/tasks/task2.sh)

```bash
dir_path=$1
keyword=$2

#Обработка входных данных
if [[ -z "$dir_path" || -z "$keyword" ]]; then
  echo "Передайте директорию для поиска и ключевое слово. Передано: $dir_path , $keyword"
  exit 1
fi


total=0

#Получение списка файлов
files=()
while IFS=  read -r -d $'\0'; do
    files+=("$REPLY")
done < <(find "${dir_path}" -name "*.log" -type f -print0)

# Фильтрация строк и подсчет
for file in "${files[@]}"; do
  cat "$file" | grep "$keyword" > ../count.txt
  lines="$(wc -l ../count.txt | awk '{print $1}')"

  echo "Файл $file содержит $lines строк с ключевым словом $keyword."
  total=$(($total + $lines))
done

echo "Общее количество строк с ключевым словом $keyword по всем лог-файлам в директории $dir_path - $total"
```