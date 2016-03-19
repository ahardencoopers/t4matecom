/*
Tarea 4 Matematicas Computacionales
Parser para conversion de archivos XML generados por JFLAP a quintuplos.
Alberto Harden Cooper a00811931
Santiago Sandoval
*/

%{
#include <stdio.h>
%}

%union {
	char *string;
}

%token L R N C

%%

a: a l s r;
a: l s r;
s: s c N;
s: N { printf("%s\n", yylval); };
l: L;
r: R;
c: C

%%

main() {
	if(yyparse() == 0) {
		printf("\nPalabra generable por GLC \n");
		return 0;
	}
}

char *s;
yyerror( char *s ) { 
	printf("\nPalabra no generable por GLC \n"); 
	return 1;
}
