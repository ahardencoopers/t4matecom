/*
Tarea 4 Matematicas Computacionales
Scanner para conversion de archivos XML generados por JFLAP a quintuplos.
Alberto Harden Cooper a00811931
Santiago Sandoval
*/


%{
#include <string.h>
#include "parse.tab.h"
char *temp;
%}
%%

\<\/state\>\n\t\t\<state {
	return (C);
}

name=\"[a-zA-Z0-9]*\"	{
	temp = yytext+6;
	temp[strlen(temp)-1] = '\0';
	yylval.string = strdup(temp);
	return (N);
}

\<initial\/\> {
	yylval.string = strdup(temp);
	return (I);
}

\<final\/\> {
	yylval.string = strdup(temp);
	return (F);
}

. ;
\n ;
%%
