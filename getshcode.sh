#!/bin/bash
#Ignacio Leal Gonzalez
#UNAM CERT

#Switch dependiendo del segundo parametro ingresado se seleccionara si se muestra la salida en formato unicode o imprimir valores numericos, en ambos casos se mostrara la cadena en formato
#\x90\x90, en unicode \u9090\u9090 y en numerico 9090 y si no se pasan los argumentos correctos se mostrara un mensaje de como ejecutarlo, es necesario darle permisos de ejecucion al script
case $2 in
	-n) 
		objdump -d -j .text $1 | grep -e '^ ' | tr '[[:space:]]' '\n' | egrep '^[[:alnum:]]{2}$' | xargs | sed 's/ /\\x/g' | sed -e 's/^/\\x/g'
		objdump -d -j .text $1 | grep -e '^ ' | tr '[[:space:]]' '\n' | egrep '^[[:alnum:]]{2}$' | xargs | sed "s/ //g" | sed -e "s/^//g" |  sed 's/\\.j.//g'
		;;
	-u)
		aux='\\u'
		objdump -d -j .text $1 | grep -e '^ ' | tr '[[:space:]]' '\n' | egrep '^[[:alnum:]]{2}$' | xargs | sed 's/ /\\x/g' | sed -e 's/^/\\x/g'
		objdump -d -j .text $1 | grep -e '^ ' | tr '[[:space:]]' '\n' | egrep '^[[:alnum:]]{2}$' | xargs | sed "s/ \(..\)/ \1\1/g" | sed "s/^\(..\)/\1\1/g" | sed "s/ /$aux/g" | sed -e "s/^/$aux/g" |  sed 's/\\.j.//g'
		;;
	*)
		echo "Para ejecutar el programa debe de ser ./getshcode.sh archivo [-n | -u]"
	;;
esac