CC='\u001b[0m' #Clear Color
BLUE='\u001b[34m'
RED='\u001b[31m'
GREEN='\u001b[32m'

printf "${GREEN}[+]Installing java${CC}";echo; #updating needed software
sudo apt-get install default-jdk;
printf "${GREEN}[+]Installing wget${CC}";echo;
sudo apt-get install wget;
printf "${BLUE}[-]What do you want to name you server?${CC}";echo; #make server dir
read servername;
cd ~/MineStart/MC-Servers/;
mkdir $servername;
cd ~/MineStart/MC-Servers/$servername;
printf "${BLUE}[-]What Type Of Server Do You Want?${CC}";echo; #getting the server jar
printf "${RED}Paper ";
printf "Vanilla ";
printf "Bukkit ";
printf "Spigot ${CC}";echo;
read servertype;
case $servertype in
	Paper | paper) echo "Paper"
		wget https://papermc.io/api/v1/paper/1.16.4/267/download ;;
	Vanilla | vanilla) echo "Vanilla"
		wget https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar ;;
	Bukkit | bukkit) echo "Bukkit"
		wget https://cdn.getbukkit.org/craftbukkit/craftbukkit-1.16.4.jar ;;
	Spigot | spigot)
		wget https://cdn.getbukkit.org/spigot/spigot-1.16.4.jar ;;
	*) echo
		printf "${RED}[-]Ivalid option${CC}";echo; ;;
esac
mv download server.jar; #rename server jar
mv craftbukkit-1.16.4.jar server.jar;
mv spigot-1.16.4.jar server.jar;
printf "${GREEN}[+]Done Installing!${CC}";echo; #getting the needed files
printf "${BLUE}[-]How Much Ram Do You Want To Give Your Minecraft Server?${CC}";echo;
read ram;
echo java -Xmx"$ram"M -Xms"$ram"M -jar server.jar nogui > Start.sh;
chmod 755 Start.sh;
./Start.sh;
printf "${GREEN}[+]Do You Want To Edit The Flies?${RED}(y/n)${CC}";echo; #file edit
read chfiles;
case $chfiles in
	Y | y) echo
		cd ~/MineStart/Server-Scrips/other;./file-editor.sh ;;
	N | n) echo
		printf "${GREEN}[+]Done!${CC}";echo ;;
	*) echo
		printf "${RED}[-]Ivalid option${CC}";echo ;;
esac
