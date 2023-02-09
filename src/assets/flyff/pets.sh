#!/bin/bash
format(){
    pet=$1
    case $pet in
        Tiger)
            rate="false"
            stat="str"
            id=$[1*100000]
            seq="1 2 4 7 11 15 17 24 33"
            ;;
        Rabbit)
            rate="false"
            stat="dex"
            id=$[2*100000]
            seq="1 2 4 7 11 15 17 24 33"
            ;;
        Fox)
            rate="false"
            stat="int"
            id=$[3*100000]
            seq="1 2 4 7 11 15 17 24 33"
            ;;
        Lion)
            rate="false"
            stat="sta"
            id=$[4*100000]
            seq="1 2 4 7 11 15 17 24 33"
            ;;
        Angel)
            rate="true"
            stat="criticalchance"
            id=$[5*100000]
            seq="1 2 3 4 5 6 7 8 9"
            ;;
        Crabe)
            rate="true"
            stat="criticaldamage"
            id=$[6*100000]
            seq="2 3 4 5 6 7 9 11 16"
            ;;
        Unicorn)
            rate="false"
            stat="maxhp"
            id=$[7*100000]
            seq="96 191 383 670 1053 1356 1628 2539 3161"
            ;;
        Griffin)
            rate="false"
            stat="def"
            id=$[8*100000]
            seq="6 12 24 42 66 88 102 140 198"
            ;;
        Dragon)
            rate="false"
            stat="atk"
            id=$[9*100000]
            seq="7 13 27 47 73 95 113 165 220"
            ;;
        *) exit 1
            ;;
    esac
    a=1
    for i in $seq; do

        echo "{
id: $[$id+$a],
name: { en: \"$pet Cage Lv.$a\" },
description: { en: \"By the $pet grace.\" },
grade: $a,
type: \"$pet\",
category: \"raisedpet\",
rarity: \"common\",
abilities: [
{ parameter: \"$stat\", add: $i, rate: $rate },
]
},"
    a=$((a+1))
    done
}

echo "export const petsjson = ["

format Tiger
format Fox
format Rabbit
format Lion
format Angel
format Crabe
format Dragon
format Griffin
format Unicorn

echo "]"


