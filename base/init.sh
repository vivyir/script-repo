#!/bin/bash

cd $(dirname "$0")

migrateableName="phnixir"
migrateableRepo="script-repo"
migrateableBranch="master"
migrateableDirName="base"


echo "Be in the directory with \"init.sh\" while running otherwise"
echo "the installation will ruin you (it only makes junk and fails)"
echo "also put \"dep\" as an argument to get the dependancies"
echo "like : ./init.sh dep"
echo "This script needs BASH and WGET."
echo "Please stop this script and install them"
echo "If you have them please enter \"yes\" (case sensitive)"
read choice


if [ "$1" = "dep" ]; then

	# eh you may wanna fork my repo so you have to change these
	# all of my other init scripts will lookup to
	# $HOME/.scriptrepo-bare/scriptrepo-bare.conf
	# variables to use in their dependancies
	# so that can make it easier to migrate my repo to yours
	# <TO-DO> : 
	# 1 - make forking easier by removing -phnix and making
	# it a variable - done
	# 2 - make a makeshift searching function
	# </TO-DO>

	wget "https://raw.githubusercontent.com/"$migrateableName"/"$migrateableRepo"/"$migrateableBranch"/"$migrateableDirName"/main.sh"
	wget "https://raw.githubusercontent.com/"$migrateableName"/"$migrateableRepo"/"$migrateableBranch"/"$migrateableDirName"/scriptrepo-bare.conf"
fi

if [ "$choice" = "yes" ]; then

	TESTCONF=$(cat "./scriptrepo-bare.conf")

	# Config n stuff
	mkdir "$HOME"/.scriptrepo-bare

	# Can be added as an alias or ran with
	# /home/username/scriptrepo-bare/scritpname/main.sh
	# cuz all scripts which i would have on github include
	# init.sh, main.sh and more dependancies that are in its
	# init.sh, so after installation you can remove init.sh
	mkdir "$HOME"/scriptrepo-bare

	dir=""$HOME"/.scriptrepo-bare"
	config=""$dir"/scriptrepo-bare.conf"
	print > "$config"

	echo "$TESTCONF" > "$config"
	cp "./main.sh" "$dir"
	echo "alias bare='"$dir"/main.sh'" >> "$HOME""/.bashrc"
	bash
else
	echo "Input other than \"yes\", force stopping..."
	exit 1
fi
