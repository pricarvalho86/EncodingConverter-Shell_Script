#!/bin/sh

DIR_RAIZ="web/"
	
for DIR_ORIGEM in $(find $DIR_RAIZ -type f ) #CAMINHO E NOME DO ARQUIVO

	do

		ENCODING="$(file -b --mime-encoding $DIR_ORIGEM)" #ENCODE DO ARQUIVO
		#ENCODING="$(file -I $DIR_ORIGEM)" #FUNCIONA NO MAC

		DIR_DESTINO="alterados/$DIR_ORIGEM"
	
		if [ "$ENCODING" != "utf-8" ];
			
				then
				
					#echo "$(iconv -s -f $ENCODING -t UTF-8 $DIR_ORIGEM > $DIR_DESTINO)"
					echo "ORIGEM: $DIR_ORIGEM - $ENCODING" #EXIBE O CAMINHO, NOME E ENCODING DO ARQUIVO ORIGEM
					echo "DESTINO: $DIR_DESTINO - $ENCODING" #EXIBE O CAMINHO, NOME E ENCODING DO ARQUIVO DESTINO
		fi
done
