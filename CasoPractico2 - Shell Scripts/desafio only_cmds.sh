#!bin/bash
echo El uso de CPU es $(cat /proc/stat |grep cpu |tail -1|awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}'|awk '{print "CPU Usage: " 100-$1}')%
echo El uso de memoria es $(free | grep Mem | awk '{print $3/$2 * 100.0}')%
echo El uso de disco es $(df -h / |awk '{ print $5 }' | tail -n 1)%
echo El listado de las interfaces es:
networkctl -a
echo La IP actual es $(hostname -I) 
echo La IP de loopback es $(hostname -i)
echo La IPv6 es $(ip a | grep inet6 | awk '{ print $2 }' | tail -n 1)
echo El usuario actual es $(whoami)
echo El sistema operativo actual es $(egrep '^(VERSION|NAME)=' /etc/os-release)