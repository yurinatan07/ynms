#!/bin/bash
# Autor: Robson Vaamonde
# Site: www.procedimentosemti.com.br
# Facebook: facebook.com/ProcedimentosEmTI
# Facebook: facebook.com/BoraParaPratica
# YouTube: youtube.com/BoraParaPratica
# Data de cria��o: 22/11/2018
# Data de atualiza��o: 10/02/2019
# Vers�o: 0.04
# Testado e homologado para a vers�o do Ubuntu Server 18.04.x LTS x64
# Kernel >= 4.15.x
#
# Extensible Messaging and Presence Protocol (XMPP) (conhecido anteriormente como Jabber) � um protocolo aberto,
# extens�vel, baseado em XML, para sistemas de mensagens instant�neas, desenvolvido originalmente para mensagens
# instant�neas e informa��o de presen�a formalizado pelo IETF. Softwares com base XMPP s�o distribu�dos em milhares
# de servidores atrav�s da internet, e usados por cerca de dez milh�es de pessoas em todo mundo, de acordo com a 
# XMPP Standards Foundation.
#
# O Openfire (anteriormente conhecido como Wildfire e Jive Messenger) � um servidor de mensagens instant�neas e de
# conversas em grupo que usa o servidor XMPP escrito em Java e licenciado sob a licen�a Apache 2.0.
#
# Site Oficial do OpenFire: https://www.igniterealtime.org/projects/openfire/
#
# V�deo de instala��o do GNU/Linux Ubuntu Server 18.04.x LTS: https://www.youtube.com/watch?v=zDdCrqNhIXI
# V�deo de instala��o do LAMP Server no GNU/Linux Ubuntu Server 18.04.x LTS: https://www.youtube.com/watch?v=6EFUu-I3u4s
#
# Vari�vel da Data Inicial para calcular o tempo de execu��o do script (VARI�VEL MELHORADA)
# op��o do comando date: +%T (Time)
HORAINICIAL=`date +%T`
#
# Vari�veis para validar o ambiente, verificando se o usu�rio e "root", vers�o do ubuntu e kernel
# op��es do comando id: -u (user), op��es do comando: lsb_release: -r (release), -s (short), 
# op�es do comando uname: -r (kernel release), op��es do comando cut: -d (delimiter), -f (fields)
USUARIO=`id -u`
UBUNTU=`lsb_release -rs`
KERNEL=`uname -r | cut -d'.' -f1,2`
#
# Vari�vel do caminho do Log dos Script utilizado nesse curso (VARI�VEL MELHORADA)
# op��es do comando cut: -d (delimiter), -f (fields)
# $0 (vari�vel de ambiente do nome do comando)
LOG="/var/log/$(echo $0 | cut -d'/' -f2)"
#
# Declarando as variaveis para cria��o da Base de Dados do OpenFire
USER="root"
PASSWORD="pti@2018"
# op��o do comando create: create (cria��o), database (base de dados), base (banco de dados)
# op��o do comando create: create (cria��o), user (usu�rio), identified by (indentificado por - senha do usu�rio), password (senha)
# op��o do comando grant: grant (permiss�o), usage (uso em | uso na), *.* (todos os bancos/tabelas), to (para), user (us�rio)
# identified by (indentificado por - senha do usu�rio), password (senha)
# op�es do comando GRANT: grant (permiss�o), all (todos privilegios), on (em ou na | banco ou tabela), *.* (todos os bancos/tabelas)
# to (para), user@'%' (usu�rio @ localhost), identified by (indentificado por - senha do usu�rio), password (senha)
# op��o do comando FLUSH: flush (atualizar), privileges (recarregar as permiss�es)
DATABASE="CREATE DATABASE openfire;"
USERDATABASE="CREATE USER 'openfire' IDENTIFIED BY 'openfire';"
GRANTDATABASE="GRANT USAGE ON *.* TO 'openfire' IDENTIFIED BY 'openfire';"
GRANTALL="GRANT ALL PRIVILEGES ON openfire.* TO 'openfire';"
FLUSH="FLUSH PRIVILEGES;"
#
# Declarando a vari�vel de download do OpenFire
OPENFIRE="https://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_4.2.3_all.deb"
#
# Verificando se o usu�rio e Root, Distribui��o e >=18.04 e o Kernel >=4.15 <IF MELHORADO)
# [ ] = teste de express�o, && = operador l�gico AND, == compara��o de string, exit 1 = A maioria dos erros comuns na execu��o
clear
if [ "$USUARIO" == "0" ] && [ "$UBUNTU" == "18.04" ] && [ "$KERNEL" == "4.15" ]
	then
		echo -e "O usu�rio e Root, continuando com o script..."
		echo -e "Distribui��o e >=18.04.x, continuando com o script..."
		echo -e "Kernel e >= 4.15, continuando com o script..."
		sleep 5
	else
		echo -e "Usu�rio n�o e Root ($USUARIO) ou Distribui��o n�o e >=18.04.x ($UBUNTU) ou Kernel n�o e >=4.15 ($KERNEL)"
		echo -e "Caso voc� n�o tenha executado o script com o comando: sudo -i"
		echo -e "Execute novamente o script para verificar o ambiente."
		exit 1
fi
#
# Verificando se as depend�ncais do OpenFire est�o instaladas
# op��o do dpkg: -s (status), op��o do echo: -e (intepretador de escapes de barra invertida), -n (permite nova linha)
# || (operador l�gico OU), 2> (redirecionar de sa�da de erro STDERR), && = operador l�gico AND, { } = agrupa comandos em blocos
# [ ] = testa uma express�o, retornando 0 ou 1, -ne = � diferente (NotEqual)
echo -n "Verificando as depend�ncias, aguarde... "
	for name in mysql-server mysql-common
	do
  		[[ $(dpkg -s $name 2> /dev/null) ]] || { echo -en "\n\nO software: $name precisa ser instalado. \nUse o comando 'apt install $name'\n";deps=1; }
	done
		[[ $deps -ne 1 ]] && echo "Depend�ncias.: OK" || { echo -en "\nInstale as depend�ncias acima e execute novamente este script\n";exit 1; }
		sleep 5
#		
# Script de instala��o do OpenFire no GNU/Linux Ubuntu Server 18.04.x
# op��o do comando echo: -e (enable interpretation of backslash escapes), \n (new line)
# op��o do comando hostname: -I (all IP address)
# op��o do comando date: + (format), %d (day), %m (month), %Y (year 1970), %H (hour 24), %M (minute 60)
echo -e "In�cio do script $0 em: `date +%d/%m/%Y-"("%H:%M")"`\n" &>> $LOG
clear
echo -e "Instala��o do OpenFire no GNU/Linux Ubuntu Server 18.04.x\n"
echo -e "Ap�s a instala��o do OpenFire acessar a URL: http://`hostname -I | cut -d' ' -f1`:9090/\n"
echo -e "Aguarde, esse processo demora um pouco dependendo do seu Link de Internet..."
sleep 5
echo
#
echo -e "Adicionando o Reposit�rio Universal do Apt, aguarde..."
	#op��o do comando: &>> (redirecionar de sa�da padr�o)
	add-apt-repository universe &>> $LOG
echo -e "Reposit�rio adicionado com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Atualizando as listas do Apt, aguarde..."
	#op��o do comando: &>> (redirecionar de sa�da padr�o)
	apt update &>> $LOG
echo -e "Listas atualizadas com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Atualizando o sistema, aguarde..."
	#op��o do comando: &>> (redirecionar de sa�da padr�o)
	#op��o do comando apt: -y (yes)
	apt -y upgrade &>> $LOG
echo -e "Sistema atualizado com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Removendo software desnecess�rios, aguarde..."
	#op��o do comando: &>> (redirecionar de sa�da padr�o)
	#op��o do comando apt: -y (yes)
	apt -y autoremove &>> $LOG
echo -e "Software removidos com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Instalando o OpenFire, aguarde..."
echo
#
echo -e "Instalando as depend�ncias do OpenFire, aguarde..."
	#op��o do comando: &>> (redirecionar de sa�da padr�o)
	#op��o do comando apt: -y (yes)
	apt -y install openjdk-8-jdk openjdk-8-jre &>> $LOG
echo -e "Instala��o das depend�ncias feita com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Verificando a vers�o do Java, aguarde..."
	#op��o do comando: &>> (redirecionar de sa�da padr�o)
	java -version &>> $LOG
echo -e "Vers�o verificada com sucesso!!!, continuando com o script..."
sleep 5
echo
#				 
echo -e "Criando o Banco de Dados do OpenFire, aguarde..."
	#op��o do comando: &>> (redirecionar de sa�da padr�o)
	#op��o do comando mysql: -u (user), -p (password), -e (execute)
	mysql -u $USER -p$PASSWORD -e "$DATABASE" mysql &>> $LOG
	mysql -u $USER -p$PASSWORD -e "$USERDATABASE" mysql &>> $LOG
	mysql -u $USER -p$PASSWORD -e "$GRANTDATABASE" mysql &>> $LOG
	mysql -u $USER -p$PASSWORD -e "$GRANTALL" mysql &>> $LOG
	mysql -u $USER -p$PASSWORD -e "$FLUSH" mysql &>> $LOG	
echo -e "Banco de Dados criado com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Baixando o OpenFire do site oficial, aguarde..."
	#op��o do comando: &>> (redirecionar de sa�da padr�o)
	#op��o do comando wget: -O (output document file)
	wget $OPENFIRE -O openfire.deb &>> $LOG
echo -e "OpenFire baixado com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Instalando o OpenFire, aguarde..."
	#op��o do comando: &>> (redirecionar de sa�da padr�o)
	#op��o do comando dpkg: -i (install)
	dpkg -i openfire.deb &>> $LOG
echo -e "OpenFire instalado com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Verificando a porta de conex�o do OpenFire, aguarde..."
	#op��o do comando netstat: -a (all), -n (numeric)
	netstat -an | grep 9090
echo -e "Porta de conex�o verificada com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Instala��o do OpenFire feita com Sucesso!!!"
	# script para calcular o tempo gasto (SCRIPT MELHORADO, CORRIGIDO FALHA DE HORA:MINUTO:SEGUNDOS)
	# op��o do comando date: +%T (Time)
	HORAFINAL=`date +%T`
	# op��o do comando date: -u (utc), -d (date), +%s (second since 1970)
	HORAINICIAL01=$(date -u -d "$HORAINICIAL" +"%s")
	HORAFINAL01=$(date -u -d "$HORAFINAL" +"%s")
	# op��o do comando date: -u (utc), -d (date), 0 (string command), sec (force second), +%H (hour), %M (minute), %S (second), 
	TEMPO=`date -u -d "0 $HORAFINAL01 sec - $HORAINICIAL01 sec" +"%H:%M:%S"`
	# $0 (vari�vel de ambiente do nome do comando)
	echo -e "Tempo gasto para execu��o do script $0: $TEMPO"
echo -e "Pressione <Enter> para concluir o processo."
# op��o do comando date: + (format), %d (day), %m (month), %Y (year 1970), %H (hour 24), %M (minute 60)
echo -e "Fim do script $0 em: `date +%d/%m/%Y-"("%H:%M")"`\n" &>> $LOG
read
exit 1