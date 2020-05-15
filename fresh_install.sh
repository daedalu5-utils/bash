#!/bin/bash

# Get firefox
sudo dnf install firefox git

# Install video streaming plugins for the browser
sudo dnf install https://download1.rpmfusion.org/{free/fedora/rpmfusion-free,nonfree/fedora/rpmfusion-nonfree}-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install gstreamer1-libav gstreamer1-plugins-ugly unrar compat-ffmpeg28 ffmpeg-libs

### Setup SSH server
# Check if openssh-server is installed
rpm -qa | grep openssh-server
# Install if necessary
sudo dnf install openssh-server
# Enable daemon so it auto-starts after reboot
sudo systemctl enable sshd
# Start the SSH server
sudo systemctl start sshd
# Check server status
sudo systemctl status sshd
# CHeck that port is open for incoming connections
sudo ss -lt

### Change computer name
# Print old name
hostname
# Change name
new_hostname=helios
sudo sed -i "s/localhost/$new_hostname/g" /etc/hostname
sudo sed -i "s/localhost/$new_hostname/g" /etc/hosts
