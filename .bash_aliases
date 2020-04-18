function cd {
    case $1 in
        "")
            pushd $HOME > /dev/null
            ;;
        "-")
            [ $# -eq 1 ] &&[ `dirs | wc -w` -gt 1 ] && popd > /dev/null
            [ $# -eq 2 ] && pushd +$2 > /dev/null
            ;;
        "")
            [ -d $1 ] && pushd $1 > /dev/null
            ;;
        *)
            [ -d $1 ] && pushd $1 > /dev/null
            ;;
    esac
}

function p {
	now=`pwd`
	cnt=`dirs -v|wc --lines`
	for i in `seq 1 $cnt`
	do
		popd >& /dev/null
	done
	cd "$now"
}
alias d='dirs -v'

alias cd1='cd ../'
alias cd2='cd ../../'
alias cd3='cd ../../../'
alias cd4='cd ../../../../'
alias cd5='cd ../../../../../'

alias l='ls'
alias la='ls -a'
alias ll='ls -lh --sort=extension'

alias v='view'
alias df='df -h'
alias eman='LANG=C man'

alias w3m='w3m google.com'

## ALIASES
alias htb='sudo openvpn $HOME/share/meruneru.ovpn'

