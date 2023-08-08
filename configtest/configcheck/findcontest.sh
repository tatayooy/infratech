#! /bin/bash
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
CYAN=$'\e[0;36m'
NC=$'\e[0m'
el="sss"

mapfile -t configpath < configpath.txt
mapfile -t keyword < keyword.txt 
while read -r line; do
  config+=("$line") 
done < config.txt

echo result > output.txt
for i in "${configpath[@]}"; do  
    if [[ -e $i ]]; then 
        echo "${GREEN}$el ${NC}"
        echo "${CYAN}$i exit${NC}"
        for k in "${keyword[@]}"; do   
            grep -q "$k" "$i"
            if [[ $? != 1 ]]; then 
                echo "${GREEN}$el ${NC}"
                echo "${CYAN}important security related content of $i${NC}" 
                while read -r line; do
                    if grep -q "$k" <<< "$line"
                    then
                        for c in "${config[@]}";
                        do
                        if grep -q "$c" <<< "$line"; then
                            echo "${CYAN}$line config.txt owned${NC}"
                            kcfound=1
                        fi
                        done
                        if [[  $kcfound != 1 ]]
                        then 
                            echo "$line" 
                        fi
                        kcfound=0
                    fi
                done < "$i"
                kwfound=1
            fi
        done
        if [[ $kwfound != 1 ]]; then 
            echo "${RED}$i important config missing${NC}"
            echo "${RED}The current config${NC}" 
            while read -r line; do
                echo "$line" 
            done < "$i"
            echo "${GREEN}$el ${NC}"
        else 
            kwfound=0
        fi
    else 
        echo "${RED}$el${NC}"
        echo "${RED}$i file does not exit${NC}"
        echo "${RED}$el${NC}" 
    fi
done