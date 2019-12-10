#!/bin/bash
export DEBIAN_FRONTEND="noninteractive"
# Declarando as variaveis de Download do Asterisk: http://downloads.asterisk.org/pub/telephony/
DAHDI="http://downloads.asterisk.org/pub/telephony/dahdi-linux/dahdi-linux-current.tar.gz"
DAHDITOOLS="http://downloads.asterisk.org/pub/telephony/dahdi-tools/dahdi-tools-current.tar.gz"
LIBPRI="http://downloads.asterisk.org/pub/telephony/libpri/libpri-current.tar.gz"
PTBRCORE="https://www.asterisksounds.org/pt-br/download/asterisk-sounds-core-pt-BR-sln16.zip"
PTBREXTRA="https://www.asterisksounds.org/pt-br/download/asterisk-sounds-extra-pt-BR-sln16.zip"
SOUNDS="/var/lib/asterisk/sounds/pt_BR"
COUNTRYCODE="55"
#
echo -e "Instalando as dependências do Asterisk, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando apt: -y (yes) | $(uname -r) = kernel-release, \ (bar left) quedra de linha na opção do apt
	apt install -y build-essential libssl-dev libelf-dev libncurses5-dev libnewt-dev libxml2-dev 
	apt install -y make wget openssl ncurses-base newt-tcl libxml2-dev gcc sqlite mysql-server
echo -e "OK!!!"
sleep 3
echo
#
cd /usr/src
ASTERISK="http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-17-current.tar.gz"
if [ ! -f "/usr/src/asterisk-17-current.tar.gz" ]; then
    echo "O arquivo não existe e será feito Download!!"
    wget -O asterisk-17-current.tar.gz $ASTERISK
else
    echo "O arquivo existe, não será feito Download!!"
fi
echo -e "OK!!!"
sleep 3
echo
#
