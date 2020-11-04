<results>
{
    for $country in doc('data/countries.xml')//countries/country
    return <country> {
    for $c in doc('data/data.xml')//cities/list/item
    where $c/city/country = $country/@alpha-2
    return
        <city>
            <name>$c/city/@name</name>
            <temperature unit="$c/temperature/@unit"> $c/temperature/@value </temperature>
            <feels_like unit="$c/feels_like/@unit"> $c/feels_like/@value </feels_like>
            <humidity unit="$c/humidity/@unit"> $c/humidity/@value </humidity>
            <pressure unit="$c/pressure/@unit"> $c/pressure/@value </pressure>
            <clouds> $c/clouds/@name </clouds>
            <weather icon="$c/pressure/@icon"> $c/weather/@value </weather>
        </city>
    } 
    </country>
}   
</results>