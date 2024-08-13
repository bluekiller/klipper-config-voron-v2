#!/bin/bash
existing_daemon=`ps -ef | grep probe_accuracy.py | grep -v grep | awk '{print $2}'`
if [ "$existing_daemon" ]; then
	echo "killing existing dameons => $existing_daemon"
	kill $existing_daemon
fi
output_path='~/klipper_config/probe_accuracy'
time=`date +'%F-%H-%M-%S-%N'`
cmd="~/plotly-env/bin/python3 ~/probe_accuracy/probe_accuracy.py --klippy-uds /tmp/klippy_uds --data-file $output_path/probe_accuracy.$time.json --chart-file $output_path/probe_accuracy.$time.html >/tmp/probe_accuracy.log  2>&1 &"
echo $cmd
eval $cmd

