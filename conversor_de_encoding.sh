#!/bin/sh
#
# Only for UNIX Operating Systems
#
# For the destination directory (DIRETORIO_DESTINO), is important within the folder 'alterados', 
# is made a copy of the folders/files from the source directory (DIRETORIO_ORIGEM).
#
# Has no problem that the files to be converted also be copied, because the conversion, 
# it is 'replace' the files that are on the destination folder.
#
# Files listed in the operation of IF condition are not valid files to perform the conversion 
# to UTF-8, in other words, can not be converted to this type.(necessary to experiment with other types of encoding)

DIRETORIO_RAIZ="web/"

for DIRETORIO_ORIGEM in $(find $DIRETORIO_RAIZ -type f ) #ENCONTRA O CAMINHO E NOME DE CADA ARQUIVO DE ORIGEM

	do

		ENCODING_ARQUIVO_ORIGEM="$(file -b --mime-encoding $DIRETORIO_ORIGEM)"
		
		if [ "$ENCODING_ARQUIVO_ORIGEM" != "utf-8" ]  && [ "$ENCODING_ARQUIVO_ORIGEM" != "us-ascii" ] && [ "$ENCODING_ARQUIVO_ORIGEM" != "binary" ];

				then
					
					DIRETORIO_DESTINO="alterados/$DIRETORIO_ORIGEM"
					
					echo "$(iconv -s -f $ENCODING_ARQUIVO_ORIGEM -t UTF-8 $DIRETORIO_ORIGEM > $DIRETORIO_DESTINO)" # EXECUTA A CONVERSAO
					
					ENCODING_ARQUIVO_DESTINO="$(file -b --mime-encoding $DIRETORIO_DESTINO)"
					
					echo "ORIGEM: $DIRETORIO_ORIGEM - $ENCODING_ARQUIVO_ORIGEM" #EXIBE O CAMINHO, NOME E ENCODING DO ARQUIVO ORIGEM
					echo "DESTINO: $DIRETORIO_DESTINO - $ENCODING_ARQUIVO_DESTINO" #EXIBE O CAMINHO, NOME E ENCODING DO ARQUIVO DESTINO
		fi
done

# PT-BR
#
# Somente para sistemas operacionais baseados em UNIX
#
# Para o diretorio de destino (DIRETORIO_DESTINO), eh importante que dentro da pasta 'alterados', 
# seja feita uma copia das pastas/arquivos do diretorio origem (DIRETORIO_ORIGEM). 
#   
# Nao tem problema que os arquivos a serem convertidos tambem sejam copiados, pois na conversao, 
# ele faz 'replace' dos arquivos que estao na pasta de destino.
#
# Os arquivos relacionados na operacao de condicao IF nao sao arquivos validos para efetuar
# a conversao para UTF-8, ou seja, nao podem ser convertidos para este tipo. (necessario testar com outros tipos de encoding)
