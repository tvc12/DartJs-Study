#!/bin/bash
function setupPathDart2JS
{
	echo "Setup Dart2Js"
	sudo ln -s /usr/lib/dart/bin/pub /usr/bin/pub
	sudo ln -s /usr/lib/dart/bin/dart2js /usr/bin/dart2js
}
function installDart
{
	echo "Install Dart"
	sudo apt-get update
	sudo apt-get install apt-transport-https
	sudo sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
	sudo sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
	sudo apt-get update
	sudo apt-get install dart
	setupPathDart2JS
}
function installJS
{
	echo "Install NodeJS"
	sudo apt install curl
	curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
	curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
	sudo apt install nodejs
}
RED='\033[0;31m'
NC='\033[0m'
if [[ "$1" == 'all' || "$1" == "" ]] 
then
	installDart
	installJS

elif [ "$1" = 'dart' ]
then
	installDart
elif [[ "$1" = 'js' ]]
then
	installJS
elif [[ "$1" = "help" || "$1" == "-h" ]]
then
	echo 'install.sh [Option]'
	echo -e "Default is install '${RED}ALL${NC}' (dart and js)"
	echo 'Advance option: '
	echo -e '\t\tall:\t\tlike default'
	echo -e "\t\tjs:\t\tInstall Nodejs"
	echo -e "\t\tdart:\t\tInstall Dart"
fi
