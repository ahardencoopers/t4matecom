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
#define YYSTYPE char *
char inicial[1024];
char estados[1024][1024];
char finales[1024][1024];
int cantEstados = 0;
int cantFinales = 0;
int i;
int r = 0;

%}

%union {
	char *string;
}

%token N I F C M T R

%%

a: s t
s: s s | %empty ;
s: N i f C {
	//printf("NifC %s ", yylval);
	strcpy(estados[cantEstados], yylval);
	cantEstados++; 
};
s: N C {
	//printf("NC %s ", yylval);
	strcpy(estados[cantEstados], yylval);
	cantEstados++; 
}
s: N i f {
	//printf("Nif %s ", yylval);
	strcpy(estados[cantEstados], yylval);
	cantEstados++; 
};
i: %empty | I { 
	strcpy(inicial, yylval); 
	};
f: %empty | F { 
	strcpy(finales[cantFinales], yylval);
	cantFinales++; 
};
t: M T R t {
	//printf("MTRt %s ", yylval);
};
t: M T R {
	//printf("MTR %s", yylval);
};

%%
main() { 
	printf("--------------------------- QUÍNTUPLO --------------------------------\n");
	if(yyparse() == 0) {
		printf("ESTADOS: {");
			for(i=0; i<cantEstados; i++) {
				if(i == cantEstados-1) {
					printf("%s", estados[i]);
				} else {
					printf("%s, ", estados[i]);
				}
			}
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
