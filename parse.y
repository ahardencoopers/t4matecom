/*
Tarea 4 Matematicas Computacionales
Parser para conversion de archivos XML generados por JFLAP a quintuplos.
Alberto Harden Cooper a00811931
Santiago Sandoval
*/

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Estado.h" 
#define YYSTYPE char *
char inicial[1024];
char finales[1024][1024];
int cantFinales = 0;
int i;

%}

%union {
	char *string;
}

%token N I F C

%%

s: s s ;
s: N i f C{ printf("%s, ", yylval); };
s: N i f { printf("%s", yylval); };
i: %empty | I { strcpy(inicial, yylval); };
f: %empty | F { 
	strcpy(finales[cantFinales], yylval);
	cantFinales++; 
};

%%
main() { 
	printf("--------------------------- QUÍNTUPLO --------------------------------\n");
	printf("ESTADOS: {");
	if(yyparse() == 0) {
		printf("}\n");
		printf("INICIAL = %s\n", inicial);
		printf("FINALES = {");
		for(i=0; i<cantFinales; i++) {
			if(i == cantFinales-1) {
				printf("%s", finales[i]);
			} else {
				printf("%s, ", finales[i]);
			}
		}
		printf("}");
		printf("\n----------------------------------------------------------------------\n");
		printf("\nPalabra generable por GLC \n");
		return 0;
	}
}

char *s;
yyerror( char *s ) { 
	printf("\nPalabra no generable por GLC \n"); 
	return 1;
}
