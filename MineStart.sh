cc='\033[0m' #No Color
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
yellow='\033[1;33m'
brown='\033[0;33'

function file-edit {
cd MC-Servers
printf "\u001b[34mWhat Server Do You Want To Edit?\u001b[0m";echo;
ls;
read MCfile;
cd $MCfile;
printf "\u001b[34mWhich File Do You Want To Edit?\u001b[0m";echo;
ls;
read filename;
nano $filename;
printf "\u001b[34mIs That It?\u001b[0m(y/n)";echo;
read next;
case $next in
	Y | y) echo
		./MineStart.sh ;;
	N | n) echo
		file-edit ;;
	*) echo
		echo "I'm Not Sure What You Mean"
esac
cd ..
cd ..
./MineStart.sh
}

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
echo "Version 1.3.4!";
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
		printf "${green}[+]Installing Requirements${yellow}";echo;

	sudo apt-get update; #installing requirements
	sudo apt-get install default-jdk;
	sudo apt-get install wget;
	sudo apt-get install proxychains;
	sudo apt-get install tor;

	printf "${green}[+]Setting Up File System${cc}";echo;
	
	#setting up file system;
	mkdir MC-Servers;

	printf "${green}[+]Installing ngrok${yellow}";echo;

	cd ngrok; #installing ngrok
	wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip;
	mv ngrok-stable-linux-amd64.zip ngrok.zip;
	unzip ngrok.zip;
	printf "${green}[+]Done!${cc}";echo;
	cd ..
	./MineStart.sh ;;
		
		1) echo
			printf "\u001b[34mINSTALLING/UPDATING JAVA\u001b[0m";echo;
			sudo apt-get install default-jdk;
			cd MC-Servers;
			printf "\u001b[34mWhat Was The Name Of Your Server?\u001b[0m";echo;
			ls;
			read chname;
			cd $chname;
			chmod 755 Start.sh
			printf "\u001b[34mWaiting For Jar File To Load...\u001b[0m";echo;
			./Start.sh 
			cd ..
			cd ..
			./MineStart.sh ;;
				
				2) echo
					printf "${green}[+]Installing java${yellow}";echo; #updating needed software
					sudo apt-get install default-jdk;
					printf "${green}[+]Installing wget${yellow}";echo;
					sudo apt-get install wget;
					printf "${blue}[-]What do you want to name you server?${yellow}";echo -e "${cc}"; #make server dir
					read servername;
					echo -e "${yellow}"
					cd MC-Servers/;
					mkdir $servername;
					echo -e "${cc}"
					cd $servername;
					printf "${blue}[-]What Type Of Server Do You Want?${cc}";echo; #getting the server jar
					printf "${red}Paper ";
					printf "Vanilla ";
					printf "Bukkit ";
					printf "Spigot ${cc}"
					echo
					read servertype;
					echo -e "${yellow}"
					case $servertype in
						Paper | paper) echo "Paper 1.16.5"
								wget https://papermc.io/api/v2/projects/paper/versions/1.16.5/builds/467/downloads/paper-1.16.5-467.jar ;;
						Vanilla | vanilla) echo "Vanilla 1.16.5"
								wget https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar ;;
						Bukkit | bukkit) echo "Bukkit 1.16.4"
								wget https://cdn.getbukkit.org/craftbukkit/craftbukkit-1.16.4.jar ;;
						Spigot | spigot) echo "Spigot 1.16.4"
								wget https://cdn.getbukkit.org/spigot/spigot-1.16.4.jar ;;
						*) echo
								printf "${red}[-]Ivalid option${cc}";echo; ;;
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
					printf "${green}[+]Do You Want To Edit The Flies?${yellow}(y/n)${cc}";echo; #file edit
					read chfiles;
					case $chfiles in
						Y | y) echo
							cd ..
							cd ..
							file-edit ;;
						N | n) echo
							printf "${green}[+]Done!${cc}";echo ;;
						*) echo
							printf "${red}[-]Ivalid option${cc}";echo ;;
					esac
					cd ..
					cd ..
					./MineStart.sh ;;
						
						3) echo
						cd MC-Servers
						printf "\u001b[34mWhat Server Do You Want To Edit?\u001b[0m";echo;
						ls;
						read MCfile;
						cd $MCfile;
						printf "\u001b[34mWhich File Do You Want To Edit?\u001b[0m";echo;
						ls;
						read filename;
						nano $filename;
						printf "\u001b[34mIs That It?\u001b[0m(y/n)";echo;
						read next;
						case $next in
							Y | y) echo
								./MineStart.sh ;;
							N | n) echo
								./MineStart.sh ;;
							*) echo
								echo "I'm Not Sure What You Mean"
						esac
						cd ..
						cd ..
						./MineStart.sh ;;
	4) echo
		cd ngrok/;proxychains ./ngrok tcp 25565;
		cd ..
		./MineStart ;;
	5) echo
		cd ngrok/;./ngrok-setup.sh;
		cd ..
		./MineStart.sh ;;
	x) echo
		printf "${yellow}[-]Exiting${cc}";echo ;;
	*)
		printf "${red}[-]WRONG ANSWER${cc}";echo;./MineStart.sh;
		cd ..
		./MineStart.sh ;;
esac
