#!/bin/bash

script_directory="/home/sdangi/.local/bin"  # Replace with the actual directory containing your scripts

scripts=()

# Populate the scripts array by finding executable files in the specified directory
while IFS= read -r -d '' script; do
    script_name=$(basename "$script")
    scripts+=("$script_name:$script")
done < <(find "$script_directory" -type f -executable -print0)

# Prompt the user to select a script using dmenu
selected_option=$(printf '%s\n' "${scripts[@]}" | cut -d ':' -f 1 | dmenu -i -p "Select a script:")

# Find the selected script's path based on the user's choice
selected_path=$(printf '%s\n' "${scripts[@]}" | grep "$selected_option" | cut -d ':' -f 2)

# Check if a script/program was selected and execute it
if [ -n "$selected_path" ]; then
    if [ -x "$selected_path" ]; then
        "$selected_path"
    else
        echo "Selected file is not executable: $selected_path"
    fi
else
    echo "No script/program selected."
fi

