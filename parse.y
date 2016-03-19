/*
Tarea 4 Matematicas Computacionales
Parser para conversion de archivos XML generados por JFLAP a quintuplos.
Alberto Harden Cooper a00811931
Santiago Sandoval
*/

%{
#include <stdio.h>
%}

%token L R N

%%

a: l s r;
s: s N;
s: N;
l: L
r: R

%%

main() {
	if(yyparse() == 0) {
		printf("Palabra generable por GLC \n");
		return 0;
	}
}

char *s;
yyerror( char *s ) { 
	printf("Palabra no generable por GLC \n"); 
	return 1;
}
