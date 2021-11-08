#!bin/bash
mkdir DP
cd DP
for i in A B C
    do
        mkdir D$i
        cd D$i
        for j in 1 2 3
            do
                touch f${i,,}$j #las dos comas se usan para pasar la i a minuscula
            done
        cd ..
    done
cd ..
