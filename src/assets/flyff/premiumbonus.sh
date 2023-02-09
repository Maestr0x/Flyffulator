#!/bin/bash
format(){
stats="str sta dex int"
for stat in $stats; do
    for i in 1 2 3 4; do
        echo "{
id: $[550000+$i],
name: { en: \"+$i $stat\" },
description: { en: \"Add +$i $stat bonus on item.\" },
category: \"stats\",
abilities: [
{ parameter: \"$stat\", add: $i, rate: false },
]
},"
    done
done
}

mix(){
    pStats="str sta dex int"
    sStats="str sta dex int"
    for pStat in $pStats; do
        for sStat in $sStats; do
            if [ "$sStat" != "$pStat" ]; then
                for ip in 1 2 3; do
                    for is in 1 2; do
                    echo "{
id: $[551000+$ip],
name: { en: \"+$ip $pStat & +$is $sStat \" },
description: { en: \"Add +$ip $pStat & +$is $sStat bonus on item.\" },
category: \"stats\",
abilities: [
{ parameter: \"$pStat\", add: $ip, rate: false },
{ parameter: \"$sStat\", add: $is, rate: false },
]
},"
                    done
                done
            fi
        done
    done
}

echo "export const premiumbonusjson = ["
format
mix
echo "]"


