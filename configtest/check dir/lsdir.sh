#! /bin/bash
cd /
declare -a maindir
declare -a tmpdir
#find main dir
for D in *; do
    if [ -d "${D}" ]; then  
        maindir[${#maindir[@]}]=$D
    fi
done

for i in ${maindir[@]}; 
do  
    echo $i ============
    cd $i
    ls -a
    echo sub dir of $i
    echo ========
    cd /
done







