function is_int() { return $(test "$@" -eq "$@" > /dev/null 2>&1); }

if $(is_int "${1}");
then
    echo "Cumple la regex"
else
    echo "No cumple la regex"
fi

REGEX = ^[+-]?\d+\.?\d*$
if [[ $2 =~ $float_regex ]];
# [[ $input =~ ^[+-]?[0-9]+\.?[0-9]*$ ]];
then
    echo "Es un float"
else
    echo "No es un float"
fi