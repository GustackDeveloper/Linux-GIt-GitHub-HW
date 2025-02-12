#!/bin/bash

# Определение переменных
LOG_DIR="/var/log/httpd"
BACKUP_DIR="/home/ec2-user/backups"
DATE=$(date +"%Y%m%d")
ARCHIVE_NAME="log_$DATE.tar.gz"

# Создание каталога для резервных копий, если он не существует
mkdir -p "$BACKUP_DIR"

# Создание архива файла access_log
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$LOG_DIR/access_log"

# Удаление архивов старше 3 дней
find "$BACKUP_DIR" -name "log_*.tar.gz" -mtime +3 -delete

# Вывод сообщения о завершении
echo "Резервная копия создана: $BACKUP_DIR/$ARCHIVE_NAME"
