cc='\033[0m' #No Color
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
yellow='\033[1;33m'
brown='\033[0;33'

cd ~/MineStart/Server-Scrips; #quick setup
chmod 755 setup.sh

printf "
                 ▄▄                                                         
▀████▄     ▄███▀ ██                     ▄█▀▀▀█▄█ ██                    ██   
  ████    ████                         ▄██    ▀█ ██                    ██   
  █ ██   ▄█ ██ ▀███ ▀████████▄   ▄▄█▀██▀███▄   ██████ ▄█▀██▄ ▀███▄█████████ 
  █  ██  █▀ ██   ██   ██    ██  ▄█▀   ██ ▀█████▄ ██  ██   ██   ██▀ ▀▀  ██   
  █  ██▄█▀  ██   ██   ██    ██  ██▀▀▀▀▀▀     ▀██ ██   ▄█████   ██      ██   
  █  ▀██▀   ██   ██   ██    ██  ██▄    ▄█     ██ ██  ██   ██   ██      ██   
▄███▄ ▀▀  ▄████▄████▄████  ████▄ ▀█████▀▀█████▀  ▀████████▀██▄████▄    ▀████
                                                                            
                                                                            
";echo;
echo "Version 2.0!";
echo "Made By StaticPirate";

printf "${green}Choose An Option Below ${red}(ONLY TYPE IN NUMBERS)${cc}";echo; #picking an opition
echo;
printf "${green}"
printf "[0]First Time Set Up";echo;
printf "[1]Start Your Server";echo;
printf "[2]Make A New Server";echo;
printf "[3]Edit Server Files";echo;
printf "[4]Start ngrok";echo;
printf "[5]Set Up ngrok";echo;
printf "[x]Exit${cc}";echo;
read msch;
case $msch in
	0) echo
		cd ~/MineStart/Server-Scrips;./setup.sh; ;;
	1) echo
		cd ~/MineStart/Server-Scrips;./minemc.sh; ;;
	2) echo
		cd ~/MineStart/Server-Scrips;./install-new-server.sh; ;;
	3) echo
		cd ~/MineStart/Server-Scrips/other;./file-editor.sh;  ;;
	4) echo
		cd ~/MineStart/ngrok/;proxychains ./ngrok tcp 25565; ;;
	5) echo
		cd ~/MineStart/ngrok/;./ngrok-setup.sh; ;;
	x) echo
		printf "${yellow}[-]Exiting${cc}";echo; ;;
	*)
		printf "${red}[-]WRONG ANSWER${cc}";echo;cd ~/MineStart;./MineStart.sh; ;;
esac
