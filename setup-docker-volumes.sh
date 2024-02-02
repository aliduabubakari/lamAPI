#!/bin/bash

# Define all directories to be created
dirs=(
  "./api"
  "./mongo-data"
  "./certs"
  "./esdata01"
  "./esdata02"
  "./esdata03"
  "./kibanadata"
)

# Loop through the directories and create them if they don't exist
for dir in "${dirs[@]}"; do
  if [ ! -d "$dir" ]; then
    echo "Creating directory: $dir"
    mkdir -p "$dir"
  else
    echo "Directory already exists: $dir"
  fi
done

# Set permissions - adjust the UID:GID according to your needs
# Use `id -u` and `id -g` to find out your current user's UID and GID
uid=$(id -u)
gid=$(id -g)

echo "Setting permissions with UID:GID = $uid:$gid"
for dir in "${dirs[@]}"; do
  # Change ownership to the current user
  # Use `sudo` if necessary, depending on your directory permissions
  chown -R $uid:$gid "$dir"
done

echo "Setup complete."
