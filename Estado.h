#include <stdio.h>
#include <stdlib.h>
#include <string.h> 

struct Estado {
	char nombre[1024];
	struct Estado *sig;
};

void nuevoFinal(char *nombre, struct Estado *iterador, struct Estado **ultimo) {
	if(iterador = NULL) {
		iterador = malloc(sizeof(struct Estado));
		iterador->sig = NULL;
		strcpy(iterador->nombre, nombre);
		*ultimo = iterador;
	}
	else {
		iterador->sig = malloc(sizeof(struct Estado));
		iterador = iterador->sig;
		iterador->sig = NULL;
		strcpy(iterador->nombre, nombre);
		*ultimo = iterador;
	}
}