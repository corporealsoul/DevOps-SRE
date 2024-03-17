#!/bin/bash

# 1. Check for Java 17 installation
if [[ $(java -version 2>&1) =~ "openjdk version \"17.0.1" ]]; then
  echo "Java 17 is already installed."
else
  echo "Java 17 is not installed. Please install it first."
  exit 1
fi

# 2. Determine the correct Java 17 installation path
java_home=$(readlink -f $(which java))
java_home=${java_home%/bin/java}

# 3. Set the JAVA_HOME environment variable
export JAVA_HOME=$java_home

# 4. Add Java 17's bin directory to the PATH
export PATH=$JAVA_HOME/bin:$PATH

# 5. Make the changes persistent (optional)
# Choose one of the following options:

# Option 1: Add to /etc/environment (for system-wide)
# sudo echo "JAVA_HOME=$JAVA_HOME" >> /etc/environment
# sudo echo "PATH=$JAVA_HOME/bin:$PATH" >> /etc/environment

# Option 2: Add to ~/.bashrc or ~/.zshrc (for current user)
echo "JAVA_HOME=$JAVA_HOME" >> ~/.bashrc  # Or ~/.zshrc
echo "PATH=$JAVA_HOME/bin:$PATH" >> ~/.bashrc  # Or ~/.zshrc

# 6. Reactivate shell session or source the script to apply changes
source ~/.bashrc  # Or ~/.zshrc

echo "JAVA_HOME is set to $JAVA_HOME"
echo "PATH has been updated with $JAVA_HOME/bin"
