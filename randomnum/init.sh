#!/bin/bash

# Made by phnixir with love <3

source ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"
echo "launched"
printf ">> This is script needs the program BC. Do not run until you installed BC"

mainPath=""$installpath"/randomnum"
sleep 2s
wget "https://raw.githubusercontent.com/"$gitname"/"$targetrepo"/"$branch"/randomnum/main.sh" -P "$mainPath"
mainSh=""$mainPath"/main.sh"
chmod u+x "$mainSh"

printf ">> Do you want to alias this as \"random-num\" (recommended and changeable in .bashrc) (y/n) (case sensitive) : "
read aliasing
if [ "$aliasing" = "y" ]; then
    echo "alias random-num='"$mainSh"'" >> ""$HOME"/.bashrc"
fi

echo ">> Done! restart bash if you aliased or open by : "$mainSh""
