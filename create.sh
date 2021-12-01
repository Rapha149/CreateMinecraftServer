#!/bin/bash

url="https://raw.githubusercontent.com/Rapha149/CreateMinecraftServer/main"
wget -qO- "$url/requirements.txt" | while read line
do
    values=($line)
    if ! python3 -c "import ${values[0]}" 2> /dev/null
    then
        pip3 install ${values[1]}
        echo
    fi
done

python3 -c "$(wget -qO- $url/create.py)"
