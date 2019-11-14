#!/bin/bash

# Update your existing list of packages
sudo apt update

# Upgrade all packages, remove any if required
sudo apt full-upgrade -y

# Prompt for reboot
echo 'Reboot suggested.'
