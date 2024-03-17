#!/bin/bash

# 1. Check if Maven is already installed
if [[ $(mvn --version 2>&1) =~ "Apache Maven 3.6.3" ]]; then
  echo "Maven 3.6.3 is already installed."
else
  echo "Maven 3.6.3 is not installed. Please install it first."
  exit 1
fi

# 2. Set the M2_HOME environment variable (assuming /usr/share/maven)
export M2_HOME=/usr/share/maven

# 3. Add Maven's bin directory to the PATH (optional)
# Maven's bin directory might already be in your PATH by default during installation.
# Uncomment the following line if you want to explicitly add it.
# export PATH=$M2_HOME/bin:$PATH

# 4. Make the changes persistent (optional)
# Choose one of the following options:

# Option 1: Add to /etc/environment (for system-wide)
# sudo echo "M2_HOME=$M2_HOME" >> /etc/environment

# Option 2: Add to ~/.bashrc or ~/.zshrc (for current user)
echo "M2_HOME=$M2_HOME" >> ~/.bashrc  # Or ~/.zshrc

# 5. Reactivate shell session or source the script to apply changes
source ~/.bashrc  # Or ~/.zshrc

echo "M2_HOME is set to $M2_HOME"

# Commenting out PATH update as it might be unnecessary
# echo "PATH has been updated with $M2_HOME/bin"
