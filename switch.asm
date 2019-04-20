;switch.asm
;UNAM-CERT
;Leal Gonzalez Ignacio

section .text										;Contiene las instrucciones a ejecutar
global _start										;Linea requerida por ld

_start:												;Inicio del programa
	mov eax, 0xDACEB00C								;eax = 0xBACEBOOK
	cmp eax, 0xFACEB00C								;if eax==0xFACEBOOC
	je caso1 										;Iguales eax=0xFACEBOOC
	cmp eax, 0xDACEB00C								;if eax == 0xDACEB00C
	je caso2 										;Iguales eax=0xDACEB00C
	cmp eax, 0xCACEB00C								;if eax == 0xCACEB00C
	je caso3 										;Iguales eax=0xCACEB00C
	mov edx, len_break								;Longitud a escribir del mensaje cuando no se cumple ninguna condicion
	mov ecx, msg_break								;Buffer del mensaje cuando no se cumple ninguna condicion
	mov ebx,1										;Salida estandar 
	mov eax,4										;Llamada a imprimir
	int 0x80										;Llamada al kernel
	
	mov eax, 1										;Llamada al sistema 1 (salir)
	int 0x80										;Llamada al kernel

caso1:												;Entrada del caso cuando eax=0xFACEBOOC
	mov edx, len_caso1								;Longitud a escribir del mensaje cuando se cumple la primera condicion
	mov ecx,msg_caso1								;Buffer del mensaje cuando se cumple la primera condicion
	mov ebx,1										;Salida estandar 
	mov eax,4										;Llamada a imprimir
	int 0x80										;Llamada al kernel
	
	mov eax,1										;Llamada al sistema 1 (salir)
	int 0x80										;Llamada al kernel
		
caso2: 												;Entrada del caso cuando eax=0xDACEB00C	
	mov edx,len_caso2								;Longitud a escribir del mensaje cuando se cumple la segunda condicion
	mov ecx,msg_caso2								;Buffer del mensaje cuando se cumple la segunda condicion
	mov ebx,1										;Salida estandar 
	mov eax,4										;Llamada a imprimir
	int 0x80										;Llamada al kernel
	
	mov eax,1										;Llamada al sistema 1 (salir)
	int 0x80										;Llamada al kernel

caso3: 												;Entrada del caso cuando eax=0xCACEB00C
    mov edx,len_caso3								;Longitud a escribir del mensaje cuando se cumple la tercera condicion
    mov ecx,msg_caso3								;Buffer del mensaje cuando se cumple la tercera condicion
    mov ebx,1										;Salida estandar
    mov eax,4										;Llamada a imprimir
    int 0x80        								;Llamada al kernel
    
    mov eax,1										;Llamada al sistema 1 (salir)			
    int 0x80										;Llamada al kernel	

	
section .data:										;Segmento  que contiene las variables globales y estáticas inicializadas
	msg_caso1: db 'Entra en el caso 1', 0xa 		;Cadena del mensaje cuando entra a la primera opcion 
	len_caso1: equ $ - msg_caso1					;Longitud de la cadena del mensaje cuando entra a la primera opcion 
	msg_caso2: db 'Entra en el caso 2', 0xa 		;Cadena del mensaje cuando entra a la segunda opcion 
	len_caso2: equ $ - msg_caso2					;Longitud de la cadena del mensaje cuando entra a la segunda opcion 
	msg_caso3: db 'Entra en el caso 3', 0xa 		;Cadena del mensaje cuando entra a la tercera opcion 
    len_caso3: equ $ - msg_caso3 					;Longitud de la cadena del mensaje cuando entra a la tercera opcion 
	msg_break: db 'No entran en ningun caso', 0xa 	;Cadena del mensaje cuando no entra a ninguna opcion
	len_break: equ $ - msg_break					;Longitud de la cadena del mensaje cuando no entra a ninguna opcion 

