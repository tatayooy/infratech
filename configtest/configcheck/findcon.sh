#! /bin/bash
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
CYAN=$'\e[0;36m'
NC=$'\e[0m'
el===========================================================

mapfile -t configpath < configpath.txt
mapfile -t keyword < keyword.txt 

config=()
while read -r line; do
  config+=("$line") 
done < config.txt
    echo result > output.txt
for i in ${configpath[@]}; 
do  
    if [[ -e $i ]]
    then 
        echo ${GREEN}$el ${NC} >> output.txt
        echo ${CYAN}$i exit${NC} >> output.txt
        for k in ${keyword[@]}; 
        do   
            grep -q "$k" $i
            if [[ $? != 1 ]]
            then 
                echo ${GREEN}$el ${NC} >> output.txt
                echo ${CYAN}important security related content of $i${NC} >> output.txt
                while read -r line
                do
                    if grep -q $k <<< "$line"
                    then
                        for c in ${config[@]};
                        do
                        if grep -q $c <<< "$line" 
                        then
                            echo ${CYAN}"$line" config.txt owned${NC} >> output.txt
                            kcfound=1
                        fi
                        done
                        if [[  $kcfound != 1 ]]
                        then 
                            echo "$line" >> output.txt
                        fi
                        kcfound=0
                    fi
                done < $i
                kwfound=1
            fi
        done
        if [[ $kwfound != 1 ]]
        then 
            echo ${RED}$i important config missing${NC} >> output.txt
            echo ${GREEN}$el ${NC} >> output.txt
        else 
            kwfound=0
        fi
    else 
        echo ${RED}$el${NC} >> output.txt
        echo ${RED}$i file does not exit${NC} >> output.txt
        echo ${RED}$el${NC} >> output.txt
    fi
done

##try to read the right config number 