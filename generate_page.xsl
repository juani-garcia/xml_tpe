<?xml version="1.0"?>
<!DOCTYPE html>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <xsl:template match="results">
        <html>
            <style>
                @import "compass/css3";

                @import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400);


            $blue:    #3498db;
            $purple:  #9b59b6;
            $navy:    #34495e;
            $green:   #2ecc71;
            $red:     #e74c3c;
            $orange:  #f39c12;

            .blue   { background: $blue }
            .purple { background: $purple }
            .navy   { background: $navy }
            .green  { background: $green }
            .red    { background: $red }
            .orange { background: $orange }

            .cs335, .cs426, .md303, .md352, .md313, .cs240 {
                font-weight: 300;
                cursor:pointer;
            }

            body {
              background: $red; 
              padding: 20px;
            }

            *, *:before, *:after {
              margin:0; padding:0; border:0; outline: 0;
              @include box-sizing(border-box);
            }

            table {
               font-family: 'Open Sans', Helvetica;
               color: #efefef;
            
            
               tr {

                 &:nth-child(2n){
                    background: #eff0f1; 
                 }

                 &:nth-child(2n+3){
                    background: #fff; 
                 }
               }

               th, td {
                  padding: 1em; 
                  width: 10em;
               }
            }

            .days, .time {
              background: $navy;
              text-transform: uppercase;
              font-size: 0.6em;
              text-align: center;
            }

            .time {
               width: 3em!important; 
            }


            // Tooltip Stuff by Chris Bracco
            /* Add this attribute to the element that needs a tooltip */
            [data-tooltip] {
            	position: relative;
            	z-index: 2;
            	cursor: pointer;
            
            }

            /* Hide the tooltip content by default */
            [data-tooltip]:before,
            [data-tooltip]:after {
              visibility: hidden;
            	@include opacity(0);
            	pointer-events: none;
              @include transition(0.5s ease all);
            }

            /* Position tooltip above the element */
            [data-tooltip]:before {
            	position: absolute;
            	bottom: 110%;
            	left: 50%;
            	margin-bottom: 5px;
            	margin-left: -80px;
            	padding: 7px;
            	width: 160px;
            	@include border-radius(6px);
            
            	background-color: black;
            	color: #fff;
            	content: attr(data-tooltip);
            	text-align: center;
            	font-size: 14px;
            	line-height: 1.2;
            }

            /* Triangle hack to make tooltip look like a speech bubble */
            [data-tooltip]:after {
            	position: absolute;
            	bottom: 110%;
            	left: 50%;
            	margin-left: -5px;
            	width: 0;
            	border-top: 5px solid black;
            	border-right: 5px solid transparent;
            	border-left: 5px solid transparent;
            	content: " ";
            	font-size: 0;
            	line-height: 0;
            }

            /* Show tooltip content on hover */
            [data-tooltip]:hover:before,
            [data-tooltip]:hover:after {
            	visibility: visible;
              bottom: 90%;
            	@include opacity(1);
            }
            </style>
            <head>
                <title>Weather status</title>
                <style>
                </style>
            </head>
            <body>
                <h1>Weather status on <xsl:value-of select="count(//results/country/cities/city)"></xsl:value-of> Cities around the World</h1>
                <xsl:if test="count(//results/ClientError) > 0">
                    
                    <table class="ErrorTable" border="2">
                        <tr>
                            <th>Error</th>
                            <th>Code</th>
                            <th>Description</th>
                        <tr>
                        <tbody>
                            <xsl:apply-templates select="ClientError"/>
                        </tbdoy>
                    </table>
        
                </xsl:if>
                <xsl:if test="count(//results/ClientError) < 1"><xsl:apply-templates select="country"/></xsl:if>                
            </body>
        </html> 
    </xsl:template>

    <xsd:template match="ClientError">
        <tr>
            <td><xsl:value-of select="@error"/></td>
            <td><xsl:value-of select="@code"/><xsl:text></td>
            <td><xsl:value-of select="./text()"/></td>   
        </tr>
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
