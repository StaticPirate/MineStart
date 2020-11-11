printf "\u001b[34mINSTALLING/UPDATING JAVA\u001b[0m";echo;
sudo apt-get install default-jdk;
cd ~/MineStart/MC-Servers;
printf "\u001b[34mWhat Was The Name Of Your Server?\u001b[0m";echo;
ls;
read chname;
cd ~/MineStart/MC-Servers/$chname;
printf "\u001b[34mHow Much Ram Do You Want To Give Your Minecraft Server? IN Mb";echo;
read ram;
echo java -Xmx"$ram"M -Xms"$ram"M -jar server.jar nogui > Start.sh
chmod 755 Start.sh
printf "\u001b[34mWaiting For Jar File To Load...\u001b[0m";echo;
./Start.sh
