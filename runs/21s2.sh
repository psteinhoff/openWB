#!/bin/bash
. /var/www/html/openWB/openwb.conf

	if [[ $evsecons2 == "dac" ]]; then
		sudo python /var/www/html/openWB/runs/dac.py 2726 $dacregisters2
	fi

	if [[ $evsecons2 == "modbusevse" ]]; then
		sudo python /var/www/html/openWB/runs/evsewritemodbus.py $evsesources2 $evseids2 21
	fi
echo 21 > /var/www/html/openWB/ramdisk/llsolls2
echo 1 > /var/www/html/openWB/ramdisk/ladestatuss2
