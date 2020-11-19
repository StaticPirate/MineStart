cc='\033[0m' #No Color
green='\033[0;32m'

cd ~/MineStart/ngrok
printf "${green}Sign Up For A ngrok Account (https://ngrok.com/)${cc}";echo;
echo;
printf "${green}Enter Your Authtoken${cc}"
read authtoken;
./ngrok authtoken $authtoken;
printf "${greem}[+]Done!${cc}"

