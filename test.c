#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

static int isfloat(const char*);
static int isint(const char *);

int main( int argc, const char *argv[] ){
    FILE * output = fopen("./weather_data.xml", "w");
    fprintf(output, "<results>\n");
    int flag = 0;
    
    int cnt = atoi(argv[1]); 
    double lat = atof(argv[2]);
    double lon = atof(argv[3]);
    
    if(!isint(argv[1]) || cnt > 50 || cnt < 1){
        fprintf(output, "\t<error>Count must be an integer between 1 and 50</error>\n");
        flag = 1;
    }
    if(!isfloat(argv[2]) || lat > 90 || lat < -90){
        fprintf(output, "\t<error>Latitude must be a decimal between -90 and 90</error>\n");
        flag = 1;
    }
    if(!isfloat(argv[3]) || lon > 180 || lon < -180){
        fprintf(output, "\t<error>Longitude must be a decimal between -180 and 180</error>\n");
        flag = 1;
    }  

    fprintf(output, "</results>\n");
    fclose(output);
    return flag;
}

int isfloat(const char* arg) {
    char c;
    int control = 0;
    for (int i = 0; arg[i]; i++){

        c = arg[i];
        
        if (!isdigit(c)) {
            if (c == '.' && control == 0)
                control++;
            else
                if(!(i == 0 && (c == '-' || c == '+')))
                    return 0;
        } 
    }
    return 1;
}

static int isint(const char * arg){
    char c;
    for(int i = 1; arg[i]; i++){
        c = arg[i];
        if(c < '0' || c > '9')
            return 0;
    }
    return 1;
}
