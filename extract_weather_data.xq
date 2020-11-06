<results xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="weather_data.xsd">
{
    if( doc('data/data.xml')//count(ClientError)>=1) then (
        for $error in doc('data/data.xml')//ClientError
        return
        <error>{xs:string($error/message)}</error>
    ) else (
        for $country in fn:distinct-values(doc('data/data.xml')//cities/list/item/city/country) 
        order by doc('data/countries.xml')/countries/country[@alpha-2=$country]/@name ascending 
        return <country alpha-2="{$country}"> 
            <name>{xs:string(doc('data/countries.xml')//countries/country[@alpha-2 = $country]/@name)}</name>
            <cities>
            {for $city in doc('data/data.xml')//cities/list/item
            where $city/city/country = $country 
            return
                <city>
                    <name>{xs:string($city/city/@name)}</name>
                    <temperature unit="{$city/temperature/@unit}">{xs:string($city/temperature/@value)}</temperature>
                    <feels_like unit="{$city/feels_like/@unit}">{xs:string($city/feels_like/@value)}</feels_like>
                    <humidity unit="{$city/humidity/@unit}">{xs:string($city/humidity/@value)}</humidity>
                    <pressure unit="{$city/pressure/@unit}">{xs:string($city/pressure/@value)}</pressure>
                    <clouds>{xs:string($city/clouds/@name)}</clouds>
                    <weather icon="{$city/weather/@icon}">{xs:string($city/weather/@value)}</weather>
                </city>
            }
            </cities>
        </country>
    )
}   
</results>