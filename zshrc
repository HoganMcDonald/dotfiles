# Path to your oh-my-zsh installation.
export ZSH=/Users/hoganmcdonald/.oh-my-zsh

# Set Spaceship ZSH as a prompt
ZSH_THEME="spaceship"

# load zsh plugins
plugins=(
  zsh-nvm
)
source $ZSH/oh-my-zsh.sh

# Version Managers
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/composer/vendor/bin"
export PATH="/usr/local/sbin:$PATH"

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.6
source /usr/local/bin/virtualenvwrapper.sh

# Aliases
alias ls='ls -G'
alias lt='tree'
alias ll='ls -lFh'
alias lh='ls -a | egrep "^\."'

# Functions
function hidden-on() { 
    defaults write com.apple.Finder AppleShowAllFiles YES; 
}

function hidden-off() { 
    defaults write com.apple.Finder AppleShowAllFiles NO; 
}

function vimrc() {
    vim ~/dotfiles/vimrc &&
    rcup
}

function zshrc() {
    vim ~/dotfiles/zshrc &&
    rcup &&
    . ~/.zshrc
}

function print_path() {
    echo $PATH | sed $'s/:/\\\n/g'
}

# myIP address
function myip() {
    ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
	ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}
