# Dynamic Target Variable Setup Script

This repository contains a script to dynamically manage a `$target` variable in your Kali Linux or similar environments. It ensures the `$target` variable is persistent across terminal sessions and easily configurable for pentesting tasks.

## Features
- Automatically loads the `$target` variable in new terminal sessions.
- Includes a simple `settarget` command to dynamically set the target.
- Compatible with `bash` and `zsh` shells.
- Easy setup script included.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/nicolasdamians/settarget
   cd settarget
   ```

2. Run the setup script:
   ```bash
   chmod +x set_target_variable.sh
   ./set_target_variable.sh
   ```

## Usage

- Set a new target IP address:
  ```bash
  settarget 192.168.1.100
  ```
  This sets the `$target` variable to the specified IP address and makes it available in all new terminal sessions.

- Check the current target:
  ```bash
  echo $target
  ```

## Notes
- The setup script creates a `~/.targetrc` file to store the current `$target` value and ensures it's loaded automatically in each terminal session.
- The `settarget` script is installed in `/usr/local/bin` for global access.

## Uninstallation

1. Remove the `~/.targetrc` file:
   ```bash
   rm ~/.targetrc
   ```

2. Remove the `settarget` script:
   ```bash
   sudo rm /usr/local/bin/settarget
   ```

3. Optionally, remove the lines sourcing `~/.targetrc` from your `~/.bashrc` or `~/.zshrc`.

## License
This project is licensed under the MIT License.

## Author
This script was created to simplify pentesting workflows by dynamically managing target IPs in Linux environments.

