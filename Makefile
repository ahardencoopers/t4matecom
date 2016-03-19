# \
Tarea 4 Matematicas Computacionales \
Makefile para conversion de archivos XML generados por JFLAP a quintuplos. \
Alberto Harden Cooper a00811931 \
Santiago Sandoval

#Regla para correr main, requiere la regla main
run: main
	./main

#Regla para crear main, requiere reglas scan y parse
#Se crean archivos objeto para lex.yy.c y para parse.tab.c
#Se necesita hacer "link" con la biblioteca de flex con la opcion -lfl
main: scan parse
	gcc -c lex.yy.c parse.tab.c
	gcc -o main lex.yy.o parse.tab.o -lfl

#Regla para crear parse.tab.c con bison, la opcion -d crea adicionalmente el header parse.tab.h con lista de tokens, requiere archivo parse.y 
parse: parse.y
	bison -d parse.y

#Regla para crear lex.yy.c con flex, requiere archivo scan.l
scan: scan.l
	flex scan.l

#Regla para borrar productos de compilacion y main 
clean:
	rm *tab*
	rm lex*
	rm main
	
