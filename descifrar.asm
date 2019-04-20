;descifrar.asm
;UNAM-CERT
;Leal Gonzalez Ignacio

;Programa que descifra una cadena de texto 

section .text                           ;Contiene las instrucciones a ejecutar
global _start                           ;Linea requerida por ld

_start:                                 ;Inicio del programa
        mov eax,[men]                   ;Asignamos a eax lo que tiene mensaje
        mov ecx,0x1                     ;Contador para el mensaje a descifrar
        mov esi,men                     ;Origen del mensaje 
        mov edi,men                     ;movs regs
        jmp descifrar                   ;Salto a descifrar

imprimir:                               ;Procedimiento para mostrar el mensaje descifrado
        mov edx,men_len                 ;Longitud a escribir del mensaje descifrado
        mov ecx,men                     ;Buffer del mensaje descifrado
        mov ebx,1                       ;Salida estandar 
        mov eax,4                       ;Llamada a imprimir
        int 0x80                        ;Llamada al kernel 
        ret                             ;Regresamos a la instruccion siguiente despues de ser llamado

descifrar:
        lodsb                           ;Toma la cadena que se encuentre en la dirección especificada por esi, la carga al registro al
        sub al,0x01                     ;Restamos uno al caracter cifrado por la neg que se utilizo para cifrar
        not al                          ;Utilizamos not para invertir la neg
        ror al,2                        ;Rotamos 2 a la derecha para invertir el rol
        not al                          ;Negamos
        mov dl,al                       ;Creamos una variable auxiliar para realizar los corrimientos de bits
        shl dl,3                        ;Hacemos un corrimiento para invertir el shr
        shr al,3                        ;Hacemos un corrimiento para invertir el shl 
        or al,dl                        ;Realizamos la opeacion or
        cmp al,0x7e                     ;Realizamos una comparacion para que sean caracteres imprimibles
        ja restar                       ;Si es mayor nos vamos a restar
        cmp al,0x21                     ;Realizamos una comparacion para que sean caracteres imprimibles
        jl sumar                        ;Si es menor nos vamos a sumar

ciclo:
        stosb                           ;Almacenamos en edi el contenido del acumulador al
        inc ecx                         ;Incrementamos el contador
        cmp ecx, men_len                ;Comparamos el contador con la longitud del mensaje
        jne descifrar                   ;Si es menor continuamos descifrando
        mov eax, men                    ;Si ya se descifro todo el mensaje 
        call imprimir                   ;Llamamos al procedimiento para mostrar el mensaje descifrado
        mov eax,1                       ;Llamada al sistema 1 (salir)
        int 0x80                        ;Llamada al kernel 

sumar:
        add al,0x20                     ;Sumamos 0x20
        jmp ciclo                       ;Saltamos a ciclo para continuar descifrando

restar:
        sub al,0x70                     ;Restamos 0x70
        jmp ciclo                       ;Saltamos a ciclo para continuar descifrando

section .data                           ;Segmento  que contiene las variables globales y estáticas inicializadas
        men: db '&1&1&1',0xa            ;Cadena del mensaje a descifrar
        men_len: equ $-men              ;Longitud del mensaje a descifrar