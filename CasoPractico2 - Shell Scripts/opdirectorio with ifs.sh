#!bin/bash

op1(){
    echo Introduce el directorio, pulsar Enter para el actual
    read dir
    if [ "$dir" != "" ]
        then ls -l $dir | awk '{ print $9 " " $4 }'
    else
        ls -l | awk '{ print $9 " " $4 }'
    fi
    
}

op2(){
    echo Introduce el directorio, pulsar Enter para el actual
    read dir
    if [ "$dir" != "" ]
        then find $dir -size 0 -delete
    else
        find . -size 0 -delete
    fi
}

op3(){
    echo Introduce el directorio, pulsar Enter para el actual
    read dir
    if [ "$dir" != "" ]
        then find $dir -maxdepth 1 -type f -name "*.o" -delete
    else
        find . -maxdepth 1 -type f -name "*.o" -delete
    fi
}

op4(){
    echo Introduce la extensión
    read ext
    echo Introduce el directorio, pulsar Enter para el actual
    read dir
    if [ "$dir" != "" ]
        then find $dir -maxdepth 1 -type f -name "*.$ext" -delete
    else
        find . -maxdepth 1 -type f -name "*.$ext" -delete
    fi
}

input=" "
until [ "5" = "$input" ]
    do
        echo Escoge una opción:
        echo 1.	Listar el contenido de un directorio, mostrando el propietario
        echo 2.	Eliminar los archivos de tamaño cero
        echo 3. Eliminar los archivos objetos
        echo 4.	Eliminar con una extensión concreta preguntada al usuario al seleccionar esta opción
        echo 5.	Salir del programa 
        read input

        if [ "1" = "$input" ]
            then op1
        elif [ "2" = "$input" ]
            then op2
        elif [ "3" = "$input" ]
            then op3
        elif [ "4" = "$input" ]
            then op4
        elif [ "5" = "$input" ]
            then echo Hasta luego
        else
            echo Introduce una opción correcta
        fi        
    done