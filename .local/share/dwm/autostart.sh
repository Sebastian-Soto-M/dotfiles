#!/bin/sh
green="50FA7B"
orange="FFB86C"
red="FF6E67"
blue="BD93F9"
light_blue="CAA9FA"
yellow="F4F99D"
cyan="9AEDFE"
gray="BFBFBF"
max_height=20

ftime(){
    echo "^c#${gray}^$(date '+ %^b %d ﲊ %I:%M %^p')^d^"
}

fmem(){
    mem=$(free --mebi | sed -n '2{p;q}' | awk '{printf ("%2.2f[GiB]\n"), ($3/1024)}')
    echo -e "^c#${orange}^ ^d^^c#${gray}^${mem}^d^"
}

#vertial bars
vaudio(){
    clr=$cyan
    read -s vol <<< $(pamixer --get-volume)
    vol=$(echo $vol $max_height| awk '{print int($1*($2-2)/100)}')
    y=$(echo $vol $max_height| awk '{print int($2-$1)}')
    echo -e "^c#${clr}^^r0,${y},4,${vol}^^d^"
}
vlight(){
    clr=$yellow
    read -s light <<< $(xbacklight -get)
    light=$(echo $light $max_height| awk '{print int($1*($2-2)/100)}')
    y=$(echo $light $max_height| awk '{print int($2-$1)}')
    echo -e "^c#${clr}^^r0,${y},4,${light}^^d^"
}
vbattery(){
    read -s power <<< $(cat /sys/class/power_supply/BAT0/capacity)
    read -s plugged <<< $(cat /sys/class/power_supply/AC0/online)

    clr=$green
    if [[ $plugged == 0 ]]; then
        if [[ $power < 30 ]]; then
            clr=$red;
            notify-send -u critical "Battery Low" "Plug your charger, current power is ${power}"
        else
            clr=$orange
        fi
    fi
    power=$(echo $power $max_height| awk '{print int($1*($2-2)/100)}')
    y=$(echo $power $max_height| awk '{print int($2-$1)}')
    echo -e "^c#${clr}^^r0,${y},4,${power}^^d^"
}

upt(){
    upt="$(uptime --pretty | sed -e 's/up //g' -e 's/ days/d/g' -e 's/ day/d/g' -e 's/ hours/h/g' -e 's/ hour/h/g' -e 's/ minutes/m/g' -e 's/, / /g')"
    echo -e "^c#6272A4^$upt^d^"
}

layout(){
    echo -e "^c#${light_blue}^$(xkblayout-state print "%e")^d^"
}

redshift -v -b 1:0.5 &

while true; do
    bar=" $(upt) | $(layout) | $(fmem) | $(ftime) | "
    pipes="$(vaudio)^f10^$(vlight)^f10^$(vbattery)^f15^"
    xsetroot -name "${bar}${pipes}"
    sleep 5s
done &

