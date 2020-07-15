#!/bin/bash

source ""$HOME"/.scriptrepo-bare/scriptrepo-bare.conf"
echo "launched"
print ">> if you want dependancies enter y (case sensitive) : "
read dep
if [ "$dep" = "y" ]; then
    echo ">> good dep"
else
    echo ">> bad dep"
fi

mainPath=""$installpath"/test"
wget "https://raw.githubusercontent.com/"$gitname"/"$targetrepo"/"$branch"/test/main.sh" -P "$mainPath"
mainSh=""$mainPath"/main.sh"
chmod u+x "$mainSh"

print ">> Do you want to alias this as \"baretester\" (not recommended as this is meant to only test and is not helpful) (y/n) (case sensitive) : "
read aliasing
if [ "$aliasing" = "y" ]; then
    echo "alias baretester='"$mainSh"'" >> ""$HOME"/.bashrc"
fi

echo ">> Done! restart bash if you aliased or open by : "$mainSh""
