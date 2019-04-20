;switch.asm
;UNAM-CERT
;Leal Gonzalez Ignacio

section .text                 ;Contiene las instrucciones a ejecutar
global _start                 ;Linea requerida por ld

_start:                       ;Inicio del programa
   mov ecx,0x0                ;Iniciamos en 0
   mov eax,[cont]             ;Le asignamos al registro eax el valor de cont
   jmp for                    ;Iniciamos el ciclo for

fin:
   mov eax,1                  ;Llamada al sistema 1 (salir)       
   int 0x80                   ;Llamada al kernel   

for:
   cmp eax,ecx                ;Comparamos si el valor eax es el mismo que ecx
   je fin                     ;Salimos si el valor es el mismo
   inc ecx                    ;Si no es el mismo incrementamos en 1 a ecx
   jmp for                    ;Regresamos al ciclo for

section .data                 ;Segmento  que contiene las variables globales y estáticas inicializadas
   cont: db 0x5               ;Valor para que finalice el ciclo for 