#!/bin/bash

source ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"
if [ "$1" = "conf" ]; then
	source ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"
elif [ "$1" = "get" ]; then
	targett="$2"
	echo "$targett"
	giturl="https://raw.githubusercontent.com/"$gitname"/"$targetrepo"/"$branch"/"$targett"/init.sh"
	echo "$giturl"
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
