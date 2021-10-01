#!bin/bash

resources(){
    echo Escoge la opción:
    echo 1. Uso de CPU
    echo 2. Uso de Memoria
    echo 3. Uso de Disco
    read subinput

    if [ "1" = "$subinput" ]
        then echo El uso de CPU es $(cat /proc/stat |grep cpu |tail -1|awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}'|awk '{print "CPU Usage: " 100-$1}')
    elif [ "2" = "$subinput" ]
        then echo El uso de memoria es $(free | grep Mem | awk '{print $3/$2 * 100.0}')
    elif [ "3" = "$subinput" ]
        then echo El uso de disco es $(df -h / |awk '{ print $5 }' | tail -n 1)
    else
        echo Opción inválida, volvemos al menú principal
    fi
}

conection(){
    echo Escoge la opción:
    echo 1. Listado de interfaces
    echo 2. IPs asignadas
    read subinput

    if [ "1" = "$subinput" ]
        then echo El listado de las interfaces es: 
        networkctl -a
    elif [ "2" = "$subinput" ]
        then echo La IP actual es $(hostname -I) 
        echo La IP de loopback es $(hostname -i)
        echo La IPv6 es $(ip a | grep inet6 | awk '{ print $2 }' | tail -n 1)
    else
        echo Opción inválida, volvemos al menú principal
    fi
}

general(){
    echo Escoge la opción:
    echo 1. Usuario actual
    echo 2. Sistema operativo actual
    read subinput

    if [ "1" = "$subinput" ]
        then echo El usuario actual es $(whoami)
    elif [ "2" = "$subinput" ]
        then echo El sistema operativo actual es $(egrep '^(VERSION|NAME)=' /etc/os-release)
    else
        echo Opción inválida, volvemos al menú principal
    fi
}

input=" "
until [ "4" = "$input" ]
    do
    echo Escoge una opción:
    echo 1. Uso de recursos
    echo 2. Conectividad
    echo 3. Información general
    echo 4. Salir
    read input

    if [ "1" = "$input" ]
        then resources
    elif [ "2" = "$input" ]
        then conection
    elif [ "3" = "$input" ]
        then general
    elif [ "4" = "$input" ]
        then echo Hasta luego
    else
        echo Introduce una opción correcta
    fi

    done