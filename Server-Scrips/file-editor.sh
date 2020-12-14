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
