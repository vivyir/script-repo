#!/bin/bash

source ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"
if [ "$1" = "conf" ]; then
	if [ "$2" = "set" ]; then
		if [ "$3" = "gitname" ]; then
			sed -i "s/gitname=".*"/gitname=\"$4\"/g" ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"
			echo "gitname set to : "$4""

		elif [ "$3" = "targetrepo" ]; then
			sed -i "s/targetrepo=".*"/targetrepo=\"$4\"/g" ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"
			echo "target repo set to : "$4""

		elif [ "$3" = "branch" ]; then
			sed -i "s/branch=".*"/branch=\"$4\"/g" ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"
			
		elif [ "$3" = "installpath" ]; then
			sed -i "s/installpath=".*"/installpath=\"$4\"/g" ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"

		else
			echo "Available :"
			echo "gitname : varname = gitname, now = $gitname"
			echo "targetted repository : varname = targetrepo, now = $targetrepo"
			echo "branch of the repo : varname = branch, now = $branch"
			echo "installation path for scripts : varname = installpath, now = $installpath"
		fi
	elif [ "$2" = "show" ]; then
		echo "gitname : "$gitname""
		echo "targetted repository : "$targetrepo""
		echo "branch of the repository : "$branch""
		echo "path to intall scripts/files from said repository and branch : "$installpath""
	else
		source ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"
		echo "Refreshed"
	fi

elif [ "$1" = "get" ]; then
	targett="$2"
	echo "$targett"
	giturl="https://raw.githubusercontent.com/"$gitname"/"$targetrepo"/"$branch"/"$targett"/init.sh"
	echo "$giturl"
	wherePut=""$installpath"/"$targett""
	mkdir "$wherePut"
	wget "$giturl" -P "$wherePut"
	chmod u+x ""$wherePut"/init.sh"
	echo "Launching the init.sh..."
	# now all the init.sh's must get the dependancies without the parameter... piss
	""$wherePut"/init.sh"
elif [ "$1" = "getonly" ]; then
	targett="$2"
	echo "$targett"
	only="$3"
	echo "$only"
	wherePut=""$installpath"/"$targett"/"
	mkdir "$wherePut"
	giturl="https://raw.githubusercontent.com/"$gitname"/"$targetrepo"/"$branch"/"$targett"/"$only""
	echo "$giturl"
	wget "$giturl" -P "$wherePut"
fi
