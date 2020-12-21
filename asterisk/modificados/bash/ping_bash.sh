#!/bin/bash
ERRO='e[31m'
SUCESSO='\e[32m'
AGUARDE='\e[36m'
echo
echo -e "${AGUARDE}  Efetuando testes, por favor aguarde!!" 
    if [ $? = "0" ]
        then
          echo
          ping -c4 8.8.8.8
          echo
            echo -e "${SUCESSO} INTERNET E CONEXÕES FUNCIONANDO"
            #cat /root/teste.txt | grep received
            
        else
          echo
          ping -c4 8.8.8.8
          echo
            echo -e "${ERRO} VERIFIQUE A INTERNET E CONEXÕES, PING NÃO FUNCIONA"
            #cat /root/teste.txt | 
            
fi