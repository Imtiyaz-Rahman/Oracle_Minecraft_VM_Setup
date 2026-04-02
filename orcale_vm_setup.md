# Oracle Linux Minecraft Server Setup Guide

This guide explains how to properly run the setup script, upload your server files using FileZilla, and start the Minecraft server using the generated helper script.

---

## 1. Running the Initial Setup Script

The main installer script prepares your system by:

- Installing Java and tmux  
- Opening required firewall ports  
- Creating the Minecraft server directory  
- Generating a helper script (`server_setup.sh`)  

### Steps

1. Get the script:
  ```bash
  wget https://github.com/Imtiyaz-Rahman/Oracle_Minecraft_VM_Setup/blob/main/oracle_image_v9_run.sh
  ```

2. Ensure the script is executable:
   ```bash
   chmod +x oracle_image_v9_run.sh
  ```

3. Run the script:
  ```bash
  ./oracle_image_v9_run.sh
  ```

## 2. Upload Mod Pack in FileZilla

You will need to have a mod pack with install shell scripts or other to run the server

Just to reiterate here are the steps:
1. File → Site Manager → New Site
2. Protocol: SFTP
3. Host: (your VM public IP), Port: 22
4. Logon Type: Key file
5. User: opc
6. Browse to your saved .ppk file
7. Click Connect

Navigate to: opc → minecraft-server
1. Download Minecraft server pack from CurseForge or other
2. Upload to `minecraft-server` via FileZilla

Once that is done you can run the server_setup.sh

## 3. Run final server install

The last setup script prepares your system by:

- set ram usage value for the server (change if needed)
- set the eula file to true
- run the server installer shell script

Congrats you should be done
