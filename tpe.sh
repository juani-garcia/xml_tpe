#!/bin/bash

gcc test.c -o test.exe
if [[ $# -ne 3 ]]
then
    printf "<results>\n\t<error>Three arguments needed</error>\n</results>" > ./weather_data.xml
else
    ./test.exe $1 $2 $3
    if [[ $? -eq 0 ]]   
    then
        curl "https://api.openweathermap.org/data/2.5/find?lat=${2}&lon=${3}&cnt=${1}&mode=xml&appid=${OPENWEATHER_API}" -o ./data/data.xml
        java net.sf.saxon.Query extract_weather_data.xq > weather_data.xml
        rm ./data/data.xml
    fi
    rm ./test.exe
fi
java net.sf.saxon.Transform -s:weather_data.xml -xsl:generate_page.xsl -o:weather_page.html 
rm ./weather_data.xml
