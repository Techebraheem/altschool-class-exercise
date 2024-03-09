
#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Assign source and destination directories
source_dir="$1"
destination_dir="$2"

# Check if source directory exists
if [ ! -d "$source_dir" ]; then
    echo "Error: Source directory '$source_dir' not found"
    exit 1
fi

# Check if destination directory exists, create if not
if [ ! -d "$destination_dir" ]; then
    echo "Destination directory '$destination_dir' not found, creating it..."
    mkdir -p "$destination_dir"
fi

# Generate timestamp
timestamp=$(date +"%Y%m%d%H%M%S")

# Create backup filename with timestamp
backup_filename="backup_$timestamp.tar.gz"

# Create tar archive of source directory and save it to destination directory
tar -czf "$destination_dir/$backup_filename" -C "$source_dir" .

echo "Backup created successfully: $destination_dir/$backup_filename"

