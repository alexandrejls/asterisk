#!/bin/bash
echo -e "Instalando as dependências do Asterisk, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando apt: -y (yes) | $(uname -r) = kernel-release, \ (bar left) quedra de linha na opção do apt
	apt install -y build-essential libssl-dev libelf-dev libncurses5-dev libnewt-dev libxml2-dev 
	apt install -y make wget openssl ncurses-base newt-tcl libxml2-dev gcc sqlite mysql-server
echo -e "Dependências instaladas com sucesso!!!"
sleep 3
echo
#
echo -e "Download e instalação do DAHDI, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando wget: -O (file)
	wget -O dahdi-linux.tar.gz $DAHDI
	# opção do comando tar: -z (gzip), -x (extract), -v (verbose), -f (file)
	tar -zxvf dahdi-linux.tar.gz
	# acessando diretório do dahdi-linux
	cd dahdi-linux*/ 
	# preparação e configuração do source para compilação
	./configure 
	# desfaz o processo de compilação anterior
	make clean  
	# compila todas as opções do software
	make all  
	# executa os comandos para instalar o programa
	make install 
	# opção do comando cd: .. (dois pontos sequenciais - Subir uma pasta)
	cd ..
echo -e "DAHDI instalado com sucesso!!!, continuando com o script..."
sleep 5
echo	
#
