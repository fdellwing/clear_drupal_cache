#!/bin/bash
######################################################
###        Script for clearing Drupal Cache        ###
###      Author: https://github.com/fdellwing      ###
###                Date: 18.06.2019                ###
###        Contact: f.dellwing@netfutura.de        ###
######################################################

######################################################
###   You may edit this values if they differ on   ###
###                  your system.                  ###
######################################################

# The root path for your drupal installations
WWW_PATH="/var/www/"

######################################################
###          The main script starts here.          ###
######################################################

# Display usage if no parameters are given
if [ -z "$1" ]; then
    echo "Usage: ./drupal-up.sh <foldername or file>"
    echo "Instead of a foldername, you can provide a file with foldernames"
# Run the program if exactly one parameter is given
elif [ -z "$2" ]; then
# Check if the given parameter is a directory in WWW_PATH
	if [ -d "$WWW_PATH""$1" ]; then
		drupale=( "$1" )
	else
		# If not, is it a file?
		if [ -e "$1" ]; then
			# Creates an array from the input file
			drupale=()
			while IFS=$'\n' read -r line; do drupale+=("$line"); done < <(cat "$1")
		else
			# If not, exit the script
			echo "----------------------"
			echo 'The given parameter is no existing directory or file.'
			echo "----------------------"
			exit 1
		fi
	fi
	echo "----------------------"
	echo 'Clearing cache for '"${#drupale[@]}"' instances.'
	echo "----------------------"
	for drupal in "${drupale[@]}"
		do
		TMP_PATH="$WWW_PATH""$drupal"
		cd "$TMP_PATH" || exit 1
		D_VERSION=$(drush @sites status -y --format=json 2> /dev/null | grep 'drupal-version' | grep -Eo '[0-9]+\.' | head -c 1)
		echo "----------------------"
		echo 'Clearing cache for '"$drupal"'.'
		echo "----------------------"
		if [ "$D_VERSION" -eq 7 ]; then
			# Clear the cache
			drush @sites cc all -y >> /dev/null # clear cache
		else
			# Clear the cache
			drush @sites cr -y >> /dev/null # clear cache
		fi
	done
# Display usage if more than one parameter is given
else
	echo "Usage: ./drupal-up.sh <foldername or file>"
	echo "Instead of a foldername, you can provide a file with foldernames"
fi