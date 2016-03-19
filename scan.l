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
\{ {return (L);}
\} {return (R);}
[^\{\}] ;
%%
/*
Tokens utilzados por el parser
S -> token inicial (implicito)
L -> Bracket izquierdo
R -> Bracket derecho
*/

