#!/usr/bin/bash

# Set the backup directory
script_dir=$(pwd)
backup_dir="$script_dir/backups"
temp_dir="$script_dir/temp"

# Create the temp directory if it doesn't exist
mkdir -p "$temp_dir"


# List files sorted by modification time and get the first result
latest_file=$(ls -lt backups/ | grep 'dump' | head -n 1 | awk '{print $9}')

tar -xvzf "$backup_dir/$latest_file" -C "$temp_dir"

extract_dir=$(echo $latest_file | cut -d'.' -f1)

database_name="test_db"

docker exec -it mongodb mkdir /temp_backup
docker cp "$temp_dir/$extract_dir" "mongodb:/temp_backup/"
docker exec -it mongodb mongorestore --username=admin --password=password --authenticationDatabase=admin --db="$database_name" --dir="/temp_backup/$extract_dir/qms_castle"
docker exec -it mongodb rm -r /temp_backup

rm -rf "$temp_dir"

echo
echo "-------------------------------------------------------------------"
echo "DB restored from $latest_file."
