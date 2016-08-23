#!/bin/bash

###########
#
# Author  : Greg Timmons
# Purpose : Quick install of any *nix style environment
#
###########
    
###########
#
# PART 0 : verify that script is sourced. 
#
###########

called=$_
if [[ $called = $0 ]]; then
    echo "Script is being run, must source this script.";
    exit 1; 
fi 

###########
#
# PART 1 : P
#
###########

WELCOME[0]="Home Sweet Home"
WELCOME[1]="Home Is Where There Heart Is"
WELCOME[2]="Haha Charade You Are!" 
WELCOME[3]="I'm sorry, Dave. I'm afraid I can't do that."
SIZE=${#WELCOME[@]};
IND=$((RANDOM % SIZE ));

echo "+--------------------------"; 
echo "| Welcome Home Greg";
echo "| 4/15/2016";
echo "+--------------------------"; 
echo "| ${WELCOME[ IND ]} "; 
echo "+--------------------------"; 

DIR=$(dirname "${BASH_SOURCE[@]}")

######################
#
# PART 1 : DEPLOY THE ENV. 
#
######################

function deploy { echo "Deploy ${1}"; cp ${DIR}/${1} ~/.; }

deploy ".bash_profile";
deploy ".bashrc"; 
deploy ".vimrc";

. ~/.bash_profile;
. ~/.bashrc;

######################
#
# PART 2 : Install extra vim support
#
######################
if [ -d ~/.vim ];  then
    mkdir ~/.vim
fi;

if [ -d ~/.vim/yntax ]; then
    mkdir ~/.vim/syntax
fi;

cp ${DIR}/vim_syntax/ ~/.vim/syntax


######################
#
# install the Classes repo. 
######################
if [ -d ~/Classes ]; then
    echo "Classes repo already seeems to be installed. Skipping. ";
else 
    echo "Installing the classes repo.";
    TDIR=$(pwd);
    cd ~;
    git clone https://gbtimmon:rusty1288@github.com/gbtimmon/Classes.git;
fi; 

#install extras!
for var in "$@"
do
    echo "Installing \"$var\""

    if [ "X$var" = "Xgo" ];
    then 
        sudo yum install golang
    fi

    if [ "X$var" = "Xlamp" ];
    then 
        sudo sh -c "yum install httpd httpd-devel mysql mysql-server mysql-devel php \
                                php-mysql php-common php-gd php-mbstring php-mcrypt \
                                php-devel php-xml -y; 
                    service mysqld start && 
                    mysql_secure_installation && 
                    service mysqld restart && 
                    service httpd start && 
                    chkconfig httpd on && 
                    chkconfig mysqld on && 
                    iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT && 
                    /etc/init.d/iptables save"
    fi
done 
