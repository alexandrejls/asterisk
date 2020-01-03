#!/bin/bash
echo "### Instalação do Asterisk no Ubuntu Server ###"
export DEBIAN_FRONTEND="noninteractive"
add-apt-repository multiverse 
LOG="/var/log/$(echo $0 | cut -d'/' -f2)"
sleep 5
apt update &>> $LOG
apt-get install -y build-essential wget libssl-dev libncurses5-dev libnewt-dev libxml2-dev linux-headers-$(uname -r) &>> $LOG
apt-get install -y libsqlite3-dev uuid-dev git subversion libjansson-dev sqlite3 autoconf automake libtool libedit-dev &>> $LOG
apt-get install -y libelf-dev libsqlite3-dev flex bison unzip sox openssl zlib1g-dev unixodbc unixodbc-dev vim &>> $LOG
apt install -y build-essential libssl-dev libelf-dev libncurses5-dev libnewt-dev libxml2-dev  &>> $LOG
apt install -y make wget openssl ncurses-base newt-tcl libxml2-dev gcc sqlite mysql-server &>> $LOG
apt install -y config-package-dev configure-debian &>> $LOG
echo "Entrando do diretório /usr/src:"
cd /usr/src/

PTBRCORE="https://www.asterisksounds.org/pt-br/download/asterisk-sounds-core-pt-BR-sln16.zip"
PTBREXTRA="https://www.asterisksounds.org/pt-br/download/asterisk-sounds-extra-pt-BR-sln16.zip"
SOUNDS="/var/lib/asterisk/sounds/pt_BR"
COUNTRYCODE="55"
############################## DOWNLOAD E INSTALAÇÃO DO DAHDI ##############################
DAHDI="http://downloads.asterisk.org/pub/telephony/dahdi-linux/dahdi-linux-current.tar.gz"
echo -e "Download e instalação do DAHDI, aguarde..."
if [ ! -f "/usr/src/DAHDI.tar.gz" ]; then
    echo "O arquivo não existe e será feito Download!!"
    cd /usr/src/
    wget -O DAHDI.tar.gz $DAHDI
    sleep 3
else
    echo "O arquivo existe, não será feito Download!!"
    sleep 3
fi
	tar -zxvf DAHDI.tar.gz &>> $LOG 
	cd dahdi-linux*/ &>> $LOG 
	./configure  &>> $LOG 
	make clean  &>> $LOG 
	make all  &>> $LOG 
	make install
	cd ..
echo -e "DAHDI instalado com sucesso!!!, continuando com o script..."
############################## DOWNLOAD E INSTALAÇÃO DO DAHDI ##############################
sleep 5
echo
############################## DOWNLOAD E INSTALAÇÃO DO DAHDITOOLS ##############################
DAHDITOOLS="http://downloads.asterisk.org/pub/telephony/dahdi-tools/dahdi-tools-current.tar.gz"
echo -e "Download e instalação do DAHDITOOLS, aguarde..."
if [ ! -f "/usr/src/dahdi-tools.tar.gz" ]; then
    echo "O arquivo não existe e será feito Download!!"
    cd /usr/src/
    wget -O dahdi-tools.tar.gz $DAHDITOOLS
    sleep 3
else
    echo "O arquivo existe, não será feito Download!!"
fi
	tar -zxvf dahdi-tools.tar.gz &>> $LOG
	cd dahdi-tools*/
	autoreconf -i  &>> $LOG
	./configure  &>> $LOG
	make clean 
	make all 
	make install 
	cd ..
echo -e "DAHDITOOLS instalado com sucesso!!!, continuando com o script..."
############################## DOWNLOAD E INSTALAÇÃO DO DAHDITOOLS ##############################
sleep 5
echo	
#
############################## DOWNLOAD E INSTALAÇÃO DO LIBPRI ##############################
echo -e "Download e instalação do LIBPRI, aguarde..."
LIBPRI="http://downloads.asterisk.org/pub/telephony/libpri/libpri-current.tar.gz"
if [ ! -f "/usr/src/libpri.tar.gz" ]; then
    echo "O arquivo não existe e será feito Download!!"
    cd /usr/src/
    wget -O libpri.tar.gz $LIBPRI &>> $LOG
    sleep 3
else
    echo "O arquivo existe, não será feito Download!!"
fi
	tar -zxvf libpri.tar.gz &>> $LOG
	cd libpri*/ &>> $LOG
	./configure  
	make clean   
	make all  
	make install  
	cd ..
echo -e "LIBPRI instalado com sucesso!!!, continuando com o script..."
############################## DOWNLOAD E INSTALAÇÃO DO LIBPRI ##############################
sleep 5
echo
#
############################## DOWNLOAD E INSTALAÇÃO DO ASTERISK ##############################
echo -e "Download e instalação do ASTERISK, aguarde..."
ASTERISK="http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-17.1.0.tar.gz"
if [ ! -f "/usr/src/lasterisk-17.1.0.tar.gz" ]; then
    echo "O arquivo não existe e será feito Download!!"
    cd /usr/src/
    wget -O asterisk-17.1.0.tar.gz $ASTERISK &>> $LOG
    sleep 3
else
    echo "O arquivo existe, não será feito Download!!"
fi
	tar zxvf asterisk* &>> $LOG
	cd asterisk* &>> $LOG
	./configure --with-jansson-bundled 
	make menuselect 
	make 
	make install 
	make config
echo -e "ASTERISK instalado com sucesso!!!, continuando com o script..."
############################## DOWNLOAD E INSTALAÇÃO DO ASTERISK ##############################



















