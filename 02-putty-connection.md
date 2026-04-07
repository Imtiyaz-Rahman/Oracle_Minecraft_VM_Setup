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
