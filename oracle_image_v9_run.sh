# How to automate orcale vm minecraft setup

Won't automate the entire process,
But will help to reduce doing manual tasks

First Download:
[FileZilla](https://filezilla-project.org/) a file managment solution that will allow you to transfer your mod pack fiels to your vm

Install using the downlaod client
or (Linux)
sudo apt install filezilla

Now connect to your terminal system using the <insert file>.txt

Now run the following command

shell
```
wget <github url for the file>
./orcale_image_v9_run.sh
```

The `oracle_image_v9_run.sh` will
1. install the Java version && a file to change it
2. install tmux (used to detach terminal)
3. setup firewall system
4. folder setup
5. set file permissions


This is the inital step to setup the system

Once done connect to FileZilla as seen from the echo command
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

shell
```
./server_setup.sh
```
The `server_setup.sh` will
1. set ram usage value for the server (change if needed)
2. set the eula file to true
3. run the server installer shell script
