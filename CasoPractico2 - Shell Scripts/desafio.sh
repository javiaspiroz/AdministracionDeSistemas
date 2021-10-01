#!bin/bash

resources(){
    echo Escoge la opción:
    echo 1. Uso de CPU
    echo 2. Uso de Memoria
    echo 3. Uso de Disco
    read subinput

    case $subinput in 
        1)
            echo El uso de CPU es $(cat /proc/stat |grep cpu |tail -1|awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}'|awk '{print "CPU Usage: " 100-$1}')
        ;;
        2)
            echo El uso de memoria es $(free | grep Mem | awk '{print $3/$2 * 100.0}')
        ;;
        3)
            echo El uso de disco es $(df -h / |awk '{ print $5 }' | tail -n 1)
        ;;
        *) echo Opción inválida, volvemos al menú principal;;
    esac
}

conection(){
    echo Escoge la opción:
    echo 1. Listado de interfaces
    echo 2. IPs asignadas
    read subinput

    case $subinput in 
        1)
            echo El listado de las interfaces es: 
            networkctl -a
        ;;
        2)
            echo La IP actual es $(hostname -I) 
            echo La IP de loopback es $(hostname -i)
            echo La IPv6 es $(ip a | grep inet6 | awk '{ print $2 }' | tail -n 1)
        ;;
        *) echo Opción inválida, volvemos al menú principal;;
    esac
}

general(){
    echo Escoge la opción:
    echo 1. Usuario actual
    echo 2. Sistema operativo actual
    read subinput

    case $subinput in 
        1)
            echo El usuario actual es $(whoami)
        ;;
        2)
            echo El sistema operativo actual es $(egrep '^(VERSION|NAME)=' /etc/os-release)
        ;;
        *) echo Opción inválida, volvemos al menú principal;;
    esac
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

    case $input in 
        4)
            echo Hasta luego
            break
        ;;
        1)
            resources
        ;;
        2)
            conection
        ;;
        3)
            general
        ;;
        *) echo Introduce una opción correcta;;
    esac

    done