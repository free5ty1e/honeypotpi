#!/bin/bash
cpuTempC=$(($(cat /sys/class/thermal/thermal_zone0/temp)/1000))
cpuTempF=$(($cpuTempC*9/5+32))

gpuTempC=$(/opt/vc/bin/vcgencmd measure_temp)
gpuTempC=${gpuTempC:5:2}
gpuTempF=$(($gpuTempC*9/5+32))

echo CPU Temp: $cpuTempCºC or $cpuTempFºF
echo GPU Temp: $gpuTempCºC or $gpuTempFºF
