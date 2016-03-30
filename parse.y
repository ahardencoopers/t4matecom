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
#include "Transicion.h"
#define YYSTYPE char *
char inicial[1024];
char estados[1024][1024];
char finales[1024][1024];
char alfabeto[1024];
struct Transicion transiciones[1024];
int cantEstados = 0;
int cantFinales = 0;
int cantTrans = 0;
int cantAlfabeto = 0;
int alfabetoImpreso = 0;
int i;

%}

%union {
	char *string;
}

%token N I F C M O R

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
t: m o r t ; 
t: m o r ;
m: M {
	strcpy(transiciones[cantTrans].fuente, estados[atoi(yylval)]);
};
o: O {
	strcpy(transiciones[cantTrans].destino, estados[atoi(yylval)]);
};
r: R {
	strcpy(transiciones[cantTrans].consume, yylval);
	alfabeto[yylval[0]] = yylval[0];
	cantAlfabeto++;
	cantTrans++;
};

%%
main() { 
	printf("--------------------------- QUÍNTUPLO --------------------------------\n");
	if(yyparse() == 0) {
		printf("ESTADOS= {");
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
		printf("}\n");
		printf("TRANSICIONES= {");
		for(i=0; i<cantTrans; i++) {
			if(i == cantTrans-1) {
				printf("(%s, %s, %s)", transiciones[i].fuente, transiciones[i].consume, transiciones[i].destino);
			} else {
				printf("(%s, %s, %s), ",transiciones[i].fuente, transiciones[i].consume, transiciones[i].destino);
			}
		}
		printf("}\n");
		printf("ALFABETO= {");
		for(i=0; i<1024; i++) {
			if(alfabeto[i] != 0) {
				if(alfabetoImpreso == cantAlfabeto-1) {
					printf("%c", alfabeto[i]);
				} else {
					printf("%c, ", alfabeto[i]);
				}
				alfabetoImpreso++;
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
