#!/bin/bash
# Autor: Yuri Soares
# Data de criação: 07/10/2019

# Declarando a variável de download do AnyDesk
ANYDESK="https://download.anydesk.com/linux/anydesk_5.1.2-1_i386.deb"

echo -e "Atualizando as listas do Apt, aguarde..."
	apt update
echo -e "Listas atualizadas com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Atualizando o sistema, aguarde..."
	#opção do comando apt: -y (yes)
	apt -y upgrade
echo -e "Sistema atualizado com sucesso!!!, continuando com o script..."
sleep 5
echo
#

echo -e "Removendo software desnecessários, aguarde..."
	#opção do comando apt: -y (yes)
	apt -y autoremove 

echo -e "Software removidos com sucesso!!!, continuando com o script..."
sleep 5
echo

wget $ANYDESK -O anydesk.deb
echo -e "Anydesk baixado com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Instalando o AnyDesk, aguarde..."
	#opção do comando dpkg: -i (install)
	dpkg -i anydesk.deb
echo -e "AnyDesk instalado com sucesso!!!, continuando com o script..."
sleep 5
echo

read
exit 1