#!bin/bash
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
            then echo Introduce el directorio
            read dir
            cd $dir
            ls -l | awk '{ print $9 " " $4 }'

            elif [ "2" = "$input" ]
                then find . -size 0 -delete
                # find /path/to/folder -size 0 -delete
            elif [ "3" = "$input" ]
                then find . -maxdepth 1 -type f -name "*.o" -delete
            elif [ "4" = "$input" ]
                then echo Introduce la extensión
                read ext
                find . -maxdepth 1 -type f -name "*.$ext" -delete
            elif [ "5" = "$input" ]
                then echo Hasta luego
            else
                echo Introduce una opción correcta
        fi        
    done