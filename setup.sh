#!/bin/bash

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Check if the repository directory already exists
REPO_DIR="android-connect"

if [ -d "$REPO_DIR" ]; then
    echo "Repository already cloned. Proceeding with installation..."
else
    # Clone the repository
    git clone https://github.com/yourusername/android-connect.git
fi

# Move the script to /usr/local/bin
mv ${REPO_DIR}/android_connect.sh /usr/local/bin/android_connect

# Make the script executable
chmod +x /usr/local/bin/android_connect

# Clean up if the repository was cloned by this script
if [ ! -d "$REPO_DIR" ]; then
    echo "Installation complete. You can now run the script using the command 'android_connect'."
else
    # Clean up the repository directory
    rm -rf ${REPO_DIR}
    echo "Installation complete. Repository directory cleaned up. You can now run the script using the command 'android_connect'."
fi

