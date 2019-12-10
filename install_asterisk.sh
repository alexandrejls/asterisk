#!/bin/bash
echo -e "Instalando o Asterisk, aguarde..."
echo
#
echo -e "Instalando as dependências do Asterisk, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando apt: -y (yes) | $(uname -r) = kernel-release, \ (bar left) quedra de linha na opção do apt
	apt install -y build-essential libssl-dev libelf-dev libncurses5-dev libnewt-dev libxml2-dev linux-headers-$(uname -r) \
	libsqlite3-dev uuid-dev subversion libjansson-dev sqlite3 autoconf automake libtool libedit-dev flex bison libtool \
	libtool-bin unzip sox openssl zlib1g-dev unixodbc unixodbc-dev vim
echo -e "Dependências instaladas com sucesso!!!"
sleep 3
echo
#