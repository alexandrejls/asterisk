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
	apt upgrade 
echo -e "Listas atualizadas com sucesso!!!"
sleep 1
echo
#
