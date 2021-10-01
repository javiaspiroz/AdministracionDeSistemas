#!bin/bash

op1(){
    echo Introduce el directorio, pulsar Enter para el actual
    read dir
    ls -l $dir | awk '{ print $9 " " $4 }'
}

op2(){
    echo Introduce el directorio, pulsar Enter para el actual
    read dir
    find $dir -size 0 -delete
}

op3(){
    echo Introduce el directorio, pulsar Enter para el actual
    read dir
    find $dir -maxdepth 1 -type f -name "*.o" -delete
}

op4(){
    echo Introduce la extensión
    read ext
    echo Introduce el directorio, pulsar Enter para el actual
    read dir
    find $dir -maxdepth 1 -type f -name "*.$ext" -delete
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

        case $input in 
            5)
                echo Hasta luego
                break
            ;;
            1)
                op1
            ;;
            2)
                op2
            ;;
            3)
                op3
            ;;
            4)
                op4
            ;;
            *) echo Introduce una opción correcta;;
    esac
       
    done