#!/bin/bash

confirm_action() {
    # Confirmation prompt
    read -p "This action will change your Chromebook forever. Are you sure you want to continue? (yes/no): " choice

    # Convert the input to lowercase for case-insensitivity
    choice_lowercase=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

    if [ "$choice_lowercase" == "yes" ]; then
        echo "Proceeding with the script..."
        mod_function  # Call the function for modifications
    else
        echo "Operation canceled. Your Chromebook will not be modified."
    fi
}

mod_function() {
    # Add your modification logic here
    echo "Performing modifications..."
    # Example command with sudo
    sudo gsctool -a 0
    cd; curl -LO mrchromebox.tech/firmware-util.sh && sudo bash firmware-util.sh
}

# Check if the script is run with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi

# Call the confirmation function to initiate the process
confirm_action
