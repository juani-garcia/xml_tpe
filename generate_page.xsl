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
                <h1>Weather status on <xsl:value-of select="sum(//country/)"> Cities around the World</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="libros"/>
    <xsl:template match="usuarios">
        <!-- Tabla -->
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
    <xsl:template match="usuario/datos_personales">
        <tr>
            <!-- Datos de la tabla -->
            <td><xsl:value-of select="nombre"/></td>
            <td><xsl:value-of select="direccion"/></td>
            <td><xsl:value-of select="telefono"/></td>
            <td>
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        prestamos_<xsl:value-of select="../@id"/>.html
                    </xsl:attribute>
                    Prestamos
                </xsl:element>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="prestamos"/>
</xsl:stylesheet>
