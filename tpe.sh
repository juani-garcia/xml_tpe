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

curl "https://api.openweathermap.org/data/2.5/find?lat=${2}&lon=${3}&cnt=${1}&mode=xml&appid=${OPENWEATHER_API}" -o ./data/data.xml

java net.sf.saxon.Query extract_weather_data.xq > weather_data.xml

java net.sf.saxon.Transform -s:weather_data.xml -xsl:generate_page.xsl [ -o:weather_page.html ]