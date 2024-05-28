#!/bin/bash

# Save the current directory
initial_dir=$(pwd)

# Default values
default_ip="192.168.29.137"
default_port="5555"

# Check if android_connect.yml file exists
if [ -f "android-connect.yml" ]; then
    # Read values from the YAML file
    device_ip=$(yq e '.device_ip' android_connect.yml)
    device_port=$(yq e '.device_port' android_connect.yml)

    # Use default values if YAML file does not specify them
    device_ip=${device_ip:-$default_ip}
    device_port=${device_port:-$default_port}
else
    # Prompt for device IP and port if YAML file is not found
    read -p "Enter device IP (default $default_ip): " device_ip
    device_ip=${device_ip:-$default_ip}

    read -p "Enter device port (default $default_port): " device_port
    device_port=${device_port:-$default_port}
fi

# Navigate to the platform-tools directory
cd ~/Android/Sdk/platform-tools || exit
# If the above command fails, exit the script

# Connect to the Android device
adb connect "$device_ip:$device_port"
adb tcpip 5555
adb disconnect
adb connect "$device_ip:5555"

# Return to the initial directory
cd "$initial_dir"

# Run scrcpy to mirror the Android device
scrcpy


