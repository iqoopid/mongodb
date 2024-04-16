#!/usr/bin/bash

# Set the backup directory and timestamp
script_dir=$(pwd)
backup_dir="$script_dir/backups"
timestamp=$(date +"%Y%m%d")


# The db name
database_name="qms_castle"

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"


# Create a bson backup file of the mongo db
docker exec -it mongodb mkdir /temp_backup
docker exec -it mongodb mongodump --username=admin --password=password --authenticationDatabase=admin --db="$database_name" --out "/temp_backup/dump-$timestamp"
docker cp "mongodb:/temp_backup/dump-$timestamp" "$backup_dir/"
docker exec -it mongodb rm -r /temp_backup

# Create a tarball of the dump folder
cd "$backup_dir"
tar -czvf "dump-$timestamp.tar.gz" "dump-$timestamp"

# Remove the dump folders
rm -rf "dump-$timestamp"
cd ..

echo
echo "-------------------------------------------------------------------"
echo "DB backed up to dump-$timestamp.tar.gz"

# Change ownership for created files
username=$(whoami)
groupid=$(id -g)
sudo chown -R $username:$groupid "$backup_dir"
