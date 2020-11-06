#!/bin/bash


echo "<results>" > ./weather_data.xml
if [[ $# -ne 3 ]]
then
    echo "<error>Three arguments needed</error>" >> ./weather_data.xml
else
    if [[ ! $1 =~ ^[0-9]+$ ]] || [[ $1 -gt 50 ]] || [[ $1 -lt 1 ]]
    then
        echo "<error>Count must be a positive integer</error>" >> ./weather_data.xml
    fi
    if [[ ! $2 =~ ^[+-]?[0-9]+\.?[0-9]*$ ]] || [[ $2 < -90.0 ]] || [[ $2 > 90.0 ]]
    then
        echo "<error>Latitude must be a decimal between -90 and 90</error>" >> ./weather_data.xml
    fi
    if [[ ! $3 =~ ^[+-]?[0-9]+\.?[0-9]*$ ]] || [[ $3 < -180.0 ]] || [[ $3 > 180.0 ]]
    then
        echo "<error>Longitude must be a decimal between -180 and 180</error>" >> ./weather_data.xml
    fi
fi

echo "</results>" >> ./weather_data.xml