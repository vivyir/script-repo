#!/bin/bash

# Made by phnixir with love <3

outonly="false"
fili="false"
mesg="false"
echo "use \"-h\""

while getopts ":o :h :f: :m:" opt; do
        case $opt in
                f)
                        clear
                        if [ "$mesg" != "true" ]; then
                                fili="true"
                                if test -f "$OPTARG"; then
                                        inPath="$OPTARG"
                                else
                                        "your path is wrong you debil"
                                        exit 1
                                fi
                        else
                                echo "dont use m in combo with f willya?"
                                exit 1
                        fi
                        ;;
                m)
                        clear
                        if [ "$fili" != "true" ]; then
                                mesg="true"
                                mesga="$OPTARG"
                        else
                                echo "dont use f in combo with m willya?"
                                exit 1
                        fi
                        ;;
                o)
                        clear
                        outonly="true"
                        ;;
                h)
                        clear
                        echo "-h for this" >&2
                        echo "-o for output only (no waffle paffle)" >&2
                        echo "-f [PATH] - to make from that file (full path only)" >&2
                        echo "-m [MSG] - to make from a msg" >&2
                        echo "always use \"-o\" when piping with this" >&2
                        echo "okay bye now" >&2
                        exit 1
                        ;;
                \?)
                        clear
                        echo "what the fu is -$OPTARG ?? " >&2
                        exit 1
                        ;;
                :)
                        clear
                        echo "HEY -$OPTARG NEEDS ARGUMENTS"
                        exit 1
                        ;;
        esac
done

if [ "$mesg" = "true" ]; then
        inHash=$(printf "$mesga" | sha512sum | sed 's/  -//' | sed -E 's/...\/.*//' | tr 'a-z' 'A-Z')
        hexToDec=$(echo "obase=10; ibase=16; $inHash" | bc | sed 's/\\//' | head -n1)
        smoldec=$(printf "$hexToDec %% 6841984101\n" | bc)
        if [ "$outonly" != "true" ]; then
                echo ""
                echo "Input is : $mesga"
                echo ""
                echo "sha512 (uphex) : $inHash"
                echo ""
                echo "hex2Dec : $hexToDec"
                echo ""
                echo "smoldec : $smoldec"
                echo ""
                echo "$smoldec"
                echo ""
        else
                echo "$smoldec"
        fi
elif [ "$fili" = "true" ]; then
        inHash=$(cat "$inPath" | sha512sum | sed 's/  -//' | sed -E 's/...\/.*//' | tr 'a-z' 'A-Z')
        hexToDec=$(echo "obase=10; ibase=16; $inHash" | bc | sed 's/\\//' | head -n1)
        smoldec=$(printf "$hexToDec %% 6841984101\n" | bc)
        if [ "$outonly" != "true" ]; then
                echo ""
                echo "Input is : F-$inPath"
                echo ""
                echo "sha512 (uphex) : $inHash"
                echo ""
                echo "hex2Dec : $hexToDec"
                echo ""
                echo "smoldec : $smoldec"
                echo ""
                echo "$smoldec"
                echo ""
        else
                echo "$smoldec"
        fi
fi
