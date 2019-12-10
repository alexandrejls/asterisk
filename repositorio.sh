#!/bin/bash
echo -e "Adicionando o Repositório Universal do Apt..."
	# opção do comando: &>> (redirecionar a saída padrão)
	add-apt-repository universe 
echo -e "Repositório adicionado com sucesso!!!"
sleep 5
echo
#
echo -e "Adicionando o Repositório Multiversão do Apt..."
	# opção do comando: &>> (redirecionar a saída padrão)
	add-apt-repository multiverse 
echo -e "Repositório adicionado com sucesso!!!"
sleep 5
echo
#
echo -e "Atualizando as listas do Apt, aguarde..."
	#opção do comando: &>> (redirecionar a saída padrão)
	apt update 
echo -e "Listas atualizadas com sucesso!!!"
sleep 1
echo
#
