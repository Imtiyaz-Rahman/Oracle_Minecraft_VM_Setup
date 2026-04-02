#!/bin/bash

echo "checking if you are running sudo"
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo ./oracle_image_v9_run.sh)"
  exit 1
fi

echo "Commands will only work if"
echo "you are using the oracle linux image" && sleep 2

echo "You will also  need a java version for minecraft"
echo -e "Java 21 = Minecraft 1.20.5 or greater \n Java 17 = Minecraft 1.18 - 1.20.4\n Java 16 = Minecraft 1.17\n Java 8 = Minecraft 1.16.5 or less" > Java_versions.txt && sleep 4

echo "installing Java 21"
yum install jdk-21-headless.aarch64 -y

echo "installing tmux"
yum install tmux -y

echo "Enable firewall system and allow ports"
echo "To connect to the minecraft server"
firewall-cmd --permanent --zone=public --add-port=25565/tcp
firewall-cmd --permanent --zone=public --add-port=25565/udp
firewall-cmd --reload

echo "Making server folder"
mkdir -p /home/opc/minecraft-server
cd /home/opc/minecraft-server

echo "Setting up permission for filezilla to work"
chown -R opc:opc /home/opc/minecraft-server
chmod -R 755 /home/opc/minecraft-server

echo "You should be set up for filezilla"
echo "FileZilla Setup:
1. File → Site Manager → New Site 
2. Protocol: SFTP
3. Host: (your VM public IP), Port: 22
4. Logon Type: Key file
5. User: opc
6. Browse to your saved .ppk file
7. Click Connect" && sleep 10

echo "Do the FileZilla setup and add the mod pack"
echo "Or the custom mod pack"
echo "But you will need a start.sh in your mod pack or install.sh or run.sh" && sleep 10

echo "A new file will be created to run the setup"
echo "run server_setup.sh if you have uploaded to filezilla"

cat <<'EOF' > /home/opc/minecraft-server/server_setup.sh
#!/bin/bash
set -e

echo "Changing server RAM usage"
RAMVALUE="-Xmx10G"

cd /home/opc/minecraft-server

if [ -f user_jvm_args.txt ]; then
  echo "$RAMVALUE" > user_jvm_args.txt
elif [ -f variables.txt ]; then
  echo "$RAMVALUE" > variables.txt
fi

echo "Accepting EULA"
echo "eula=true" > eula.txt

echo "Running server"
if [ -x start.sh ]; then
  ./start.sh
elif [ -x install.sh ]; then
  ./install.sh
elif [ -x run.sh ]; then
  ./run.sh
else
  echo "No start/install/run script found"
fi
EOF

chmod +x /home/opc/minecraft-server/server_setup.sh
chown opc:opc /home/opc/minecraft-server/server_setup.sh