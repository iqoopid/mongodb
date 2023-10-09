#!/usr/bin/bash

# Set the backup directory and timestamp
script_dir=$(pwd)
backup_dir="$script_dir/backups/dumps"
audit_log_dir="$script_dir/backups/audit_log"
keycloak_sql_dir="$script_dir/backups/keycloak_postgres"
timestamp=$(date +"%Y%m%d%H%M%S")
audit_log="audit_log"


# Define the path to the .env file
cd ..
base_dir=$(pwd)
ENV_FILE="$base_dir/.env"
cd $script_dir

# Load the .env file
if [ -f "$ENV_FILE" ]; then
  source "$ENV_FILE"
else
  echo "Error: .env file not found at $ENV_FILE"
  exit 1
fi

# Check the ENVIRONMENT variable and get the corresponding db name
if [ "$ENVIRONMENT" == "production" ]; then
  database_name="$DB_NAME"
elif [ "$ENVIRONMENT" == "test" ]; then
  database_name="$TEST_DB_NAME"
elif [ "$ENVIRONMENT" == "staging" ]; then
  database_name="$STAGING_DB_NAME"
else
  echo "Error: Unknown ENVIRONMENT specified in .env"
  exit 1
fi

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"
mkdir -p "$audit_log_dir"
mkdir -p "$keycloak_sql_dir"

# Backup MongoDB data to a dump folder with the current timestamp
mongodump --username=user --password=password --authenticationDatabase=admin --db="$database_name" --excludeCollection "$audit_log" --out "$backup_dir/dump-$timestamp"
mongodump --username=user --password=password --authenticationDatabase=admin --db="$database_name" --collection "$audit_log" --out "$audit_log_dir/audit_log-$timestamp"

# Create a tarball of the dump folder
tar -czvf "$backup_dir/dump-$timestamp.tar.gz" "$backup_dir/dump-$timestamp"
tar -czvf "$audit_log_dir/audit_log-$timestamp.tar.gz" "$audit_log_dir/audit_log-$timestamp"

# Remove the dump folders
rm -rf "$backup_dir/dump-$timestamp"
rm -rf "$audit_log_dir/audit_log-$timestamp"

echo
echo "-------------------------------------------------------------------"
echo "DB backed up to dump-$timestamp.tar.gz and audit_log-$timestamp.tar.gz"


# cd "$base_dir/keycloak"
# sudo docker compose up -d
# cd $script_dir

# Create an sql backup file of the keycloak db
# SYSTEM_PASSWD is set in .env
sudo docker exec -it postgres-database mkdir /temp_backup
sudo docker exec -it postgres-database pg_dump -U bn_keycloak -d bitnami_keycloak -f "/temp_backup/keycloak-$timestamp.sql"
sudo docker cp "postgres-database:/temp_backup/keycloak-$timestamp.sql" "$keycloak_sql_dir"
sudo docker exec -it postgres-database rm -r /temp_backup

# Change ownership for created files
username = $(whoami)
groupid = $(id -g)
sudo chown -R $username:$groupid "$keycloak_sql_dir"

echo "Keycloak DB backed up to keycloak-$timestamp.sql"
echo "-------------------------------------------------------------------"
echo
