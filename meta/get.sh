#!/bin/bash

# Указываем номер AS и файл для сохранения
AS_NUMBER="AS32934"
OUTPUT_FILE="ip_routes.txt"

# Выполняем запрос whois и извлекаем только маршруты
whois -h whois.radb.net — "-i origin $AS_NUMBER" | grep "^route:" | awk '{print $2}' > "$OUTPUT_FILE"

# Проверяем, всё ли прошло успешно
if [ $? -eq 0 ]; then
    echo "IP маршруты сохранены в файл: $OUTPUT_FILE"
else
    echo "Произошла ошибка при выполнении скрипта."
fi