#!/bin/bash
#
force_color_prompt=yes
export DEBIAN_FRONTEND="noninteractive" # Não solicitar telas de configuração
clear
# CORES
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
SEPARADOR='echo -e " *****=========================================================================================***** "'
S2='sleep 2'
S3='sleep 3'
mkdir -p /script/log
clear
###########################################################################################################################
# AUTOR
AUTOR="Script feito por: Alexandre Jorge"
CRIACAO="Criado em: 16/12/2020"
ATUALIZACAO="Atualizado em: 16/12/2020"
$SEPARADOR
echo $AUTOR && echo $CRIACAO && echo $ATUALIZACAO
###########################################################################################################################
$SEPARADOR 
###########################################################################################################################
echo -e " Remove apt cdrom " && $S2
if [ -f "$SCRIPT_LOG/remove_apt-cdrom" ]; then
    echo -e " Realizado anteriormente " && $S3
    else
sed -i '/cdrom/d' /etc/apt/sources.list
touch $SCRIPT_LOG/remove_apt-cdrom
$S3 && $S3 && $S3
fi
###########################################################################################################################
$SEPARADOR && $S3
###########################################################################################################################
echo -e " Alias de pastas " && $S2
AST_INSTALL="/root/asterisk" && echo $AST_INSTALL
ARQ_MODIFICADOS="/root/asterisk/modificados" && echo $ARQ_MODIFICADOS
SCRIPT_LOG="/script/log" && echo $SCRIPT_LOG
$S3
###########################################################################################################################
$SEPARADOR 
###########################################################################################################################
echo -e " Libera root logar no SSH " && $S2
if [ -f "$SCRIPT_LOG/root_ssh" ]; then
    echo -e " Realizado anteriormente " && $S3
    else
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
/etc/init.d/ssh restart && grep RootL /etc/ssh/sshd_config && touch $SCRIPT_LOG/root_ssh
$S3 && $S3 && $S3
fi
###########################################################################################################################
$SEPARADOR
###########################################################################################################################
echo -e " Preparando Install para O ASTERISK "
if [ -f "$SCRIPT_LOG/ast_dep1" ]; then
    echo -e " Realizado anteriormente " && $S3
    else
apt update && apt-get upgrade -y && apt update && apt-get upgrade -y
apt-get install -y build-essential libssl-dev libelf-dev libncurses5-dev libnewt-dev libxml2-dev
apt-get install -y wget libsqlite3-dev uuid-dev git subversion libjansson-dev sqlite3 autoconf
apt-get install -y automake libtool libedit-dev dialog openvpn flex bison libtool-bin unzip sox
apt-get install -y unixodbc unixodbc-dev libusb-dev fxload pkg-config libasound2-dev doxygen
apt-get install -y module-assistant rcconf coreutils libtiff-tools openssl zlib1g-dev
apt-get install -y unixodbc unixodbc-dev wget apt 
apt-get install -y linux-headers-$(uname -r) 
touch $SCRIPT_LOG/ast_dep1
$S3 && $S3 && $S3
fi
###########################################################################################################################
$SEPARADOR
###########################################################################################################################
echo -e " Copiando o BASHRC personalizado " && $S2
if [ -f "/root/.bashrc.bk.alexandre" ]; then
    echo -e " Realizado anteriormente " && $S3
    else
mv -v -f /root/.bashrc /root/.bashrc.bk.alexandre -v && echo 
cp -i -v -f $ARQ_MODIFICADOS/bash/bashrc /root/.bashrc && echo 
mkdir -v /script  && echo && mkdir -v -p /script/log
cp -i -v -f $ARQ_MODIFICADOS/bash/ping_bash.sh /script && echo 
cp -i -v -f $ARQ_MODIFICADOS/bash/testeping.sh /script && echo 
clear
echo -e " Precione ENTER para reiniciar o computador. "
  read
  reboot
fi
###########################################################################################################################
$SEPARADOR 
###########################################################################################################################
echo -e " Remove Vim-Tiny " && $S2
if [ -f "$SCRIPT_LOG/remove_vim-tiny" ]; then
    echo -e " Realizado anteriormente " && $S3
    else
apt autoremove vim-tiny -y && touch $SCRIPT_LOG/remove_vim-tiny
$S3 && $S3 && $S3
fi
###########################################################################################################################
$SEPARADOR   
###########################################################################################################################
echo -e " Install Vim " && $S2
if [ -f "$SCRIPT_LOG/install_vim" ]; then
    echo -e " Realizado anteriormente " && $S3
    else
apt install -y vim && touch $SCRIPT_LOG/install_vim
$S3 && $S3 && $S3
fi
###########################################################################################################################
$SEPARADOR 
###########################################################################################################################
echo -e " Update & Upgrade APT " && $S2
if [ -f "$SCRIPT_LOG/up-upg-rem" ]; then
    echo -e " Realizado anteriormente " && $S3
    else
    apt list --upgradable
apt update && apt upgrade -y && apt update && apt upgrade -y && apt autoremove && touch $SCRIPT_LOG/up-upg-rem
$S3 && $S3 && $S3
fi
###########################################################################################################################
$SEPARADOR 
###########################################################################################################################
echo -e " Conf IP / DOMINIO / HOSTNAME " && $S2
if [ -f "$SCRIPT_LOG/conf-ip-host" ]; then
    echo -e " Realizado anteriormente " && $S3
    else
echo -e " IP "    
ip addr show  | grep inet | awk "{ print $2; }" | sed "s/\/.*$//" | grep -v inet6 && echo
echo -e " Host / Hostname / Dominio "
cat /etc/hosts | grep -v "::" | grep -v "#" && touch $SCRIPT_LOG/conf-ip-host && echo
$S3 && $S3 && $S3
fi
###########################################################################################################################
$SEPARADOR 
###########################################################################################################################
echo -e " Desabilitando SELINUX "
if [ -f "$SCRIPT_LOG/selinux" ]; then
    echo -e " Realizado anteriormente " && $S3
    else
apt install -y selinux-basics selinux-utils && sestatus && touch $SCRIPT_LOG/selinux
$S3 && $S3 && $S3
fi
###########################################################################################################################
$SEPARADOR 
###########################################################################################################################
echo -e " Preparando Install para O ASTERISK "
if [ -f "$SCRIPT_LOG/ast_dep2" ]; then
    echo -e " Realizado anteriormente " && $S3
    else
apt install -y pkg-config
apt install -y linux-headers-$(uname -r)
apt install -y binutils-dev freetds-dev git libbluetooth-dev libc-client2007e-dev libgsm1-dev \
libgtk2.0-dev libical-dev libiksemel-dev libldap2-dev liblua5.1-0-dev libneon27-dev libogg-dev libpopt-dev \
libpq-dev curl lynx apache2 sendmail sendmail-cf libresample1-dev libsnmp-dev libspandsp-dev \
libspeex-dev libspeexdsp-dev libsqlite0-dev libvorbis-dev libvpb-dev libxslt1-dev lua5.1 python-dev uuid \
portaudio19-dev mpg123 libxml2 libcurl4-openssl-dev sudo
apt install -y libcurl3 && apt autoremove -y && touch $SCRIPT_LOG/ast_dep2
$S3 && $S3 && $S3
fi
###########################################################################################################################
$SEPARADOR 
###########################################################################################################################
echo -e " DAHDI / DAHDI Tools do site Oficial "
if [ -f "$SCRIPT_LOG/dahdi" ]; then
    echo -e " Realizado anteriormente " && $S3
    else
cd /usr/src
DAHDI="http://downloads.asterisk.org/pub/telephony/dahdi-linux/dahdi-linux-current.tar.gz"
DAHDITOOLS="http://downloads.asterisk.org/pub/telephony/dahdi-tools/dahdi-tools-current.tar.gz"
	wget -O dahdi-linux.tar.gz $DAHDI | grep "downloads.asterisk.org" 
	tar -zxvf dahdi-linux.tar.gz && cd dahdi-linux*/ 
	./configure | grep -v Arquivo
  make clean | grep clean
  make all
  make install
  $S3
  cd ..
wget -O dahdi-tools.tar.gz $DAHDITOOLS
tar -zxvf dahdi-tools.tar.gz && cd dahdi-tools*/
  autoreconf -i 
  ./configure 
  make clean 
  make all 
  make install 
  make install-config
  apt install -y dahdi dahdi-linux dahdi-source
  touch $SCRIPT_LOG/dahdi
  cd ..
$S3 && $S3 && $S3
fi
###########################################################################################################################
$SEPARADOR 
###########################################################################################################################
echo -e " Install do LIBPRI do site Oficial "
if [ -f "$SCRIPT_LOG/libpri" ]; then
    echo -e " Realizado anteriormente " && $S3
    else
cd /usr/src
LIBPRI="http://downloads.asterisk.org/pub/telephony/libpri/libpri-current.tar.gz"
	wget -O libpri.tar.gz $LIBPRI  
	tar -zxvf libpri.tar.gz && cd libpri*/ 
	./configure 
	make clean 
  make all 
  make install 
  /usr/sbin/sestatus
touch $SCRIPT_LOG/libpri
$S3 && $S3 && $S3
fi
###########################################################################################################################
$SEPARADOR 
###########################################################################################################################
echo -e " Install do ASTERISK do site Oficial "
ASTERISK="http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16.15.1.tar.gz"
COUNTRYCODE="55"
cd /usr/src
if [ -f "$SCRIPT_LOG/asterisk" ]; then
    echo -e " Realizado anteriormente " && $S3
    else
	  wget -O asterisk.tar.gz $ASTERISK  && tar -zxvf asterisk.tar.gz && cd asterisk*/ 
	  bash contrib/scripts/get_mp3_source.sh && bash contrib/scripts/get_ilbc_source.sh
    bash contrib/scripts/install_prereq test && $S3
    bash contrib/scripts/install_prereq install-unpackaged  && bash contrib/scripts/install_prereq install
    ./configure --with-jansson-bundled
#./configure --with-pjproject-bundled --with-jansson-bundled &>> $AST_INSTALL
    make clean
    make menuselect && clear
    make
    make install
    make samples
    make basic-pbx
    make progdocs
    make config
    make install-logrotate
    systemctl enable asterisk && systemctl start asterisk && systemctl status asterisk  && $S3
    touch $SCRIPT_LOG/asterisk
$S3 && $S3 && $S3
fi
###########################################################################################################################
$SEPARADOR 
###########################################################################################################################
echo -e " Add user/group - Sound Pt_Br "

cd /usr/src
if [ -f "$SCRIPT_LOG/ast_add_sound" ]; then
echo -e " Realizado anteriormente " && $S3
    else
    groupadd asterisk
    useradd -r -d /var/lib/asterisk -g asterisk asterisk
    usermod -aG audio,dialout asterisk
    chown -Rv asterisk.asterisk /etc/asterisk
    chown -Rv asterisk.asterisk /var/{lib,log,spool}/asterisk
    chown -Rv asterisk.asterisk /usr/lib/asterisk
    PTBRCORE="https://www.asterisksounds.org/pt-br/download/asterisk-sounds-core-pt-BR-sln16.zip"
    PTBREXTRA="https://www.asterisksounds.org/pt-br/download/asterisk-sounds-extra-pt-BR-sln16.zip"
    SOUNDS="/var/lib/asterisk/sounds/pt_BR"
    mkdir $SOUNDS
    cd $SOUNDS
    cp -v -f $ARQ_MODIFICADOS/asterisk/convert.sh $SOUNDS
    wget -O core.zip $PTBRCORE && wget -O extra.zip $PTBREXTRA
    unzip -o core.zip && unzip -o extra.zip
    bash convert.sh
    chmod -Rv 775 /var/lib/asterisk/sounds/pt_BR
echo -e " Fazendo backup dos arquivos originais "
$S3
    mv -i -v -f /etc/default/asterisk /etc/default/asterisk.bk
    mv -i -v -f /etc/asterisk/asterisk.conf /etc/asterisk/asterisk.conf.bk
    mv -i -v -f /etc/asterisk/extensions.conf /etc/asterisk/extensions.conf.bkp
    mv -i -v -f /etc/asterisk/modules.conf /etc/asterisk/modules.conf.bkp
    mv -i -v -f /etc/asterisk/sip.conf /etc/asterisk/sip.conf.bkp
touch $SCRIPT_LOG/ast_add_sound
$S3 && $S3 && $S3
fi
###########################################################################################################################
$SEPARADOR 
###########################################################################################################################
echo -e " Arquivos prontos, editados e personalizados "
if [ -f "$SCRIPT_LOG/ast_arq_pers" ]; then
echo -e " Realizado anteriormente " && $S3
    else
  cp $ARQ_MODIFICADOS/asterisk/asterisk /etc/default/asterisk
  cp $ARQ_MODIFICADOS/asterisk/asterisk.conf /etc/asterisk/
  cp $ARQ_MODIFICADOS/asterisk/extensions.conf /etc/asterisk/
  cp $ARQ_MODIFICADOS/asterisk/modules.conf /etc/asterisk/
  cp $ARQ_MODIFICADOS/asterisk/sip.conf /etc/asterisk/ 
  cp $ARQ_MODIFICADOS/asterisk/ura.conf /etc/asterisk/
touch $SCRIPT_LOG/ast_arq_pers
$S3 && $S3 && $S3
fi
###########################################################################################################################
$SEPARADOR 
###########################################################################################################################    





AST_INSTALL="/root/asterisk" 
$AST_INSTALL

ARQ_MODIFICADOS="/root/asterisk/modificados" 
$ARQ_MODIFICADOS

SCRIPT_LOG="/script/log" 
$SCRIPT_LOG


echo -e " Fim dos teste "
read

    
  
  cp /var/lib/asterisk/sounds/pt_BR/letters/s.* /var/lib/asterisk/sounds/pt_BR/digits/
  cd /var/lib/asterisk/sounds/pt_BR/digits/
  mv -ivf s.alaw pt-sss.alaw ; mv s.ulaw pt-sss.ulaw ; mv s.gsm pt-sss.gms
  
  systemctl enable asterisk
  systemctl stop asterisk
  systemctl start asterisk
  systemctl status asterisk
  apt install -y net-tools
  netstat -an | grep 6666



libmariadb-dev libmariadbclient-dev mariadb-devel mariadb-server mariadb-client sqlite3 libsqlite3-dev
unixodbc-dev libpjproject-dev libpjsip2 libpjsip-ua2 libpjsip-simple2 libpjproject-dev libsrtp0-dev







