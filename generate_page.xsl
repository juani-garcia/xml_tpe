<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="results">
        <html>
            <head>
                <title>Weather status</title>
                <style>
                </style>
            </head>
            <body>
                <h1>Weather status on <xsl:value-of select="count(//results/country/cities/city)"></xsl:value-of> Cities around the World</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="ClientError">
        <h3><xsl:value-of select="//message/text()"></xsl:value-of></h3>
        <h3>Error code: <xsl:value-of select="//cod/text()"></xsl:value-of></h3>
    </xsl:template>

    <xsl:template match="country">
        <!-- Tabla -->
        <h2>Weather on <xsl:value-of select="count(./cities/city)"></xsl:value-of> of <xsl:value-of select="./name"></xsl:value-of></h2>
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
                <xsl:apply-templates/>
            </tbody>
         </table>
    </xsl:template>
    <xsl:template match="cities/city">
        <tr>
            <!-- Datos de la tabla -->
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="temperature/text()"/><xsl:text> </xsl:text><xsl:value-of select="temperature/@unit"/></td>
            <td><xsl:value-of select="feels_like/text()"/>  <xsl:text> </xsl:text> <xsl:value-of select="feels_like/@unit"/></td>    <!-- hay que ver las unidades -->
            <td><xsl:value-of select="humidity"/><xsl:text> </xsl:text><xsl:value-of select="humidity/@unit"/></td>
            <td><xsl:value-of select="pressure"/><xsl:text> </xsl:text> <xsl:value-of select="pressure/@unit"/></td>
            <td><xsl:value-of select="clouds"/></td>
            <td><xsl:value-of select="weather"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
