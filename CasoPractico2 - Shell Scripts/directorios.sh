#!bin/bash
mkdir DP
cd DP
for i in A B C
    do
        mkdir D$i
        cd D$i
        for j in 1 2 3
            do
                touch f${i,,}$j
            done
        cd ..
    done
cd ..