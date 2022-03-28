#                                                                      
#     $$$$$$\  $$\   $$\  $$$$$$$\  $$$$$$\   $$$$$$\   $$$$$$$\  $$$$$$\  
#    $$  __$$\ $$ |  $$ |$$  _____|$$  __$$\  \____$$\ $$  _____|$$  __$$\ 
#    $$ |  \__|$$ |  $$ |\$$$$$$\  $$ /  $$ | $$$$$$$ |$$ /      $$$$$$$$ |
#    $$ |      $$ |  $$ | \____$$\ $$ |  $$ |$$  __$$ |$$ |      $$   ____|
#    $$ |      \$$$$$$$ |$$$$$$$  |$$$$$$$  |\$$$$$$$ |\$$$$$$$\ \$$$$$$$\ 
#    \__|       \____$$ |\_______/ $$  ____/  \_______| \_______| \_______|
#              $$\   $$ |          $$ |                                    
#              \$$$$$$  |          $$ |                                    
#               \______/           \__|                                    
#
#       Personal bash configuration of Ryan Hoover <ryan@ryspace.xyz>
#
#-------------------------------------------------------------------------------
#
# GENERAL SETUP STUFF
#
#-------------------------------------------------------------------------------

case $- in
    *i*) ;;
    *) return;;
esac

shopt -s histappend
shopt -s checkwinsize

if [ -x /usr/bin/dircolors ]; then
    test -r ~.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

export THEME=$HOME/.config/bash/themes/agnoster-bash/agnoster.bash
if [[ -f $THEME ]]; then
    export DEFAULT_USER='whoami'
    source $THEME
fi

#-------------------------------------------------------------------------------
#
# ENVIRONMENT
#
#-------------------------------------------------------------------------------

extract () {
    if [ -z "$1"] ; then
        echo "usage: extract ."
    elif [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xvjf ./$1 ;;
            *.tar.gz) tar xvzf ./$1 ;;
            *.tar.xz) tar xvJf ./$1 ;;
            *.lzma) unlzma ./$1 ;;
            *.bz2) bunzip2 ./$1 ;;
            *.rar) unrar ./$1 ;;
            *.gz) gunzip ./$1 ;;
            *.tar) tar xvf ./$1 ;;
            *.tbz2) tar xvjf ./$1 ;;
            *.tgz) tar xvzf /.$1 ;;
            *.zip) unzip ./$1 ;;
            *.Z) uncompress ./$1 ;;
            *.7z) unxz ./$1 ;;
            *.exe) cabextract ./$1 ;;
            *) echo "Extract: '$1' - Unknown archive method" ;;
        esac
    else
        echo "$1 - File does not exist"
    fi
}

forecast () {
    curl wttr.in/$1
}

#-------------------------------------------------------------------------------
#
# ALIASES
#
#-------------------------------------------------------------------------------

alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias lz='ls --human-readable --size -1 -S --classify'

alias bashrc='nvim $XDG_CONFIG_HOME/bash/.bashrc'
alias calcurse='calcurse -C "$XDG_CONFIG_HOME/calcurse" -D "$XDG_DATA_HOME/calcurse"'
alias dotfiles='/usr/bin/git --git-dir=$HOME/repos/dotfiles/ --work-tree=$HOME'
alias mkdir='mkdir -pv'
alias mkpass='apg -a 1 -m 36'
alias pv='pipe-viewer _SV'
alias vim='nvim'
alias wget='wget --hsts-file="/home/ryan/.local/share/wget/wget-hsts"'
