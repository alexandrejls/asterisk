#!/bin/bash
#
echo -e "Atualizando as listas do Apt, aguarde..."
	#opção do comando: &>> (redirecionar a saída padrão)
	apt update 
echo -e "Listas atualizadas com sucesso!!!"
sleep 1
echo
#
#
echo -e "Baixando e instalando atualizações, aguarde..."
	#opção do comando: &>> (redirecionar a saída padrão)
	yes | apt upgrade 
echo -e "Listas atualizadas com sucesso!!!"
sleep 1
echo
#
echo -e "Removendo software desnecessários, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando apt: -y (yes)
	apt -y autoremove 
echo -e "Software removidos com sucesso!!!"
sleep 1
echo
#
