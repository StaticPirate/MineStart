cd ~/MineStart/Server-Scrips
chmod 755 minemc.sh
cd ~/MineStart
mkdir MC-Servers
sudo apt-get install default-jdk
sudo apt-get install wget
printf "\u001b[34mWhat do you want to name you server?\u001b[0m";echo;
read servername;
cd ~/MineStart/MC-Servers/;
mkdir $servername;
cd ~/MineStart/MC-Servers/$servername;
printf "\u001b[34mWhat Type Of Server Do You Want?\u001b[0m";echo;
printf "\u001b[31mPaper \u001b[0m";
printf "\u001b[31mVanilla \u001b[0m";
printf "\u001b[31mBukkit \u001b[0m";
printf "\u001b[31mSpigot \u001b[0m";echo;
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
		echo "Ivalid option" ;;
esac
mv download server.jar
mv craftbukkit-1.16.4.jar server.jar
mv spigot-1.16.4.jar server.jar
printf "\u001b[32mDone Installing!\u001b[0m";echo;
printf "\u001b[34mHow Much Ram Do You Want To Give Your Minecraft Server? ONLY TYPE NUMBERS\u001b[0m";echo;
read ram;
echo java -Xmx"$ram"M -Xms"$ram"M -jar server.jar nogui > Start.sh
chmod 755 Start.sh
./Start.sh
printf "\u001b[34mDo You Want To Edit The Flies?\u001b[0m(y/n)";echo;
read chfiles;
case $chfiles in
	Y | y) echo
		cd ~/MineStart/Server-Scrips/other;./file-editor.sh ;;
	N | n) echo
		echo "Ok" ;;
	*) echo
		echo "Ivalid option" ;;
esac
