#!/bin/bash
echo "### Instalação do Asterisk ###"
export DEBIAN_FRONTEND="noninteractive"
add-apt-repository multiverse
add-apt-repository universe
LOG="/var/log/$(echo $0 | cut -d'/' -f2)"
sleep 3
apt update &>> $LOG
apt -y upgrade &>> $LOG
apt-get install -y build-essential wget libssl-dev libncurses5-dev libnewt-dev libxml2-dev linux-headers-$(uname -r) &>> $LOG
apt-get install -y libsqlite3-dev uuid-dev git subversion libjansson-dev sqlite3 autoconf automake libtool libedit-dev &>> $LOG
apt-get install -y libelf-dev libsqlite3-dev flex bison unzip sox openssl zlib1g-dev unixodbc unixodbc-dev vim &>> $LOG
apt install -y build-essential libssl-dev libelf-dev libncurses5-dev libnewt-dev libxml2-dev  &>> $LOG
apt install -y make wget openssl ncurses-base newt-tcl libxml2-dev gcc sqlite mysql-server &>> $LOG
apt install -y config-package-dev configure-debian &>> $LOG
apt install -y build-essential libssl-dev libelf-dev libncurses5-dev libnewt-dev libxml2-dev linux-headers-$(uname -r) &>> $LOG
apt install -y libsqlite3-dev uuid-dev subversion libjansson-dev sqlite3 autoconf automake libtool libedit-dev flex bison libtool &>> $LOG
apt install -y libtool-bin unzip sox openssl zlib1g-dev unixodbc unixodbc-dev vim git &>> $LOG
apt install -y gcc g++ build-essential dkms libedit-dev flex bison libtool libtonezone-dev pkg-config &>> $LOG
sleep 3
echo "Entrando do diretório /usr/src:"
cd /usr/src/


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
	make &>> $LOG 
	make clean &>> $LOG 
	make all &>> $LOG 
	make install
	make config &>> $LOG 
	cd ..c
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
	./configure  &>> $LOG
	make &>> $LOG
	make clean &>> $LOG  
	make all &>> $LOG 
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
COUNTRYCODE="55"
if [ ! -f "/usr/src/lasterisk-17.1.0.tar.gz" ]; then
    echo "O arquivo não existe e será feito Download!!"
    cd /usr/src/
    wget -O asterisk-17.1.0.tar.gz $ASTERISK &>> $LOG
    sleep 3
else
    echo "O arquivo existe, não será feito Download!!"
fi
	tar -zxvf asterisk-17.1.0.tar.gz &>> $LOG
	cd asterisk-17.1.0 &>> $LOG
	./configure --with-jansson-bundled 
	make menuselect 
	make 
	make install 
	make config
	make samples
	make basic-pbx
	make progdocs
echo -e "ASTERISK instalado com sucesso!!!, continuando com o script..."
############################## DOWNLOAD E INSTALAÇÃO DO ASTERISK ##############################
echo   "Resolvendo as dependências do suporte a Música e Sons em MP3, aguarde..."
	bash contrib/scripts/get_mp3_source.sh  
echo   "Resolvendo as dependências do suporte ao Codec iLBC, aguarde..."
	bash contrib/scripts/get_ilbc_source.sh  
echo   "Instalando as dependência do MP3 e ILBC utilizando o debconf-set-selections, aguarde..."
	# opção do comando | (piper): (Conecta a saída padrão com a entrada padrão de outro comando)
	echo "libvpb1 libvpb1/countrycode $COUNTRYCODE" | debconf-set-selections  
echo   "Install_prereq install, aguarde..."
	yes | bash contrib/scripts/install_prereq install
echo   "Instala um conjunto de scripts de configuração dos Logs do Asterisk (rsyslog)"
	make install-logrotate 
	# inicializando o serviço do Asterisk
	systemctl start asterisk
	cd ..
echo -e "Asterisk instalado com sucesso!!!, continuando com o script..."
sleep 5
echo -e "Download e configuração do Sons em Português/Brasil do Asterisk, aguarde..."
	SOUNDS="/var/lib/asterisk/sounds/pt_br"
	mkdir -v $SOUNDS
	cp -v conf/asterisk/convert.sh $SOUNDS &>> $LOG
	cd $SOUNDS &>> $LOG
	PTBRCORE="https://www.asterisksounds.org/pt-br/download/asterisk-sounds-core-pt-BR-sln16.zip"
	PTBREXTRA="https://www.asterisksounds.org/pt-br/download/asterisk-sounds-extra-pt-BR-sln16.zip"
	wget -O core.zip $PTBRCORE &>> $LOG
	wget -O extra.zip $PTBREXTRA &>> $LOG  
	unzip -o core.zip &>> $LOG
	unzip -o extra.zip &>> $LOG 
	bash convert.sh &>> $LOG 
	cd - 
echo -e "Configuração do Sons em Português/Brasil feito com sucesso!!!!, continuado com o script..."
sleep 5
echo


















echo -e "Instalação do Asterisk feita com Sucesso!!!"
	# script para calcular o tempo gasto (SCRIPT MELHORADO, CORRIGIDO FALHA DE HORA:MINUTO:SEGUNDOS)
	# opção do comando date: +%T (Time)
	HORAFINAL=`date +%T`
	# opção do comando date: -u (utc), -d (date), +%s (second since 1970)
	HORAINICIAL01=$(date -u -d "$HORAINICIAL" +"%s")
	HORAFINAL01=$(date -u -d "$HORAFINAL" +"%s")
	# opção do comando date: -u (utc), -d (date), 0 (string command), sec (force second), +%H (hour), %M (minute), %S (second), 
	TEMPO=`date -u -d "0 $HORAFINAL01 sec - $HORAINICIAL01 sec" +"%H:%M:%S"`
	# $0 (variável de ambiente do nome do comando)
	echo -e "Tempo gasto para execução do script $0: $TEMPO"
echo -e "Pressione <Enter> para concluir o processo."
# opção do comando date: + (format), %d (day), %m (month), %Y (year 1970), %H (hour 24), %M (minute 60)
echo -e "Fim do script $0 em: `date +%d/%m/%Y-"("%H:%M")"`\n" &>> $LOG
read
exit 1
