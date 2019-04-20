# Vulnerabilidades
Practicas, tareas y examen realizadas en Vulnerabilidades.

## Investigacion 
**Tarea 1.pdf**

_En este documento viene el significado de la "R" de los registros de proposito general de 64 bits, ademas de los tipos de datos que hay en 
en ensamblador y su tamaño._

## Switch en ensamblador
**switch.asm**

_En este programa se realiza el funcionamiento de un switch._
Para compilarlo es de la siguiente forma:
```
nasm -f elf32 -o switch.obj switch.asm && ld -m elf_i386 -o switch switch.obj
```
Ahora para ejecutarlo lo hacemos de la siguiente manera:
```
./switch
```

## For en ensamblador
**for.asm**

_En este programa se realiza el funcionamiento de un for._
Para compilarlo es de la siguiente forma:
```
nasm -f elf32 -o for.obj for.asm && ld -m elf_i386 -o for for.obj
```
Ahora para ejecutarlo lo hacemos de la siguiente manera:
```
./for
```

## Cifrar y descifrar
**cifrar.asm**

_En este programa se cifra una cadena utilizando 5 instrucciones de ensamblador distintas utilizando SHR y SHL._
Para compilarlo es de la siguiente forma:
```
nasm -f elf32 -o cifrar.obj cifrar.asm && ld -m elf_i386 -o cifrar cifrar.obj
```
Ahora para ejecutarlo lo hacemos de la siguiente manera:
```
./cifrar
```
**descifrar.asm**

_En este programa se descifra una cadena utilizando 5 instrucciones de ensamblador distintas utilizando SHR y SHL._
Para compilarlo es de la siguiente forma:
```
nasm -f elf32 -o descifrar.obj descifrar.asm && ld -m elf_i386 -o descifrar descifrar.obj
```
Ahora para ejecutarlo lo hacemos de la siguiente manera:
```
./descifrar
```

## Shell
**puerto.asm**

_En este programa se abre el puerto 4444, que al conectarnos a ese puerto nos devuelve una shell, haciendo uso de la llamda al sistema 
excve._
Para compilarlo es de la siguiente forma:
```
nasm -f elf32 -o puerto.obj puerto.asm && ld -m elf_i386 -o puerto puerto.obj
```
Ahora para ejecutarlo lo hacemos de la siguiente manera:
```
./puerto
```
Ahora abrimos una terminal y ejecutamos el siguiente comando:
```
nc 127.0.0.1 4444
```

## shellcode
**getshcode.sh**

_En este programa se obtiene una shellcode, se pasan como parametros el archivo de donde obtendremos la shellcode y el siguiente parámetro 
será si lo queremos en formato unicode \u9090\u9090 que será con el parámetro -u o si solo queremos los valores númericos la pondremos el 
parámetro -n, por defecto el programa mostrará en formato \x90\x90, el programa debe tener permisos de ejecusión._ 
Para ejecutarlo y obtener la salida en formato unicode es de la siguiente manera:
```
./getshcode.sh salir -u
```
Para ejecutarlo y obtener la salida los valores númericos es de la siguiente manera:
```
./getshcode.sh salir -n
```
donde _salir_ es el archivo donde obtendremos el shellcode.

## dnstracer
**dnstracer.pdf**

_En este documento se muestra la explotación de una vulnerabilidad de dnstacer versión 1.8, mostrando los pasos seguidos e incluyendo una 
prueba de concepto._

## Funciones Vulnerables
**funciones vulnerables.pdf**

_En este documento se muestra una tabla comparativa con las funciones vulnerables a buffer overflow de C contra sus versiones seguras, 
indicando qué hace cada función._

## Reverse Shell
**Reverse Shell.pdf**

_En este documento se muestra como se genero una reverse shell codificada y no codificada con msfvenom, mostrando cuántos motores de Virus
Total los detectaron como maliciosos._

**reverseShell.zip**

_Ejecutables obtenidos con msfvenom._

## Examen
**Exámen.pdf**

_En este documento se muestran los pasos seguidos al realizar un análisis estático y un análisis dinámico para encontrar una cadena válida
con nuestro nombre._
