# Oracle VM Minecraft Server Documentation

Complete guide for setting up a Minecraft server on Oracle Cloud.

## Quick Start

Follow these guides in order:

1. **[01-oracle-vm-creation.md](01-oracle-vm-creation.md)**
   - Create Oracle Cloud VM instance
   - Configure networking and security
   - Set up public IP

2. **[02-putty-connection.md](02-putty-connection.md)**
   - Install PuTTY and PuTTYgen
   - Convert SSH keys
   - Connect to VM via SSH
   - Set up FileZilla

3. **[orcale_vm_setup.md](orcale_vm_setup.md)**
   - Run automated setup script
   - Upload mod pack
   - Install Minecraft server

4. **[03-server-management.md](03-server-management.md)**
   - Manage tmux sessions
   - Switch Java versions
   - Server operations

## Prerequisites

- Oracle Cloud account
- PuTTY (Windows) or SSH client
- FileZilla
- Minecraft server pack from CurseForge

## Support Files

- `oracle_image_v9_run.sh` - Automated setup script

## Notes

- Free tier: 4 OCPU, 24 GB RAM (Ampere)
- Default port: 25565 (TCP/UDP)
- Default user: `opc`
