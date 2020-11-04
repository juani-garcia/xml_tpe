<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="results">
        <html>
            <head>
                <title>Weather status</title>
                <style>
                    table{
                        border: 2px solid black;
                        margin: 250px auto;
                        text-align: center;
                    }
                    table:hover{
                        animation: spin 1.5s infinite;
                    }
                    table:active{
                        animation: blinking 0.5s infinite;
                    }
                    html:active{
                        animation: blinking 0.5s infinite;
                    }
                    @keyframes blinking {
                        0%{
                          background-color: #ff3d50;
                        }
                        50%{
                          background-color: #55d66b;
                        }
                        
                        100%{
                          background-color: #222291;
                        }
                      }
                    @-webkit-keyframes spin {
                        0% {
                          -webkit-transform: rotate(0deg);
                        }
                        100% {
                          -webkit-transform: rotate(360deg);
                          
                        }
                      }
                </style>
            </head>
            <body>
                <h1>Weather status on <xsl:value-of select="sum(//country/cities/city)"> Cities around the World</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    <xsl:template match="ClientError">
        <h3><xsl:value-of select="//message/text()"></h3>
        <h3>Error code: <xsl:value-of select="//cod/text()"></h3>
    </xsl:template>

    <xsl:template match="country">
        <!-- Tabla -->
        <h2>Weather on <xsl:value-of select="sum(//cities/city)"> of <xsl:value-of select="//name"></h2>
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
                <xsl:apply-templates/>
            </tbody>
         </table>
    </xsl:template>
    <xsl:template match="cities/city">
        <tr>
            <!-- Datos de la tabla -->
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="temperature"/></td>
            <td><xsl:value-of select="feels_like"/></td>    <!-- hay que ver las unidades -->
            <td><xsl:value-of select="hummidity"/></td>
            <td><xsl:value-of select="pressure"/></td>
            <td><xsl:value-of select="clouds"/></td>
            <td><xsl:value-of select="weather"/> <img src="" alt="Flowers in Chania"> </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
