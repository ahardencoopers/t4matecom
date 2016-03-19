/*
Tarea 4 Matematicas Computacionales
Scanner para conversion de archivos XML generados por JFLAP a quintuplos.
Alberto Harden Cooper a00811931
Santiago Sandoval
*/


%{
#include "parse.tab.h"
%}
%%

\<state	{
	return (L); 
}

\<\/state>	{
	return (R);
}

name=\"[a-zA-Z0-9]*\"	{
	yylval.string = strdup(yytext);
	return (N);
}
. ;
\n ;
%%
