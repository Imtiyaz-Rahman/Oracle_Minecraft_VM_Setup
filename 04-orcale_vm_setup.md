# Minecraft Server Setup

## Step 1: Run Setup Script

```bash
wget https://github.com/Imtiyaz-Rahman/Oracle_Minecraft_VM_Setup/blob/main/oracle_image_v9_run.sh
chmod +x oracle_image_v9_run.sh
./oracle_image_v9_run.sh
```

## Step 2: Upload Mod Pack

1. Connect via FileZilla
2. Navigate to: `opc/minecraft-server`
3. Upload server pack from CurseForge

or

1. SCP to server
2. Upload the content to via [02-putty-connection](./02-putty-connection.md#alternative--to-filezilla)
3. Unzip and run in the server

## Step 3: Install Server

```bash
./server_setup.sh
```
