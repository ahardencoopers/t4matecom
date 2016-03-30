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
char *nombreEstado;
%}
%%

\<\/state\>\n\t\t\<state {
	//printf("scan:Cstate ");
	return (C);
}


\<\/state\>\n\t\t\<!-- {
	//printf("scan:Ctrans ");
	return (C);
}

\<\/state\>\n\t\<\/automaton {
	//printf("scan:Cauto ");
}

name=\"[a-zA-Z0-9]*\" {
	temp = yytext+6;
	temp[strlen(temp)-1] = '\0';
	yylval.string = strdup(temp);
	//printf("scan:N ");
	return (N);
}

\<initial\/\> {
	yylval.string = strdup(temp);
	//printf("scan:I ");
	return (I);
}

\<final\/\> {
	yylval.string = strdup(temp);
	//printf("scan:F ");
	return (F);
}

\<from\>[a-zA-Z0-9]*. {
	temp = yytext+6;
	temp[strlen(temp)-1] = '\0';
	yylval.string = strdup(temp);
	//printf("scan:M ");
	return (M);
}


\<to\>[a-zA-Z0-9]*. {
	temp = yytext+4;
	temp[strlen(temp)-1] = '\0';
	yylval.string = strdup(temp);
	//printf("scan:O ");
	return (O);
}


\<read\>[a-zA-Z0-9]*. {
	temp = yytext+6;
	temp[strlen(temp)-1] = '\0';
	yylval.string = strdup(temp);
	//printf("scan:R ");
	return (R);
}

. ;
\n ;
%%
