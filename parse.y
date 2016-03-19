/*
Tarea 4 Matematicas Computacionales
Parser para conversion de archivos XML generados por JFLAP a quintuplos.
Alberto Harden Cooper a00811931
Santiago Sandoval
*/

%{
#include <stdio.h>
#define YYSTYPE char *
%}

%union {
	char *string;
}

%token L R N C

%%

a: a s ;
a: s ;
s: s c N;
s: N { printf("%s", yylval); };
c: C { printf(","); };

%%

main() { 
	printf("ESTADOS: {");
	if(yyparse() == 0) {
		printf("}");
		printf("\nPalabra generable por GLC \n");
		return 0;
	}
}

char *s;
yyerror( char *s ) { 
	printf("\nPalabra no generable por GLC \n"); 
	return 1;
}
