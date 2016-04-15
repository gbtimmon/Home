#!/bin/bash
    
WELCOME[0]="Home Sweet Home"
WELCOME[1]="Home Is Where There Heart Is"
WELCOME[2]="Haha Charade You Are!" 
WELCOME[3]="I'm sorry, Dave. I'm afraid I can't do that."
MAX=4 
IND=$((RANDOM % MAX ))

echo $IND
echo ${WELCOME[IND]}

DIR=$(dirname "${0}")

function deploy { cp ${DIR}/${1} ~/.; . ~/${1}; }

deploy ".bash_profile";
deploy ".bashrc"; 
deploy ".vimrc";



