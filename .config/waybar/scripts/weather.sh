#!/usr/bin/bash
for i in {1..5}
do
    response=$(curl -s "https://wttr.in/$1?format=%t")
    if [[ $? == 0 ]]
    then
        temp=$(echo "${response}" | grep -o -E '\-*[0-9]+')
        if (( $temp < 0 ))
        then
            percentage=0
        elif (( $temp < 10 ))
        then
            percentage=25
        elif (( $temp < 20 ))
        then
            percentage=50
        elif (( $temp < 25 ))
        then
            percentage=75
        else
            percentage=100
        fi
        text=$(echo "${response//+}" | sed -E "s/\s+/ /g")
        tooltip=$(curl -s "https://wttr.in/$1?format=4")
        if [[ $? == 0 ]]
        then
            tooltip=$(echo "$tooltip" | sed -E "s/\s+/ /g")
            echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\", \"percentage\":$percentage}"
            exit
        fi
    fi
    sleep 2
done
echo "{\"text\":\"error\", \"tooltip\":\"error\"}"
