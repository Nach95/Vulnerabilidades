;cifrar.asm
;UNAM-CERT
;Leal Gonzalez Ignacio

;Programa que cifra una cadena de texto 

section .text                           ;Contiene las instrucciones a ejecutar
global _start                           ;Linea requerida por ld

_start:                                 ;Inicio del programa
        mov eax,[men]                   ;Asignamos a eax lo que tiene mensaje
        mov ecx,0x1                     ;Contador para el mensaje a cifrar
        mov esi,men                     ;Origen del mensaje 
        mov edi,men                     ;movs regs
        jmp cifrar                      ;Salto a cifrar

imprimir:                               ;Procedimiento para mostrar el mensaje cifrado
        mov edx,men_len                 ;Longitud a escribir del mensaje cifrado
        mov ecx,men                     ;Buffer del mensaje cifrado
        mov ebx,1                       ;Salida estandar 
        mov eax,4                       ;Llamada a imprimir
        int 0x80                        ;Llamada al kernel 
        ret                             ;Regresamos a la instruccion siguiente despues de ser llamado

cifrar:                                 ;Procedimiento para cifrar
        lodsb                           ;Toma la cadena que se encuentre en la dirección especificada por esi, la carga al registro al
        mov dl,al                       ;Asignamos el valor de al a dl
        shr dl,3                        ;Hacemos un corrimiento al registro dl a la derecha de 3 bits  
        shl al,3                        ;Hacemos un corrimiento al registro al a la izquierda de 3 bits
        not al                          ;Hacemos la operacion not al registro al 
        xor al,dl                       ;Hacemos una xor del registro al(mensaje original) con el registro dl(mensaje con los corrimientos)
        rol al,2                        ;Hacemos una rotacion de 2 bits a la derecha del registro al
        neg al                          ;Hacemos la operacion neg al registro al
        cmp al,0x7e                     ;Realizamos una comparacion para que sean caracteres imprimibles
        ja restar                       ;Si es mayor nos vamos a restar
        cmp al,0x21                     ;Realizamos una comparacion para que sean caracteres imprimibles
        jl sumar                        ;Si es menor nos vamos a sumar

ciclo:
        stosb                           ;Almacenamos en edi el contenido del acumulador al
        inc ecx                         ;Incrementamos el contador
        cmp ecx, men_len                ;Comparamos el contador con la longitud del mensaje
        jne cifrar                      ;Si es menor continuamos cifrando
        mov eax, men                    ;Si ya se cifro todo el mensaje 
        call imprimir                   ;Llamamos al procedimiento para mostrar el mensaje cifrado
        mov eax,1                       ;Llamada al sistema 1 (salir)
        int 0x80                        ;Llamada al kernel 

sumar:
        add al,0x20                     ;Sumamos 0x20
        jmp ciclo                       ;Saltamos a ciclo para continuar cifrando

restar:
        sub al,0x70                     ;Restamos 0x70
        jmp ciclo                       ;Saltamos a ciclo para continuar cifrando

section .data                           ;Segmento  que contiene las variables globales y estáticas inicializadas
        men: db 'IaIaIa',0xa            ;Cadena del mensaje a cifrar
        men_len: equ $-men              ;Longitud del mensaje a cifrar