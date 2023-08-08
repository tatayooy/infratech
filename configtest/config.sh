#! /bin/bash
Cfile=config.txt
#CONFIG FILE name
Pfile=dict.txt
#PATH FILE name

GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
CYAN=$'\e[0;36m'
NC=$'\e[0m'
el="------------------------------------------------------------------------------------------------------"

mapfile -t dict < $Pfile
while read -r line; do
    arr=($line)
    config+=(${arr[0]})
    value+=(${arr[1]})
done < $Cfile

echo Checking configuration accordint to $Cfile and the path on $Pfile
for d in "${dict[@]}"; do  
    if [[ -e $d ]]; then
        echo "${GREEN}$el ${NC}" 
        echo "${CYAN}$d exit${NC}" 
        for k in "${config[@]}"; do
            grep -q "$k" "$d"
            if [[ $? != 1 ]]; then 
                cf=1
                while read -r line; do
                    if grep -q "$k" <<< "$line"
                    then
                        for c in "${config[@]}";
                        do
                        if grep -q "$c" <<< "$line"; then
                            #echo "${CYAN}$line found${NC}"
                            for i in "${!config[@]}"; do
                                [[ "${config[$i]}" = "${k}" ]] && break
                            done 
                            if grep -q "${value[$i]}" <<< "$line"; then
                                echo "${GREEN}$line is good${NC}"
                            else 
                                echo "${RED}$line${NC}"
                                echo "${RED}The idea config is $c ${value[$i]}${NC}"
                            fi
                        fi
                        done
                    fi
                done < "$d"
            fi 
        done
        if [[ $cf != 1 ]]; then 
            echo "${RED}$d importent config not found${NC}"
        fi
    else 
        echo "${RED}$el${NC}"
        echo "${RED}$d file does not exit${NC}"
        echo "${RED}$el${NC}"
    fi
    cf=0
    done
