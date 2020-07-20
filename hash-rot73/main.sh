#!/bin/bash

# Made by phnixir with love <3

echo "This script can only weakly-encrypt text files. And must only be used while in the target file's directory"
echo ""
echo "Enter the filename with its extension and press enter."
echo ""
read -r filename
echo ""
echo "Enter "c/C" to compress or "d/D" to decompress and press enter."
echo ""
read cord
echo ""

cwd=$(pwd)
mkdir ""$cwd"/.hash" 2>/dev/null
hashdir=""$cwd"/.hash"
gzipp=$(echo "$cord" | tr 'a-z' 'A-Z')
filee=""$cwd"/"$filename""
logfilee=""$cwd""/"""$hashdir"/"".rot73.log""
hashfilee=""$cwd""/"""$hashdir"/"".""$filename".sha256"
critfilee=""$cwd""/"""$hashdir"/"dontDeleteThisDir.please"

touch "$logfilee"
touch "$hashfilee"

printf "" > "$critfilee"

if [ "$gzipp" = "C" ]; then
	datee=$(date +%H:%M:%S-%F)
	echo "["$datee"][DEBUG]:CSTART" >> "$logfilee"

	datee=$(date +%H:%M:%S-%F)
	echo "["$datee"][DEBUG]:RSTART" >> "$logfilee"
	memorizer=$(tr -d '\0' <"$filee")
	rotted13=$(echo "$memorizer" | tr 'A-Za-z' 'N-ZA-Mn-za-m')
	rotted47=$(echo "$rotted13" |  tr '\!-~' 'P-~\!-O')
	rotted60=$(echo "$rotted47" | tr 'A-Za-z' 'N-ZA-Mn-za-m')
	datee=$(date +%H:%M:%S-%F)
	echo "["$datee"][DEBUG]:RDONE" >> "$logfilee"
	datee=$(date +%H:%M:%S-%F)
	echo "$rotted60" > "$filee"
	echo "["$datee"][DEBUG]:RAPPLIED" >> "$logfilee"

	echo "["$datee"][DEBUG]:COSTART" >> "$logfilee"
	gzip "$filee"
	datee=$(date +%H:%M:%S-%F)
	mv ""$filee".gz" "$filename"
	echo "Oh my god, "$filename" was compressed."
	datee=$(date +%H:%M:%S-%F)
	echo "["$datee"][DEBUG]:CODONE" >> "$logfilee"
	rhash --sha256 "$filee" >> "$hashfilee"
	echo "["$datee"][DEBUG]:HASHED" >> "$logfilee"
	echo "["$datee"][DEBUG]:CSUC" >> "$logfilee"

elif [ "$gzipp" = "D" ]; then
	datee=$(date +%H:%M:%S-%F)
	echo "["$datee"][DEBUG]:DSTART" >> "$logfilee"

	hashingg=$(rhash --sha256 "$filee")
	datee=$(date +%H:%M:%S-%F)
	echo "["$datee"][DEBUG]:HASHCHECK" >> "$logfilee"
	if grep -q "$hashingg" "$hashfilee" 2>/dev/null
	then
		datee=$(date +%H:%M:%S-%F)
		echo "["$datee"][DEBUG]:HASHPASS" >> "$logfilee"
		rm "$hashfilee"
		mv "$filee" ""$filee".gz"
		gunzip ""$filee".gz"
		unmemorizer=$(cat "$filee")
		datee=$(date +%H:%M:%S-%F)
		echo "["$datee"][DEBUG]:1READ" >> "$logfilee"
		datee=$(date +%H:%M:%S-%F)

		unrotted60=$(echo "$unmemorizem" | tr 'A-Za-z' 'N-ZA-Mn-za-m')
		unrotted47=$(echo "$unrotted60" | tr '\!-~' 'P-~\!-O')
		unrotted13=$(echo "$unrotted47" | tr 'A-Za-z' 'N-ZA-Mn-za-m')
		echo "["$datee"][DEBUG]:RDONE" >> "$logfilee"
		echo "$unrotted13" > "$filee"
		echo "["$datee"][DEBUG]:RAPLLIED" >> "$logfilee"
		echo "Oh my god, "$filename" was decompressed."
		datee=$(date +%H:%M:%S-%F)
		echo "["$datee"][DEBUG]:DSUC" >> "$logfilee"
	else
		datee=$(date +%H:%M:%S-%F)
		echo "["$datee"][DEBUG]:HASHFAIL" >> "$logfilee"
		mv "$filee" ""$filee".badhash"
		echo "You did NOT fucking compress this with this script!"
		datee=$(date +%H:%M:%S-%F)
		echo "["$datee"][DEBUG]:DFAIL" >> "$logfilee"
	fi
fi
if [ "$1" != "true" ]; then
	rm "$logfilee"
fi
