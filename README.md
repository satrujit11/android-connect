# Android Connect Script

This script connects to an Android device via ADB (Android Debug Bridge) and then mirrors the device screen using `scrcpy`. It allows the user to specify the device IP and port through an `android-connect.yml` file or via user input.

## Prerequisites

Ensure that the following dependencies are installed on your system:

-   `adb`
-   `scrcpy`
-   `yq` (for parsing YAML files)

You can install these dependencies using the package manager of your choice. For example, on Debian-based systems:

```bash
sudo apt-get update
sudo apt-get install adb scrcpy yq
```

## Installation

### Automatical installation

1. Clone the repository using the following command:

```bash
git clone https://github.com/satrujit11/android-connect.git
```

2. Move to the cloned directory:

```bash
cd android-connect
```

3. Run the script using the following command:

```bash
./setup.sh
```

### Manual installation

1. Clone the repository using the following command:

```bash
git clone https://github.com/satrujit11/android-connect.git
```

2. Move the script to /usr/local/bin:

```bash
sudo mv android-connect/android-connect.sh /usr/local/bin/android_connect
```

3. Make the script executable:

```bash
sudo chmod +x /usr/local/bin/android_connect
```

4. Run the script using the following command:

```bash
android_connect
```

## Usage

### Specifying Device IP and Port

If `android_connect.yml` is present in the current directory, the script will read the IP and port from this file. If the values are not specified in the file, it will use default values (`192.168.29.137` for IP and `5555` for port).

If `android_connect.yml` is not present, the script will prompt you to enter the device IP and port. You can press Enter to use the default values.

#### Example `android_connect.yml`

```yaml
device_ip: 192.168.1.10
device_port: 5555
```

## Script Workflow

1. **Save the current directory**: The script saves the directory where it was initially run.

2. **Check for configuration file**: It checks if `android_connect.yml` exists and reads the device IP and port from it.

3. **Prompt for input**: If the configuration file does not exist, it prompts the user to enter the device IP and port.

4. **Navigate to platform-tools directory**: Changes the directory to `~/Android/Sdk/platform-tools`.

5. **Connect to the Android device**:

    - Connects to the device using the specified IP and port.
    - Sets the device to use TCPIP mode on port `5555`.
    - Reconnects to the device.

6. **Return to the initial directory**: Changes back to the original directory.

7. **Run scrcpy**: Mirrors the Android device screen using `scrcpy`.

## Troubleshooting

-   **Ensure ADB is configured correctly**: Make sure `adb` is installed and added to your system PATH.

-   **Check device connection**: Ensure your Android device is on the same network and the IP address is correct.

-   **Verify dependencies**: Make sure all dependencies (`adb`, `scrcpy`, `yq`) are installed and up to date.

## License

This script is licensed under the MIT License. Feel free to use and modify it as per your needs.
