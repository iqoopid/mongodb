#!/usr/bin/bash

# Set the backup directory and timestamp
PWD=$(pwd)
backup_dir="$PWD/backups/dumps"
audit_log_dir="$PWD/backups/audit_log"
timestamp=$(date +"%Y%m%d%H%M%S")
audit_log="audit_log"


# Define the path to the .env file
cd ..
base_dir=$(pwd)
ENV_FILE="$base_dir/.env"
cd $PWD

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

# Backup MongoDB data to a dump folder with the current timestamp
# docker exec keycloak-keycloak-1 mongodump --username=user --password=password --authenticationDatabase=admin --db="$database_name" --excludeCollection "$audit_log" --out "/dump-$timestamp"
mongodump --username=user --password=password --authenticationDatabase=admin --db="$database_name" --excludeCollection "$audit_log" --out "$backup_dir/dump-$timestamp"
# docker exec keycloak-keycloak-1 mongodump --username=user --password=password --authenticationDatabase=admin --db="$database_name" --collection "$audit_log" --out "/audit_log-$timestamp"
mongodump --username=user --password=password --authenticationDatabase=admin --db="$database_name" --collection "$audit_log" --out "$audit_log_dir/audit_log-$timestamp"

# Create a tarball of the dump folder
# docker exec keycloak-keycloak-1 tar -czvf "/dump-$timestamp.tar.gz" "/dump-$timestamp"
tar -czvf "$backup_dir/dump-$timestamp.tar.gz" "$backup_dir/dump-$timestamp"
# docker exec keycloak-keycloak-1 tar -czvf "/audit_log-$timestamp.tar.gz" "/audit_log-$timestamp"
tar -czvf "$audit_log_dir/audit_log-$timestamp.tar.gz" "$audit_log_dir/audit_log-$timestamp"

# Copy the file from container to host system
# docker cp keycloak-keycloak-1:"/dump-$timestamp.tar.gz" "$backup_dir/dump-$timestamp.tar.gz"
# docker cp keycloak-keycloak-1:"/audit_log-$timestamp.tar.gz" "$audit_log_dir/audit_log-$timestamp.tar.gz"

# Remove the dump folders
rm -rf "$backup_dir/dump-$timestamp"
rm -rf "$audit_log_dir/audit_log-$timestamp"

echo
echo "-------------------------------------------------------------------"
echo "DB backed up to dump-$timestamp.tar.gz and audit_log-$timestamp.tar.gz"
