cd ~/MineStart/Server-Scrips
chmod 755 minemc.sh
cd ~/MineStart
mkdir MC-Servers
sudo apt-get install default-jdk
printf "\u001b[34mWhat do you want to name you server?\u001b[0m";echo;
read servername;
cd ~/MineStart/MC-Servers/;
mkdir $servername;
cd ~/MineStart/MC-Servers/$servername;
wget https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar;
printf "\u001b[32mDone Installing!\u001b[0m";echo;
printf "\u001b[34mHow Much Ram Do You Want To Give Your Minecraft Server? ONLY TYPE NUMBERS\u001b[0m";echo;
read ram;
echo java -Xmx"$ram"M -Xms"$ram"M -jar server.jar nogui > Start.sh
chmod 755 Start.sh
printf "\u001b[32mAll Done Do You Want To Start Your Server?\u001b[0m(y/n)";echo;
read chstart;
case $chstart in
	Y | y) echo
	        cd ~/MineStart/Server-Scrips;./minemc.sh ;;
	N | n) echo
		echo "Oh, ok!" ;;
	*) echo
		echo "Wrong Letter!" ;;
esac
