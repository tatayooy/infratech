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


# /bin/bash
#Cfile=config.txt
##CONFIG FILE name
#Pfile=dict.txt
##PATH FILE name

#GREEN=$'\e[0;32m'
#RED=$'\e[0;31m'
#CYAN=$'\e[0;36m'
#NC=$'\e[0m'
#el="----------------------------------------------------------------------"

: '
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
        echo "${NC}$d exit${NC}" 
        for k in "${config[@]}"; do
            grep -q "$k" $d
            if [[ $? != 1 ]]; then 
                cf=1
                while read -r line; do
                    if grep -q "$k" <<< "$line"
                    then
                        for c in "${config[@]}";
                        do
                        if grep -q "$c" <<< "$line"; then
                            echo "${CYAN}$line found${NC}"
                            for i in "${!config[@]}"; do
                                [[ "${config[$i]}" = "${k}" ]] && break
                            done 
                            if grep -q "${value[$i]}" <<< "$line"; then
                                echo "${GREEN}$line is good${NC}"
                            else 
                                echo "${RED}$line${NC}"
                                echo "${RED}the idea config is $c ${value[$i]}${NC}"
                            fi
                        fi
                        done
                    fi
                done < "$d"
            fi 
        done
        if [[ $cf != 1 ]]; then 
            echo "${RED}$d importent config missing${NC}"
        fi
    else 
        echo "${RED}$el${NC}"
        echo "${RED}$d file does not exit${NC}"
        echo "${RED}$el${NC}"
    fi
    cf=0
    done









mapfile -t dict < dict.txt
while read -r line; do
    arr=($line)
    config+=(${arr[0]})
    value+=(${arr[1]})
done < config.txt

for d in "${dict[@]}"; do  
    if [[ -e $d ]]; then
        echo "${GREEN}$el ${NC}" 
        echo "${CYAN}$d exit${NC}" 
        for k in "${config[@]}"; do
            grep -q "$k" $d
            line=$(grep -q "$k" $d)
            if [[ $? != 1 ]]; then 
                cf=1
                echo $k config found on line $(grep -n "$k" $d ) 
                for i in "${!config[@]}"; do
                    [[ "${config[$i]}" = "${k}" ]] && break
                done 
                if [[ -e ${value[$i]} ]]; then
                echo "the ideal value is ${value[$i]}"
                fi
                if grep -q "${value[$i]}" <<< "$line"; then
                    echo "${GREEN}$line is good${NC}"
                else 
                    echo "${RED}$line${NC}"
                    echo "${RED}the idea config is $c ${value[$i]}${NC}"
                fi
            fi 
        done
        if [[ $cf != 1 ]]; then 
            echo "${RED}$d importent config missing${NC}"
        fi
    else 
        echo "${RED}$el${NC}"
        echo "${RED}$d file does not exit${NC}"
        echo "${RED}$el${NC}"
    fi
    cf=0
    done






for ((i=1;i<=10;i++)); do 
    echo $i 
done

              echo $i
                fi
                grep -q "$k" $d
                if [[ $? != 1 ]]; then 

for i in ${dict[@]}; do  
    if [[ -e $i ]]; then 
        echo ${GREEN}$el ${NC} 
        echo ${CYAN}$i exit${NC} 
        for k in ${keyword[@]}; do   
            grep -q "$k" $i
            if [[ $? != 1 ]]; then 
                echo ${GREEN}$el ${NC} 
                echo ${CYAN}important security related content of $i${NC} 
                while read -r line; do
                    if grep -q $k <<< "$line"
                    then
                        for c in ${config[@]};
                        do
                        if grep -q $c <<< "$line"; then
                            echo ${CYAN}"$line" config.txt owned${NC} 
                            kcfound=1
                        fi
                        done
                        if [[  $kcfound != 1 ]]
                        then 
                            echo "$line" 
                        fi
                        kcfound=0
                    fi
                done < $i
                kwfound=1
            fi
        done
        if [[ $kwfound != 1 ]]; then 
            echo ${RED}$i important config missing${NC} 
            echo ${RED}The current config${NC} 
            while read -r line; do
                echo "$line" 
            done < $i
            echo ${GREEN}$el ${NC} 
        else 
            kwfound=0
        fi
    else 
        echo ${RED}$el${NC} 
        echo ${RED}$i file does not exit${NC} 
        echo ${RED}$el${NC} 
    fi
done

while read -r line; do
    key+=${line% *}     
    echo $line
    echo ${key[0]}
    value+=${line#* }
    echo $value  
    config+=("$line")
done < config.txt

while read -r line; do
    arr=($line)
    tmp=(${arr[0]})
    tmp2=(${arr[1]})
    config[$tmp]=$tmp2
    echo $config $tmp $tmp2
    #config[$(tmp)]+=(${arr[1]})
done < config.txt

for i in "${!config[@]}"; do
    echo "config is ${config[$i]}  => Value is ${value[$i]}"
done
'
