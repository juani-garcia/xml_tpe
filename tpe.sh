#!/bin/bash

# Para acceder a los parámetros del .sh se usa "$1", "$2", etc...
# Todo texto que se imprima debe estar en ingles.
# El .sh debe acceder a los datos de la api: 
##   "$1" indica la cantidad de ciudades (es un número entero entre 1 y 50, hay que verificarlo, y viene a ser el parámetro "cnt" del curl).
##   "$2" indica la "lat" y es un número real entre -90 y 90 (hay que verificarlo).
##   "$3" indica la "lon" y es un número real entre -180 y 180 (hay que verificarlo).
#
# Con estos datos se debe generar el archivo data.xml dado por:
##  curl "https://api.openweathermap.org/data/2.5/find?lat=${2}.36&lon=${3}&cnt=${1}&mode=xml&appid=${OPENWEATHER_API}" -o data.xml
#
# Dado esto y el archivo countries.xml brindado por la catedra se debe generar un weather_data.xml a
# partir de un xQuery que contenga los datos dada la estructura de weather_data.xsd.
#
# Por último el script debe utilizar un XSLT para generar el HTML final. (Esto se hace fuera del script, el script solo corre el codigo).


function test(){
    echo "<results>" > ./weather_data.xml
    let error 0
    if [[ $# -ne 3 ]]
    then
        error=1
        echo "<error>Three arguments needed</error>" >> ./weather_data.xml
    else
        if [[ ! $1 =~ ^[0-9]+$ ]] || [[ $1 -gt 50 ]] || [[ $1 -lt 1 ]]
        then
            error=1
            echo "<error>Count must be a positive integer</error>" >> ./weather_data.xml
        fi
        if [[ ! $2 =~ ^[+-]?[0-9]+\.?[0-9]*$ ]] || [[ $2 -lt -90 ]] || [[ $2 -gt 90 ]]
        then
            error=1
            echo "<error>Latitude must be a decimal between -90 and 90</error>" >> ./weather_data.xml
        fi
        if [[ ! $3 =~ ^[+-]?[0-9]+\.?[0-9]*$ ]] || [[ $3 -lt -180 ]] || [[ $2 -gt 180 ]]
        then
            error=1
            echo "<error>Longitude must be a decimal between -180 and 180</error>" >> ./weather_data.xml
        fi
    fi

    echo "</results>" >> ./data/data.xml
    return $error
}

test $1 $2 $3

if [[ $? -eq 0 ]]
then
    curl "https://api.openweathermap.org/data/2.5/find?lat=${2}&lon=${3}&cnt=${1}&mode=xml&appid=${OPENWEATHER_API}" -o ./data/data.xml
    java net.sf.saxon.Query extract_weather_data.xq > weather_data.xml
fi

java net.sf.saxon.Transform -s:weather_data.xml -xsl:generate_page.xsl -o:weather_page.html 

