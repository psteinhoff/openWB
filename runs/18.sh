#!/bin/bash
. /var/www/html/openWB/openwb.conf
if [[ $evsecon == "dac" ]]; then
	sudo python /var/www/html/openWB/runs/dac.py 2336 $dacregister
fi
if [[ $evsecon == "modbusevse" ]]; then
	sudo python /var/www/html/openWB/runs/evsewritemodbus.py $modbusevsesource $modbusevseid 18
fi
if [[ $debug == "2" ]]; then
	echo "setz ladung auf 18A" >> /var/www/html/openWB/web/lade.log
fi
if [[ $lastmanagement == "1" ]]; then
	if [[ $evsecons1 == "dac" ]]; then
		sudo python /var/www/html/openWB/runs/dac.py 2336 $dacregisters1
	fi

	if [[ $evsecons1 == "modbusevse" ]]; then
		sudo python /var/www/html/openWB/runs/evsewritemodbus.py $evsesources1 $evseids1 18
	fi
	echo 18 > /var/www/html/openWB/ramdisk/llsolls1
	echo 1 > /var/www/html/openWB/ramdisk/ladestatuss1
fi
if [[ $lastmanagements2 == "1" ]]; then
	if [[ $evsecons2 == "dac" ]]; then
		sudo python /var/www/html/openWB/runs/dac.py 2336 $dacregisters2
	fi
	if [[ $evsecons2 == "modbusevse" ]]; then
		sudo python /var/www/html/openWB/runs/evsewritemodbus.py $evsesources2 $evseids2 18
	fi
	echo 18 > /var/www/html/openWB/ramdisk/ladestatuss2
	echo 1 > /var/www/html/openWB/ramdisk/llsolls2

fi
echo 18 > /var/www/html/openWB/ramdisk/llsoll
echo 1 > /var/www/html/openWB/ramdisk/ladestatus
