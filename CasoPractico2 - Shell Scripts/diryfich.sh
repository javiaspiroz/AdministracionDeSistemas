#!bin/bash
if [ -d $1 ]
    then echo $1 'es un directorio'
    find $1 -maxdepth 1 -type f -name "*.$2" | wc -l

else
    echo $1 'no es un directorio, buscaremos los ficheros en la carpeta actual'
    find . -maxdepth 1 -type f -name "*.$1" | wc -l
fi
