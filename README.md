# Plesk Panel Shared IP Update Script

# Description

This script automates the process of updating the shared IP address in the Plesk Panel. It ensures that the panel always reflects the current shared IP address, preventing DNS and connection errors caused by outdated configurations. It also triggers a reread of IP settings to ensure consistency across the system.

# Features

-Automatically updates the shared IP in Plesk.

-Avoids connection issues caused by mismatched IP configurations.

-Rereads the configuration to ensure proper syncing.

# Prerequisites

-A server running Plesk Panel.

-Access to the server as the root user.

# Installation and Usage

1. Edit the Script

Open the script using a text editor such as nano and replace YOUR_SERVER_LOCAL_IP with your server's local IP address (the one used in the Plesk Panel):
```

nano plesk-shared-ip-template.sh

```
Replace: 192.168.1.1 "192.168.X.X"  Replace with your server's IP

Save and exit the editor.

2. Add the Script to Cron

Run the following command to edit the root user's crontab:
```

sudo crontab -e

```
Add the following line to schedule the script to run at your desired interval (e.g., every hour):

```
# */5 * * * * /bin/bash /path/to/plesk-shared-ip-script/plesk-shared-ip-template.sh >> /path/to/plesk-shared-ip-script/log/plesk-ip-update.log 2>&1
```
Replace /path/to/plesk-shared-ip-script/plesk-shared-ip-template.sh with the full path to your script.

Save and exit the crontab editor.


# Notes

Ensure the script has the appropriate permissions:
```

chmod +x plesk-shared-ip-template.sh

```

# Additionaly

If upon running the script, another issue arose: the script required root permissions to execute successfully. To resolve this, passwordless sudo permissions were granted to the user responsible for managing the Plesk panel. This was done using the sudo visudo command, adding the following line: ```yourusername ALL=(ALL) NOPASSWD: /path/to/your/plesk-shared-ip-template.sh```

The script should be placed in a secure location accessible to the root user.

# License

This project is licensed under the MIT License. See the LICENSE file for details.

# Acknowledgments

This script was created to simplify the management of shared IP updates in the Plesk Panel and ensure seamless operation of DNS and hosting services.
