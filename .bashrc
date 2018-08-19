stty -ixon
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE=

# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).
if [ "$EUID" -ne 0 ]; then
  export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\$(vcprompt -f \" %s:%b%m\")\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
else
  export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi

# System Maintainence
alias progs="(pacman -Qet && pacman -Qm) | sort -u" # List programs I've installed
alias orphans="pacman -Qdt" # List orphan programs
alias sdn="sudo shutdown now"

# Some aliases
alias p="sudo pacman"
alias SS="sudo systemctl"
alias v="nvim"
alias vi="nvim"
alias sv="sudo nvim"
alias r="ranger"
alias sr="sudo ranger"
alias ka="killall"
alias g="git"
alias trem="transmission-remote"
alias mkd="mkdir -pv"
alias rf="source ~/.bashrc"
alias ref="shortcuts.sh && source ~/.bashrc" # Refresh shortcuts manually and reload bashrc

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=always" # Color grep - highlight desired sequence.
alias ccat="highlight --out-format=xterm256" #Color cat - print file with syntax highlighting.

export PAGER=most

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio
alias ytv="youtube-viewer"
alias ethspeed="speedometer -r enp0s25"
alias wifispeed="speedometer -r wlp3s0"

source ~/.shortcuts

