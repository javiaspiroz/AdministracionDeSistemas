#!bin/bash
usuarios=`who -u | awk '{print $1}'`
found=NO
for i in $usuarios
    do
        if [ $i = $1 ]
            then found=SI
        fi
    done
echo $found