# PuTTY Connection

## Install PuTTY

```bash
sudo apt install putty putty-tools
```

## Convert SSH Key

```bash
puttygen <private>.key -o <name>.ppk
```

## Connect via PuTTY

1. Open PuTTY
2. Session → Host Name: `opc@<your-public-ip>` eg: `opc@12.345.678.90`
3. Connection → SSH → Auth → Credentials → Browse to `.ppk` file
4. Click Open

## FileZilla Setup

1. File → Site Manager → New Site
2. Settings:
   - Protocol: SFTP
   - Host: `<your-public-ip>`
   - Port: 22
   - Logon Type: Key file
   - User: `opc`
   - Key file: `.ppk` file
3. Connect

Upload files to: `opc/minecraft-server`

## Alternative !! To FileZilla

1. [SCP File Transfer](https://linuxize.com/post/how-to-use-scp-command-to-securely-transfer-files/)
2. Go to your Powershell/Terminal/Other:
    - Type:`scp`
    - Press: Enter
    - You should have a list of commands and info about *SCP*
3. Zip *Mods* and *Server Folder* into one combined Folder
    - Place: The folder on your desktop
4. Type `scp` in your Powershell/Terminal/Other:
    - Type: scp
    - step: you will need to navigate and type to your desktop *folder*
    - Press: Tab key and navigate to Folder
    - Example: `scp *presses tab* /desktop/minecraft.Zip`
5. Using the private key to connect to the VM(Virtual Machine)
    - Type: -i
    - step: as before navigate to your private key folder-location that you downloaded  
    - Type: Tab key and navigate to Folder
    - Example: `-i /Documents/Key-Folder/Special-Minecraft-Key`
6. Transfer to VM(Virtual Machine)
    - Type: opc@<your-public-ip>:opc/<folder-location> 
    - step: type this out and fill in the values that are in <>
    - fact: you can *not press tab* when transferring to VM on your device
    - Example: `opc@12.345.678.90:opc/minecraft-server`
7. It should look similar: 
    - `scp /desktop/minecraft.zip -i /Documents/Key-Folder/Special-Minecraft-Key opc@12.345.678.90:opc/minecraft-server` 

