#!/bin/bash

# Script to set up dynamic management of the $target variable

# Create the file to persist the target
TARGET_FILE="$HOME/.targetrc"
if [ ! -f "$TARGET_FILE" ]; then
  touch "$TARGET_FILE"
  echo "# File to store the current target" > "$TARGET_FILE"
  echo "export target=''" >> "$TARGET_FILE"
  echo "Configuration file $TARGET_FILE created."
fi

# Add auto-load to .bashrc or .zshrc
SHELL_CONFIG=""
if [ -f "$HOME/.bashrc" ]; then
  SHELL_CONFIG="$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
  SHELL_CONFIG="$HOME/.zshrc"
else
  echo "No .bashrc or .zshrc found. Please configure manually."
  exit 1
fi

if ! grep -q "source $TARGET_FILE" "$SHELL_CONFIG"; then
  echo "source $TARGET_FILE" >> "$SHELL_CONFIG"
  echo "Configuration added to $SHELL_CONFIG."
else
  echo "Configuration already present in $SHELL_CONFIG."
fi

# Create the settarget command
SETTARGET_SCRIPT="/usr/local/bin/settarget"
cat << 'EOF' | sudo tee "$SETTARGET_SCRIPT" > /dev/null
#!/bin/bash
TARGET_FILE="$HOME/.targetrc"
if [ -z "$1" ]; then
  echo "Usage: settarget <IP>"
  exit 1
fi
echo "export target=$1" > "$TARGET_FILE"
echo "Target updated to: $1"
source "$TARGET_FILE"
EOF

# Grant execution permissions to the script
sudo chmod +x "$SETTARGET_SCRIPT"
echo "The 'settarget' command has been installed in /usr/local/bin."

echo "Setup complete. Open a new terminal to use the \$target variable."
