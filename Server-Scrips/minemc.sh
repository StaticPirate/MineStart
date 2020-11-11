printf "\u001b[34mINSTALLING/UPDATING JAVA\u001b[0m";echo;
sudo apt-get install default-jdk;
cd ~/MineStart/MC-Servers;
ls;
printf "\u001b[34mWhat Was The Name Of Your Server?\u001b[0m";echo;
read chname;
cd ~/MineStart/MC-Servers/$chname;
echo "How Much Ram Do You Want To Give Your Minecraft Server? ONLY TYPE NUMBERS";
read ram;
echo java -Xmx"$ram"M -Xms"$ram"M -jar server.jar nogui > Start.sh
chmod 755 Start.sh
printf "\u001b[34mWaiting For Jar File To Load...\u001b[0m";echo;
./Start.sh
printf "\u001b[31mHave you agreed to the eula?(y/n)\u001b[0m";echo;read yn;
case $yn in
	Y | y) echo
	        echo "Oh ok, Thank You!" ;;
	N | n) echo
	        cd ~/MineStart/MC-Servers/$chname;nano eula.txt;echo "Now Restarting This Program";cd ~/MineStart/Server-Scrips;./minemc.sh ;;
	*) echo
	        echo "Ivalid Response" ;;
esac
