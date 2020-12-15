cc='\033[0m' #No Color
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
yellow='\033[1;33m'
brown='\033[0;33'

clear #makes a clean slate

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
echo "Version 1.3.0!";
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
		printf "${g}[+]Installing Requirements${y}";echo;

	sudo apt-get update; #installing requirements
	sudo apt-get install default-jdk;
	sudo apt-get install wget;
	sudo apt-get install proxychains;
	sudo apt-get install tor;

	printf "${g}[+]Setting Up File System${cc}";echo;

	cd ~/MineStart/; #setting up file system;
	mkdir MC-Servers;

	printf "${g}[+]Installing ngrok${y}";echo;

	cd ~/MineStart/ngrok; #installing ngrok
	wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip;
	mv ngrok-stable-linux-amd64.zip ngrok.zip;
	unzip ~/MineStart/ngrok/ngrok.zip;

	printf "${g}[+]Setting Up (.sh) Files${cc}";echo;

	cd ~/MineStart/Server-Scrips; #setting up .sh files
	chmod 755 install-new-server.sh;
	chmod 755 minemc.sh;
	cd ~/MineStart/Server-Scrips/other;
	chmod 755 file-editor.sh;
	cd ~/MineStart/ngrok;
	chmod 755 ngrok-setup.sh

	printf "${g}[+]Done!${cc}";echo;
	cd -
	./MineStart.sh ;;
		
		1) echo
			printf "\u001b[34mINSTALLING/UPDATING JAVA\u001b[0m";echo;
			sudo apt-get install default-jdk;
			cd ~/MineStart/MC-Servers;
			printf "\u001b[34mWhat Was The Name Of Your Server?\u001b[0m";echo;
			ls;
			read chname;
			cd ~/MineStart/MC-Servers/$chname;
			chmod 755 Start.sh
			printf "\u001b[34mWaiting For Jar File To Load...\u001b[0m";echo;
			./Start.sh 
			cd -
			./MineStart.sh ;;
				
				2) echo
					printf "${green}[+]Installing java${cc}";echo; #updating needed software
					sudo apt-get install default-jdk;
					printf "${green}[+]Installing wget${cc}";echo;
					sudo apt-get install wget;
					printf "${blue}[-]What do you want to name you server?${cc}";echo; #make server dir
					read servername;
					cd ~/MineStart/MC-Servers/;
					mkdir $servername;
					cd ~/MineStart/MC-Servers/$servername;
					printf "${blue}[-]What Type Of Server Do You Want?${cc}";echo; #getting the server jar
					printf "${red}Paper ";
					printf "Vanilla ";
					printf "Bukkit ";
					printf "Spigot ${cc}";echo;
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
					printf "${green}[+]Done Installing!${cc}";echo; #getting the needed files
					printf "${blue}[-]How Much Ram Do You Want To Give Your Minecraft Server?${cc}";echo;
					read ram;
					echo java -Xmx"$ram"M -Xms"$ram"M -jar server.jar nogui > Start.sh;
					chmod 755 Start.sh;
					./Start.sh;
					printf "${green}[+]Do You Want To Edit The Flies?${red}(y/n)${cc}";echo; #file edit
					read chfiles;
					case $chfiles in
						Y | y) echo
							cd ~/MineStart/Server-Scrips/other;./file-editor.sh ;;
						N | n) echo
							printf "${green}[+]Done!${cc}";echo ;;
						*) echo
							printf "${red}[-]Ivalid option${cc}";echo ;;
					esac
					cd -
					./MineStart.sh ;;
						
						3) echo
								cd ~/MineStart/MC-Servers
						printf "\u001b[34mWhat Server Do You Want To Edit?\u001b[0m";echo;
						ls;
						read MCfile;
						cd ~/MineStart/MC-Servers/$MCfile;
						printf "\u001b[34mWhich File Do You Want To Edit?\u001b[0m";echo;
						ls;
						read filename;
						nano $filename;
						printf "\u001b[34mIs That It?\u001b[0m(y/n)";echo;
						read next;
						case $next in
							Y | y) echo
								cd ~/MineStart/Server-Scrips;./minemc.sh ;;
							N | n) echo
								echo "Ok";cd ~/MineStart/Server-Scrips/other;./file-editor.sh ;;
							*) echo
								echo "I'm Not Sure What You Mean"
						esac
						cd -
						./MineStart.sh ;;
	4) echo
		cd ngrok/;proxychains ./ngrok tcp 25565;
		cd -
		./MineStart ;;
	5) echo
		cd ngrok/;./ngrok-setup.sh;
		cd -
		./MineStart.sh ;;
	x) echo
		printf "${yellow}[-]Exiting${cc}";echo; 
		cd -
		./MineStart.sh ;;
	*)
		printf "${red}[-]WRONG ANSWER${cc}";echo;./MineStart.sh;
		cd -
		./MineStart.sh ;;
esac
