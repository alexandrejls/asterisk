#!/bin/bash
clear
echo -e "\n      -----=====-----=====>>>>> PING REDE INICIO <<<<<=====-----=====-----\n\n"
read -p "Digite a sua faixa de IP (ex:192.168.0. ): " faixa
read -p "Digite o número para iniciar: (ex:1) " inicio
read -p "Digite o número para terminar: (ex:255) " fim
echo -e "\n========================================================================="
echo -e "Pingando IP´s $faixa$inicio até $faixa$fim"
for((i=$inicio;i<=$fim;i++))
 do
   ok=`ping -c 1 $faixa$i | grep transmitted, | cut -d" " -f4`
   if [ $ok = 1 ]; then
   echo -e "\nMáquina $i $faixa$i ON"
   else
   echo -e "\nMáquina $i $faixa$i OFF"
   fi
done
echo -e "\n        -----=====-----=====>>>>> PING REDE FIM <<<<<=====-----=====-----"
echo -e "\nSCRIPT PING REDE CONCLUIDO COM SUCESSO!"
echo -e "Software desenvolvido por Alexandre J."
cat << EOF
EOF
echo -e "\n\n"