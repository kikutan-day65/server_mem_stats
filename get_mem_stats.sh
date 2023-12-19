#!/bin/bash

function mbToGb() {
    while read -r line; do
        gb=$(echo "scale=2; $line / 1024" | bc) # 小数点2位まで表示
        echo "${gb}Gb"
    done
}

function kbToGb() {
    while read -r line; do
        gb=$(echo "scale=2; $line / 1048576" | bc) # 小数点2位まで表示
        echo "${gb}Gb"
    done
}

HOST_NAME=$(memshow | grep host | awk '{print $3}')
AVAILABLE_MEM=$(memshow | grep available_mem | awk '{print $3}' | sed 's/mb//g' | mbToGb)
ASSIGNED_MEM=$(memshow | grep assigned_mem | awk '{print $3}' | sed 's/kb//g' | kbToGb)
FREE_MEM=$()

echo -e "NODE\tAVAIABLE_MEM\tASSIGNED_MEM"
echo "--------------------------------------------------------"
paste <(echo "${HOST_NAME}") <(echo "${AVAILABLE_MEM}") <(echo "${ASSIGNED_MEM}") <(echo "${FREE_MEM}")