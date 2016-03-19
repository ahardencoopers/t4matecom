/*
Tarea 4 Matematicas Computacionales
Parser para conversion de archivos XML generados por JFLAP a quintuplos.
Alberto Harden Cooper a00811931
Santiago Sandoval
*/

%{
#include <stdio.h>
#define YYSTYPE char *
char finales[1024];
%}

%union {
	char *string;
}

%token N I F C

%%

s: s s ;
s: N i f C{ printf("%s, ", yylval); };
s: N i f { printf("%s", yylval); };
i: %empty | I { finales[0] = 'a'; };
f: %empty | F { printf("f"); };

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
