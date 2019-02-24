# Path to your oh-my-zsh installation.
export ZSH=/Users/hoganmcdonald/.oh-my-zsh

# Set Spaceship ZSH as a prompt
ZSH_THEME="spaceship"

# load zsh plugins
plugins+=(zsh-nvm)
source $ZSH/oh-my-zsh.sh

# Version Managers
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/composer/vendor/bin"
export PATH="/usr/local/sbin:$PATH"

# Aliases
alias ls='ls -G'
alias lt='tree'
alias ll='ls -lFha'
alias lh='ls -a | egrep "^\."'
alias ping='prettyping --nolegend'
alias cat='bat'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top='htop'
alias man='tldr'

# fzf open in vscode
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

# call nvm use when nvmrc is present
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Functions
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

# works well with rcrc
function rmrc() {
    lsrc | awk -F':' '{print $1}' | xargs rm
}
