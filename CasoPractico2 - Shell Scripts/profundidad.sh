#!bin/bash

profundidad(){
    currProf=`find $1 -maxdepth $i -type "d" | wc -l`
    if [ $profMax -lt $currProf ]
        then
            profMax=$currProf
            i=`expr $i + 1`
            profundidad $dir
    else 
        echo La profundidad máxima es `expr $i - 1`
    fi
}

profMax=0 #profuncidad máxima del directorio
i=1 #profundidad en la que iniciamos la búsqueda
echo Introduce el directorio, pulsar Enter para el actual
read dir
profundidad $dir