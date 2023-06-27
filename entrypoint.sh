#!/bin/sh
echo "Info: Create a crontab-entry for the backup"
echo -e "$CRON_SCHEDULE /app/scripts/create_backup.sh\n" > /etc/crontabs/root
echo "Info: Starting the cron deamon"
crond -f