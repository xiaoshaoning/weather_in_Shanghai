%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int weather_string_length;
char * weather_string;
%}

%%
\n
\<h1\>[0-9]+"日（今天）"\<\/h1\>\n[\=\<\>a-zA-Z\ 0-9\/\n\"]+\"[阴转晴多云雨雪小]+\""\ " {
                                                                    weather_string_length = strlen(yytext);
                                                                    weather_string = (char *) malloc(sizeof(char) * weather_string_length);
                                                                    memset(weather_string, '\0', weather_string_length);
                                                                    strncpy(weather_string, yytext + 92, weather_string_length - 94);
                                                                    printf("今天天气: %s\n", weather_string);
                                                                    //printf("%d\n", weather_string_length);
                                                                    free(weather_string);
                                                                }

\<h1\>[0-9]+"日（明天）"\<\/h1\>\n[\=\<\>a-zA-Z\ 0-9\/\n\"]+\"[阴转晴多云雨雪小]+\""\ " {
                                                                    weather_string_length = strlen(yytext);
                                                                    weather_string = (char *) malloc(sizeof(char) * weather_string_length);
                                                                    memset(weather_string, '\0', weather_string_length);
                                                                    strncpy(weather_string, yytext + 96, weather_string_length - 98);
                                                                    printf("明天天气: %s\n", weather_string);
                                                                    //printf("%d\n", weather_string_length);
                                                                    free(weather_string);
                                                                }

\<script\>\nvar\ hour3data\=\{[\n\,\:\\[\]\℃\"\ 0-9\x00-\xff\<\>]+\}\n\<\/script\>      {
                                                                                            weather_string_length = strlen(yytext);
                                                                                            weather_string = (char *) malloc(sizeof(char) * weather_string_length);
                                                                                            memset(weather_string, '\0', weather_string_length);
                                                                                            strncpy(weather_string, yytext+23, weather_string_length-33);
                                                                                            printf("%s\n", weather_string);
                                                                                        }
.
%%

int main(int argc, char ** argv)
{
    if (argc > 1)
    {
        if ( (yyin = fopen(argv[1], "r")) == 0 )
        {
            perror(argv[1]);
            exit(1);
        }
    }

    yylex();

    return 0;
}
