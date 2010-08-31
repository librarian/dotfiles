#if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
#	while true
#		do
#			startx --
#			sleep 10
#		done
#fi 

#[ ! -S ~/.ssh/ssh-agent ] && eval `/usr/bin/ssh-agent -a ~/.ssh/ssh-agent`
#[ -z $SSH_AUTH_SOCK ] && export SSH_AUTH_SOCK=~/.ssh/ssh-agent

[ -z "$PS1" ] && return
if [[ $- != *i* ]] ; then
         return
fi
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
if [ -f ~/.bash_completition ]; then
		. ~/.bash_completition
fi
if [ -f ~/.dir_colors ]; then
            eval `dircolors ~/.dir_colors`
fi
if [ -d /usr/lib/ccache ] ; then
            PATH="/usr/lib/ccache:${PATH}"
fi
echo -e '\e%G'
PATH=/usr/lib/ccache:/bin:/usr/bin:/usr/local/bin:/usr/X11R6/bin:/sbin:/usr/sbin:/usr/local/sbin:~/.bin:/usr/games/
set meta-flag on
set convert-meta off
set output-meta on

export LANG=ru_RU.UTF-8
export LC_ALL=ru_RU.UTF-8
export DEBFULLNAME='Nikita A Menkovich'
export DEBEMAIL='menkovich@gmail.com'
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
export HISTSIZE=1000
export EDITOR=/usr/bin/vim
export DATABASE=/home/lib/compile/pidgin_monotone/pidgin.mtn
export WORKINGDIR=/home/lib/compile/pidgin-dev
export HISTIGNORE="&:ls:[bf]g:exit:bash:[cxh]:a\ "
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export BLUETOOTH=00:1D:6E:BC:E6:A7
export CONCURRENCY_LEVEL=5
export MPD_HOST=localhost
export MPD_PORT=6600
export KEY=CFD13C6D
complete -cf sudo
set -o noclobber
#set -o ignoreeof
shopt -s checkwinsize
shopt -s cdspell
shopt -s histappend
shopt -s dotglob
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
BGREEN='\[\033[1;32m\]'
GREEN='\[\033[0;32m\]'
BRED='\[\033[1;31m\]'
RED='\[\033[0;31m\]'
BBLUE='\[\033[1;34m\]'
BLUE='\[\033[0;34m\]'
NORMAL='\[\033[00m\]'

if [[ "$UID" == "0" ]] ; then
		echo -ne "\n"
		echo -ne "root...\n"
		echo -ne "\n";		
		PS1="${BRED}\u ${BGREEN}\h ${BBLUE}\W ${BRED}# ${NORMAL}"
	else
		echo -ne "\n"
		echo -ne "Hello The Choosen One\n"
		echo -ne "uptime:"; uptime;
		echo -ne "Date:"; date;
		echo -ne "\n";
		PS1="${BGREEN}\u ${BRED}\h ${BBLUE}\W ${BGREEN}\$ ${NORMAL}"
fi


function ebrc() {
	vim ~/.bashrc
	bash
}
ex () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1        ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       rar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xf $1        ;;
            *.tbz2)      tar xjf $1      ;;
            *.tgz)       tar xzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
pk () {
    if [ $1 ] ; then
        case $1 in
            tbz)   	tar cjvf $2.tar.bz2 $2      ;;
            tgz)   	tar czvf $2.tar.gz  $2   	;;
            tar)  	tar cpvf $2.tar  $2       ;;
			bz2)	bzip $2 ;;
            gz)		gzip -c -9 -n $2 > $2.gz ;;	
			zip)   	zip -r $2.zip $2   ;;
            7z)    	7z a $2.7z $2    ;;
            *)     	echo "'$1' cannot be packed via pk()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

hgrep() {
		grep $1 /etc/hosts
}

start() {
    sudo /etc/init.d/$1 start
}

stop() {
    sudo /etc/init.d/$1 stop
}

restart() {
    sudo /etc/init.d/$1 restart
}

alarm() {
				echo "/usr/bin/mpc play" | at $1
}
pwdgen() {
    perl <<EOPERL
    my @a = ("a".."z","A".."Z","0".."9",(split //, q{#@,.<>$%&()*^}));
    for (1..10) {
      print join "", map { \$a[rand @a] } (1..rand(3)+10);
      print qq{\n}
    }
EOPERL
}
mk () {
	time fakeroot make-kpkg --initrd --append-to-version -$1 kernel_image kernel_headers
}
powersave() {
	echo powersave | sudo tee -a /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor 
	echo powersave | sudo tee -a /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
}
performance() {
	echo performance | sudo tee -a /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor 
	echo performance | sudo tee -a /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
}
sup() {
	ssh ${1}1@${1}
}

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias dakar='ssh librarian@dakar.sweb.ru'
alias logs='ssh support@mail'
alias ncmpc='ncmpc -c'
alias ping='ping -c 5'
alias ai='sudo aptitude install'
alias au='sudo aptitude update'
alias ag='sudo aptitude upgrade'
alias abu='sudo apt-get build-dep'
alias as='aptitude search'
alias whois='colorwhois'
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'
alias mm="make menuconfig"
