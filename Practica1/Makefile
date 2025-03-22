#//*************************************************************/
#//
#// Desarrollo del Software
#//
#// Alba Ayala Carmona
#// Natalia Serrano Cerceda
#// María Ramos Martínez
#// Sofía González Uceda
#//
#//
#// Makefile para los ejercicios 1 y 4 de la práctica 1
#//
#/************************************************************/

.PHONY: all preambulo ejecutables fin_ejecutables ./Ej1 ./Ej4

all: preambulo ejecutables ./Ej1 ./Ej4 fin_ejecutables


#................................................
# EJECUTABLES

./Ej1:
	@echo 
	@echo Creando ejecutable: Ej1
	@echo 
	javac ./Ej1/*.java
	
./Ej4:
	@echo 
	@echo Creando ejecutable: Ej4
	@echo 
	javac ./Ej4/*.java
	

#/****************************************************************************/
# CLEAN
clean:
	@echo Borrando archivos .class en ejercicios 1 y 4
	rm -rf  ./Ej1/*.class ./Ej4/*.class *.yaml
	@echo Ejecutables borrados


#/****************************************************************************/
# MENSAJES

preambulo:
	@echo 
	@echo -----------------------------------------------------
	@echo
	@echo Desarrollo del Software
	@echo
	@echo Alba Ayala Carmona
	@echo Natalia Serrano Cerceda
	@echo María Ramos Martínez
	@echo Sofía González Uceda
	@echo
	@echo ------------------------------------------------------
	@echo

ejecutables:
	@echo
	@echo Creando ejecutables...
	@echo

fin_ejecutables:
	@echo
	@echo Ejecutables creados
	@echo