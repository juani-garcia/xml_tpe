export OPENWEATHER_API = 

curl "https://api.openweathermap.org/data/2.5/find?lat=56.36&lon=28.16&cnt=2&mode=xml&appid=${OPENWEATHER_API}" -o data.xml

api.openweathermap.org/data/2.5/find?lat={lat}&lon={lon}&cnt={cnt}&appid={API key}

j