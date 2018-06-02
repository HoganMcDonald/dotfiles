# Version Managers
export PATH="$PATH:$HOME/.rvm/bin"
source ~/.zsh-nvm/zsh-nvm.plugin.zsh

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/projects
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.6
source /usr/local/bin/virtualenvwrapper.sh

# Aliases
alias lt='tree'
alias ll='ls -la'
alias lh='ls -a | egrep "^\."'
alias gitter='git rev-parse --abbrev-ref HEAD'
alias cleanup='git branch | grep -v "master" | xargs git branch -d'

# Functions
function hiddenOn() { defaults write com.apple.Finder AppleShowAllFiles YES ; }
function hiddenOff() { defaults write com.apple.Finder AppleShowAllFiles NO ; }
function vimrc() {
    vim ~/dotfiles/vimrc &&
    rcup
}
function zshrc() {
    vim ~/dotfiles/zshrc &&
    rcup &&
    . ~/.zshrc
}

# myIP address
function myip() {
    ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
	ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}
