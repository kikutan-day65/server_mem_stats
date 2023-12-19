#!/bin/bash

function mbToGb() {
    while read -r line; do
        gb=$(echo "scale=2; $line / 1024" | bc) # 小数点2位まで表示
        echo "${gb}"
    done
}

function kbToGb() {
    while read -r line; do
        gb=$(echo "scale=2; $line / 1048576" | bc) # 小数点2位まで表示
        echo "${gb}"
    done
}

# function freeMem() {
    
# }

HOST_NAME=$(memshow | grep host | awk '{print $3}')
AVAILABLE_MEM=$(memshow | grep available_mem | awk '{print $3}' | sed 's/mb//g' | mbToGb)
ASSIGNED_MEM=$(memshow | grep assigned_mem | awk '{print $3}' | sed 's/kb//g' | kbToGb)


paste <(echo "${HOST_NAME}") <(echo "${AVAILABLE_MEM}") <(echo "${ASSIGNED_MEM}")