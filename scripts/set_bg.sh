#!/bin/bash

directory="$HOME/.config/backgrounds/"
# Check if the directory exists
if [ ! -d "$directory" ]; then
	echo "Directory ($directory) does not exist."
	exit 1
fi

# List all .png files in the directory
png_files=$(find "$directory" -type f -name "*.png" -exec basename {} \;)

# Check if there are any png files
if [ -z "$png_files" ]; then
	echo "No .png files found in $directory"
	exit 1
fi

# Display list of png files
echo "Available .png files:"
count=1
while IFS= read -r line; do
    echo "$count. $line"
    ((count++))
done <<< "$png_files"
echo ""

# Ask the user to choose the file
read -p "Enter the number you want for your i3 background: " choice


# Validate user input
if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
	echo "Invalid input. please enter a number"
	exit 1
fi

# Check if the choice is within the valid range
num_files=$(echo "$png_files" | wc -l)
if [ "$choice" -lt 1 ] || [ "$choice" -gt "$num_files" ]; then
	echo "Invalid choice. Please enter a number between 1 and $num_files."
	exit 1
fi

# Get the selected png file
selected_file=$(echo "$png_files" | sed "${choice}q;d")

ln -sf "$directory/$selected_file" "$directory/bg.png"

echo "Symlink created successfully: bg.png -> $selected_file"

# Ask the user to choose the file
read -p "Enter the number you want for your terminal background: " choice


# Validate user input
if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
	echo "Invalid input. please enter a number"
	exit 1
fi

# Check if the choice is within the valid range
num_files=$(echo "$png_files" | wc -l)
if [ "$choice" -lt 1 ] || [ "$choice" -gt "$num_files" ]; then
	echo "Invalid choice. Please enter a number between 1 and $num_files."
	exit 1
fi

# Get the selected png file
selected_file=$(echo "$png_files" | sed "${choice}q;d")

ln -sf "$directory/$selected_file" "$directory/termbg.png"

echo "Symlink created successfully: termbg.png -> $selected_file"

