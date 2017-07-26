#!/bin/bash

# curl command to get data 
curl http://api.wunderground.com/api/6380e19ad4b47a53/hourly10day/q/OH/Cincinnati.json >> weatherData.json

# command to parse specific data for 3 days 
temp=$(grep "temp" weatherData.json | sed "s/\metric//g" | cut -f1 -d"," | cut -f3 -d":" | tr -d '"' | head -72)
windSpeed=$(grep "wspd" weatherData.json | sed "s/\metric//g" | cut -f1 -d"," | cut -f3 -d":" | tr -d '"' | head -72)
humidity=$(grep "humidity" weatherData.json | sed "s/\metric//g" | cut -f1 -d"," | cut -f2 -d":" | tr -d '"' | head -72)
uvi=$(grep "uvi" weatherData.json | sed "s/\metric//g" | cut -f1 -d"," | cut -f2 -d":" | tr -d '"'| head -72)
qpf=$(grep "qpf" weatherData.json | sed "s/\metric//g" | cut -f1 -d"," | cut -f3 -d":" | tr -d '"'| head -72)

echo "---- temp -------"
echo $temp
echo "---- wind speed -------"
echo $windSpeed
echo "---- humidity -------"
echo $humidity
echo "---- uvi -------"
echo $uvi
echo "---- percipitation -------"
echo $qpf