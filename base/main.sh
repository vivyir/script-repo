#!/bin/bash

# Made by phnixir with love <3

# To-do :
# Add more comments explaining things like wtf suka - priority medium - done
# Whitespace is cool - priority high - done
# Create a makeshift search - priority high
	# > Updateable by : bare getindex
	# > Uses grep to search in the file
	# > Deletes the already existing index before wgetting the new one
	# > index has the creators name in the file
	# > index would be sorted by oldest added
	# > searches by : bare search
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	# i know i know getindex and search are two very different terms but
	# isnt the thingy that lists all available scripts and creators of them
	# technically an index? eh idek

# Including config by using source cuz its bash blyaat

source ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"

# Processing first paramater

if [ "$1" = "conf" ]; then

	# If the first parameter is set, set the corresponding variable

	if [ "$2" = "set" ]; then

		# Gitname as 3d paramater sets it to the 4th

		if [ "$3" = "gitname" ]; then
			sed -i "s/gitname=".*"/gitname=\"$4\"/g" ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"
			echo "gitname set to : "$4""

		# Targetrepo as 3d paramater sets it to the 4th

		elif [ "$3" = "targetrepo" ]; then
			sed -i "s/targetrepo=".*"/targetrepo=\"$4\"/g" ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"
			echo "target repo set to : "$4""

		# Branch as 3d paramater sets it to the 4th

		elif [ "$3" = "branch" ]; then
			sed -i "s/branch=".*"/branch=\"$4\"/g" ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"
			
		# Installpath as 3d paramater sets it to the 4th

		elif [ "$3" = "installpath" ]; then
			sed -i "s/installpath=".*"/installpath=\"$4\"/g" ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"

		# If none apply show the 'man'

		else
			echo "Available :"
			echo "gitname : varname = gitname, now = $gitname"
			echo "targetted repository : varname = targetrepo, now = $targetrepo"
			echo "branch of the repo : varname = branch, now = $branch"
			echo "installation path for scripts : varname = installpath, now = $installpath"
		fi

	# If not set go to the next elif
	# If show then :

	elif [ "$2" = "show" ]; then

		# Show all available config variables

		echo "gitname : "$gitname""
		echo "targetted repository : "$targetrepo""
		echo "branch of the repository : "$branch""
		echo "path to intall scripts/files from said repository and branch : "$installpath""

	# If no second parameter was applied or wasnt the same as above refresh the config

	else
		source ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"
		echo "Refreshed"
	fi

# If not conf go to the next elif which is get

elif [ "$1" = "get" ]; then

	# Set parameter 2 as targett

	targett="$2"
	echo "$targett"

	# Assemble the URL using the config vars and targett to get the init.sh

	giturl="https://raw.githubusercontent.com/"$gitname"/"$targetrepo"/"$branch"/"$targett"/init.sh"
	echo "$giturl"

	# Set up its directories and paths

	wherePut=""$installpath"/"$targett""
	mkdir "$wherePut"

	# Finally download the init.sh

	wget "$giturl" -P "$wherePut"

	# Make the init.sh executable for YOU and launch it

	chmod u+x ""$wherePut"/init.sh"
	echo "Launching the init.sh..."

	# now all the init.sh's must get the dependancies without the parameter... piss

	""$wherePut"/init.sh"

# If not get go to the next elif which is license

elif [ "$1" = "license" ]; then

	# Get the license file and page it in realtime

	curl "https://raw.githubusercontent.com/"$gitname"/"$targetrepo"/"$branch"/base/LICENSE" | less

# If not license go to the next elif which is installed

elif [ "$1" = "installed" ]; then

	# Just list the directories in installpath
	# Gets the job done eh

	ls "$installpath"

# If not installed go to the next elif which is getonly

elif [ "$1" = "getonly" ]; then

	# Set the second parameter as targett

	targett="$2"
	echo "$targett"

	# Set the third parameter as only

	only="$3"
	echo "$only"

	# Set up the directories

	wherePut=""$installpath"/"$targett"/"
	mkdir "$wherePut"

	# Assemble url and download the chosen file from said script

	giturl="https://raw.githubusercontent.com/"$gitname"/"$targetrepo"/"$branch"/"$targett"/"$only""
	echo "$giturl"
	wget "$giturl" -P "$wherePut"

elif [ "$1" = "search" ]; then

	termm="$2"

	grep "$termm" ""$HOME"/.scriptrepo-bare/index.bare"

elif [ "$1" = "getindex" ]; then

	rm ""$HOME"/.scriptrepo-bare/index.bare"
	wget "https://raw.githubusercontent.com/"$gitname"/"$targetrepo"/"$branch"/index.bare" -P ""$HOME"/.scriptrepo-bare/"
fi

# End!
