#!/bin/bash                           
# versao 20130703
# Consolida o nº de usuários no sistema
# Cosme Corrêa
# cosmefc@id.uff.br
#  Descomente para debug
#set -xv

ERRO () {
echo 
echo Consolida o nº de usuários no sistema via SNMP
echo 
echo sintaxe:   $0  
echo 
echo exemplo:   $0 
echo 
echo Obs: faz uso das informações em /etc/mrtg/devices.inc
exit
}

USUSNMP () {
	echo `snmpget -v 2c -c $1 $2 .1.3.6.1.4.1.2021.8.1.101.1 2> /dev/null | cut -d: -f4`
}

USUMRTG () {
if [ `head -1 /var/www/mrtg/"$1"/"$1"_usu.log | cut -d' ' -f3` != '-1' ] 
	then
	echo `head -2 /var/www/mrtg/"$1"/"$1"_usu.log | tail -1 | cut -d' ' -f2`
fi
# http://stackoverflow.com/questions/1819187/test-a-file-date-with-bash
}

# Definindo Variáveis
TOTAL=0
COMMUNITY=public

# Testa se o nº de parâmetros for diferente de 0
if [ "$#" -ne "0" ]
	then
	echo 'Erro, nº errado de parâmetros';
	ERRO;
	exit;
fi

# Gera lista de APs
LISTA=`cut -d'/' -f5 /etc/mrtg/devices.inc | grep ap`

for AP in $LISTA
do
	AP=`expr substr $AP 1 6`
#	USU=`USUSNMP $COMMUNITY $AP`
	USU=`USUMRTG $AP`
	USU=${USU/' '/}
	TOTAL=$(( TOTAL + USU ))
done

echo $TOTAL
exit $TOTAL

