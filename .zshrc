# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/Richie/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#changing vim to nvim
alias vim='nvim'
alias lim='lvim'
alias oldvim='/vim'
##simplify root privs
alias doas='doas --'
alias sudo='doas'
# dnf and yum
alias dinstall='doas dnf install'
alias dremove='doas dnf remove'
alias dnupdate='doas dnf update'
alias cleanplate='doas yum clean packages'
alias localplate='doas yum localinstall'
alias upplate='doas yum update'
# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'
### git -e- up ###
alias gclone='git clone'
alias gcommit='git commit'
alias gpush='git push'
### alias anime ###
alias anime='ani-cli'
### take me home ###
alias casa='cd ~'
# clear terminal 
alias cl='clear'
## browser-sync config
# get local ip address
export SERVER_IP='hostname -I'
# browser-sync server alias for multi-device private network server
alias privnet='browser-sync start --serve --files . --no-notify --host $SERVER_IP --port 9000'
alias serve='browser-sync start --serve --files .'

### Path ##
export PATH=/home/Richie/.cargo/bin:$PATH


### random colorscript ###
#colorscript random
cat ~/cosmiclust | lolcat
### setting the starship prompt ###
eval "$(starship init zsh)"

source /home/Richie/.config/broot/launcher/bash/br
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
alias config='/usr/bin/git --git-dir=/home/Richie/.cfg/ --work-tree=/home/Richie'
