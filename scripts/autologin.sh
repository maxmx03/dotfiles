#!/bin/bash

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Prompt for the username
read -p "Enter the username for automatic login: " username

# Check if the username is valid
if ! id -u "$username" > /dev/null 2>&1; then
  echo "Invalid username. Please try again."
  exit 1
fi

sudo mkdir "/etc/systemd/system/getty@tty1.service.d"

# Create the override.conf file
override_file="/etc/systemd/system/getty@tty1.service.d/override.conf"

echo "[Service]" > "$override_file"
echo "ExecStart=" >> "$override_file"
echo "ExecStart=-/usr/bin/agetty --autologin $username --noclear %I $TERM" >> "$override_file"

# Reload systemd configuration
systemctl daemon-reload
systemctl enable getty@tty1.service

echo "Automatic login has been configured for $username on TTY1."
