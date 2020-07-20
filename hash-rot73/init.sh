#!/bin/bash

# Made by phnixir with love <3

source ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"
echo "launched"

mainPath=""$installpath"/test"
mainSh=""$mainPath"/main.sh"

printf ">> This script needs RHash and GZip if you do not have those please Ctrl-c, install them, and run this again at "$mainPath"/init.sh, otherwise enter (yes) : "
read installed
if [ "$installed" = "yes" ]; then

	wget "https://raw.githubusercontent.com/"$gitname"/"$targetrepo"/"$branch"/hash-rot73/main.sh" -P "$mainPath"
	chmod u+x "$mainSh"

	printf ">> Do you want to alias this as \"hash-rot73\" (recommended) (y/n) (case sensitive) : "
	read aliasing
	if [ "$aliasing" = "y" ]; then
	    echo "alias hash-rot73='"$mainSh"'" >> ""$HOME"/.bashrc"
	fi
	
	echo ">> Done! restart bash if you aliased or open by : "$mainSh""

else
	echo "Input other than (yes), terminating..."
fi
