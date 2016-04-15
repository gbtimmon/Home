# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export PATH=$PATH:$HOME/bin

unalias work 2>/dev/null; 
alias work="cd ~/Classes/CSC501/HW4/"

unalias save 2>/dev/null; 
alias save="git add \`find . -path ./.git -prune -o -name \* -print\` && git commit -m\"autosave\"&& git push;"


