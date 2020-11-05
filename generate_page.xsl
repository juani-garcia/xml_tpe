<?xml version="1.0"?>
<!DOCTYPE html>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <xsl:template match="results">
        <html>
            <style>

            </style>
        <head>
                <title>Weather status</title>
                <style>
                </style>
            </head>
            <body>
                <h1>Weather status on <xsl:value-of select="count(//results/country/cities/city)"></xsl:value-of> Cities around the World</h1>
                <xsl:if test="count(//results/ClientError) > 0"><xsl:apply-templates select="ClientError"/></xsl:if>
                <xsl:if test="count(//results/ClientError) < 1"><xsl:apply-templates select="country"/></xsl:if>                
            </body>
        </html> 
    </xsl:template>

    <xsl:template match="ClientError">
        <table class="ErrorTable" border="2">
            <tr>
                <th>Error</th>
                <th>Description</th>    
            <tr>
            <tbody>
                <xsl:apply-templates select="error" />
            </tbdoy>
        </table>
    </xsl:template>

    <xsd:template match="error">
        
    </xsd:template>

    <xsl:template match="country">
        <!-- Tabla -->
        <h2>Weather on <xsl:value-of select="count(./cities/city)"></xsl:value-of> city of <xsl:value-of select="./name"/></h2>
        <table border="2">
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
        <tr>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="temperature/text()"/><xsl:text> </xsl:text><xsl:value-of select="temperature/@unit"/></td>
            <td><xsl:value-of select="feels_like/text()"/>  <xsl:text> </xsl:text> <xsl:value-of select="feels_like/@unit"/></td>   
            <td><xsl:value-of select="humidity"/><xsl:text> </xsl:text><xsl:value-of select="humidity/@unit"/></td>
            <td><xsl:value-of select="pressure"/><xsl:text> </xsl:text> <xsl:value-of select="pressure/@unit"/></td>
            <td><xsl:value-of select="clouds"/></td>
            <td><xsl:value-of select="weather"/> <img src="http://openweathermap.org/img/wn/{weather/@icon}@2x.png" alt="alternatetext" width="20" height="20"/> </td>   <!-- To-Do el estilo de las imagenes -->
        </tr>
    </xsl:template>


</xsl:stylesheet>
