#${cc}
cc='\033[0m' #no color
r='\033[0;31m' #red
g='\033[0;32m' #green
y='\033[1;33m' #yellow

printf "${g}[+]Installing Requirements${y}";echo;

sudo apt-get update; #installing requirements
sudo apt-get install default-jdk;
sudo apt-get install wget;
sudo apt-get install proxychains;
sudo apt-get install tor;

printf "${g}[+]Setting Up File System${cc}";echo;

cd ~/MineStart/; #setting up file system;
mkdir MC-Servers;
mkdir ngrok;

printf "${g}[+]Installing ngrok${y}";echo;

cd ~/MineStart/ngrok; #installing ngrok
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip;
mv ngrok-stable-linux-amd64.zip ngrok.zip;
unzip ~/MineStart/ngrok/ngrok.zip;
touch ngrok-setup.sh;
chmod 755 ngrok-setup.sh;

printf "${g}[+]Setting Up (.sh) Files${cc}";echo;

cd ~/MineStart/Server-Scrips; #setting up .sh files
chmod 755 install-new-server.sh;
chmod 755 minemc.sh;
cd ~/MineStart/Server-Scrips/other;
chmod 755 file-editor.sh;

printf "${g}[+]Done!${cc}";echo;

cd ~/MineStart/;./MineStart.sh;
