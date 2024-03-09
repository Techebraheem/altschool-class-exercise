#!/bin/bash

# Default value for the number of entries
num_entries=8

# Parse command line arguments
while getopts ":dn:" opt; do
    case ${opt} in
        d )
            list_all=true
            ;;
        n )
            num_entries=$OPTARG
            ;;
        \? )
            echo "Invalid option: $OPTARG" 1>&2
            exit 1
            ;;
        : )
            echo "Invalid option: $OPTARG requires an argument" 1>&2
            exit 1
            ;;
    esac
done
shift $((OPTIND -1))

# Check if the user provided a directory argument
if [ -z "$1" ]; then
    echo "Usage: $0 [-d] [-n <num_entries>] <directory>"
    exit 1
fi

# Directory to check
directory=$1

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' not found"
    exit 1
fi

# Determine the type of output
if [ "$list_all" = true ]; then
    du_output=$(du -ah "$directory")
else
    du_output=$(du -h --max-depth=1 "$directory")
fi

# Sort the output by disk usage and get the top N entries
sorted_output=$(echo "$du_output" | sort -rh | head -n "$num_entries")

# Print the sorted output
echo "$sorted_output"

