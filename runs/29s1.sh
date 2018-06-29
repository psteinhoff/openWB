#!/bin/bash
. /var/www/html/openWB/openwb.conf

	if [[ $evsecons1 == "dac" ]]; then
		sudo python /var/www/html/openWB/runs/dac.py 3764 $dacregisters1
	fi

	if [[ $evsecons1 == "modbusevse" ]]; then
		sudo python /var/www/html/openWB/runs/evsewritemodbus.py $evsesources1 $evseids1 29
	fi

echo 29 > /var/www/html/openWB/ramdisk/llsolls1
echo 1 > /var/www/html/openWB/ramdisk/ladestatuss1
