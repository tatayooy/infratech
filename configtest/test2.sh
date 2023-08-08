#!/bin/bash
Cfile=config.txt
#CONFIG FILE name
Pfile=dict.txt
#PATH FILE name

GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
CYAN=$'\e[0;36m'
NC=$'\e[0m'
el="----------------------------------------------------------------------"
mapfile -t dict < $Pfile
declare -A config
while read -r line; do
    arr=($line)
    config[${arr[0]}]=${arr[1]}
done < $Cfile

echo Checking configuration according to $Cfile and the path on $Pfile
for d in "${dict[@]}"; do  
    if [[ -e $d ]]; then
        echo "${GREEN}$el ${NC}" 
        echo "${NC}$d exists${NC}" 
        for k in "${!config[@]}"; do
            if grep -q "$k" $d; then 
                cf=1
                while read -r line; do
                    if grep -q "$k" <<< "$line"; then
                        echo "${CYAN}$line found${NC}"
                        if grep -q "${config[$k]}" <<< "$line"; then
                            echo "${GREEN}$line is good${NC}"
                        else 
                            echo "${RED}$line${NC}"
                            echo "${RED}the ideal config is $k ${config[$k]}${NC}"
                        fi
                    fi
                done < "$d"
            fi 
        done
        if [[ $cf != 1 ]]; then 
            echo "${RED}$d important config missing${NC}"
        fi
    else 
        echo "${RED}$el${NC}"
        echo "${RED}$d file does not exist${NC}"
        echo "${RED}$el${NC}"
    fi
    cf=0
done