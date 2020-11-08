<?xml version="1.0"?>
<!DOCTYPE html>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="results">
        <html>
           <style>

            html {
                margin-left: auto;
                margin-right: auto;
                vertical-align: middle;
                text-align: center;
            }

            .title{
                margin-bottom: 15px;
                margin-top: 80px;
            }

            .title, .subtitle, .subsubtitle {
                color: #e6ee9c;
            }

            @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,600);
                        
            *, *:before, *:after {
              margin: 0;
              padding: 0;
              box-sizing: border-box;
            }

            body {
              background: #820157;
              font-family: 'Open Sans', sans-serif;
            }
            table {
              background: #012B39;
              border-radius: 0.25em;
              border-collapse: collapse;
            
                margin-left: auto;
                margin-bottom: 20px;
                margin-right: auto;
                margin-top: 20px;
              
            }
            th {
              border-bottom: 1px solid #364043;
              color: #E2B842;
              font-size: 0.85em;
              font-weight: 600;
              padding: 0.5em 1em;
              text-align: left;
            }
            td {
              color: #fff;
              font-weight: 400;
              padding: 0.65em 1em;
            }
            .disabled td {
              color: #4F5F64;
            }
            tbody tr {
              transition: background 0.25s ease;
            }
            tbody tr:hover {
              background: #014055;

            }

            img {
                vertical-align: middle;
                text-align: center;
            }

            .ErrorTable {
                background: #b71c1c;
            }

            a:hover {
                color: blue;
                text-decoration: inherit; 
              }

            a {
              color: #fff;
              text-decoration: none;
            }

            </style>

            <script type="text/javascript">
      
                function changeBackground(desc)
                {
                     if (desc == '01d'){
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/wp/wp4555534.jpg)';
                    } else if ( desc == '01n') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/wp/wp5215316.jpg)';
                    } else if ( desc == '02d') {  
                        document.body.style.backgroundImage = 'url(https://3.bp.blogspot.com/-JA34A9q4P6I/T9hrbkjs_jI/AAAAAAAAAr4/cWDyQS5nf8w/s1600/sunny-sky+(22).jpg)';
                    } else if ( desc == '02n') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/wp/wp5882380.jpg)';
                    } else if ( desc == '03d') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/uwp/uwp70544.jpeg)';
                    } else if ( desc == '03n') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/wp/wp6707920.jpg)';
                    } else if ( desc == '04d') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/uwp/uwp32790.jpeg)';
                    } else if ( desc == '04n') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/wp/wp6707920.jpg)';
                    } else if ( desc == '09d') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/wp/wp7226273.jpg)';
                    } else if ( desc == '09n') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/wp/wp7226273.jpg)';
                    } else if ( desc == '10d') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/wp/wp7507143.jpg)';
                    } else if ( desc == '10n') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/wp/Z0kmvgB.jpg)';
                    } else if ( desc == '11d') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/wp/wp4552596.jpg)';
                    } else if ( desc == '11n') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/wp/uotoh0J.jpg)';
                    } else if ( desc == '13d') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/wp/wp6919041.jpg)';
                    } else if ( desc == '13n') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/wp/wp6919423.jpg)';
                    } else if ( desc == '50d') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/wp/wp4155383.jpg)';
                    } else if ( desc == '50n') {
                        document.body.style.backgroundImage = 'url(https://wallpapercave.com/wp/wp4155380.jpg)';
                    } 
                } 

                function restoreBackground() {

                    document.body.style.backgroundImage = '';

                }
            </script>
            
            <head>
                <title>Weather status</title>
                <style>
                </style>
            </head>
            <body>
                <xsl:choose>
                    <xsl:when test="count(//results/error) > 0">
                        <h1 class="title">No Cities shown.</h1>
                        <table class="ErrorTable">
                            <tr>
                                <th>Error</th>
                            </tr>
                            <tbody>
                                <xsl:apply-templates select="error"/>
                            </tbody>
                        </table>
                    </xsl:when>
                    <xsl:otherwise>
                        <h1 class="title">Weather status on 
                            <xsl:value-of select="count(//results/country/cities/city)"></xsl:value-of>  
                            <xsl:choose> 
                                <xsl:when test="count(//results/country/cities/city) > 1"> 
                                    Cities 
                                </xsl:when>
                                <xsl:otherwise> 
                                    City
                                </xsl:otherwise> 
                            </xsl:choose>
                            around the World
                        </h1>
                        <xsl:apply-templates select="country"/>
                        <h3 class="subsubtitle">Click a city for more info about its current weather.</h3>
                    </xsl:otherwise>                
                </xsl:choose>
            </body>
        </html> 
    </xsl:template>

    <xsl:template match="error">
        <tr>
            <td><xsl:value-of select="./text()"/></td>
        </tr>
    </xsl:template>

    <xsl:template match="country">
        <!-- Tabla -->
        <h2  class="subtitle">Weather on <xsl:value-of select="count(./cities/city)"/> 
            <xsl:choose> 
                <xsl:when test="count(./cities/city) > 1"> 
                    cities 
                </xsl:when>
                <xsl:otherwise> 
                    city
                </xsl:otherwise> 
            </xsl:choose>
            <xsl:choose> 
                <xsl:when test=" ./cities/city/name/text() = 'Globe'">
                
                </xsl:when>
                <xsl:otherwise> 
                    of <xsl:value-of select="./name"/>
                </xsl:otherwise> 
            </xsl:choose>
        </h2>

        <table>

            <tr>
                <th>City</th>
                <th>Temperature</th>
                <th>Feels like</th>
                <th>Humidity</th>
                <th>Pressure</th>
                <th>Clouds</th>
                <th>Weather</th>
            </tr>
            <tbody>
                <xsl:apply-templates select="cities/city"/>
            </tbody>
         </table>
    </xsl:template>

    <xsl:template match="cities/city">
            <!-- Datos de la tabla -->
        <tr onmousemove="changeBackground('{weather/@icon}')" onmouseout="restoreBackground()">
            <td>
                <a href="https://www.accuweather.com/en/search-locations?query={name}"><xsl:value-of select="name"/></a></td>
            <td><xsl:value-of select="temperature/text()"/><xsl:text> </xsl:text><xsl:value-of select="temperature/@unit"/></td>
            <td><xsl:value-of select="feels_like/text()"/>  <xsl:text> </xsl:text> <xsl:value-of select="feels_like/@unit"/></td>   
            <td><xsl:value-of select="humidity"/><xsl:text> </xsl:text><xsl:value-of select="humidity/@unit"/></td>
            <td><xsl:value-of select="pressure"/><xsl:text> </xsl:text> <xsl:value-of select="pressure/@unit"/></td>
            <td><xsl:value-of select="clouds"/></td>

            <td style="text-align: center;">
                <figure>
                    <img src="http://openweathermap.org/img/wn/{weather/@icon}@2x.png" alt="fig_not_found" width="35" height="35"/>
                  <figcaption><xsl:value-of select="weather"/></figcaption>
                </figure>
               </td>

            <!-- <td> <img src="http://openweathermap.org/img/wn/{weather/@icon}@2x.png" alt="alternatetext" width="35" height="35"/> </td>  -->
        </tr>
    </xsl:template>


</xsl:stylesheet>
