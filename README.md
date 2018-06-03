# What tools do you use?

This file is a collection of tools that I use in my dev environment. I started it as a fork of the Thoughbot [Dotfiles](https://github.com/thoughtbot/dotfiles) repo on github. However, It is almost completely different.

This repo uses a tool called rcm to manage dotfiles in your home directory by creating symlinks to this repo. This allows me to manage my configuration files using git and share them easily accross different machines (work and home). 

What this means is that you will never touch your `.zshrc` ever again. The basic pattern is that you create a file without the dot in this repo like `zshrc` and it gets symlinked to your `.zshrc`.

If you choose to use this, you will need a few things.

## Requirements

1. [homebrew](https://brew.sh/) - essential package manager for OSX.
2. [node](https://nodejs.org/en/)
```bash
# install node version manager. You'll thank me later.
brew install nvm 
# install latest version of node.
nvm install 10 
# use it.
nvm use 10 
```

3. [rcm](https://github.com/thoughtbot/rcm) - for managing rc files in the way described above.
```bash
brew install rcm
```

4. zsh - set as your login shell instead of bash.
- OSX comes with a system version, but you should probably use homebrew instead... 
```bash
brew install zsh

which zsh 
# should say /usr/local/bin/zsh

# change login shell
chsh -s $(which zsh) 
```

5. [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) - for mananging your zsh plugins
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

6. [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts) - These give you cool icons and monospace fonts that are used by other tools.
```bash
brew tap caskroom/fonts
brew cask install font-hack-nerd-font
```

7. [spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt)
- I am choosing to use oh-my-zsh to install this, but you can use npm or whatever method you please.
```bash
# clone the repo into custom zsh
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

# Create a symlink to your custom oh-my-zsh theme 
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

8. [zsh-nvm](https://github.com/lukechilds/zsh-nvm)
```bash
# clone the repo into custom zsh
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm


```

8. [vundle](https://github.com/VundleVim/Vundle.vim)
- tool for managing and installing vim plugins
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Install

```bash
# clone this repo into your home directory
git clone git@github.com:HoganMcDonald/dotfiles.git ~/dotfiles 

# this will use the included rcrc file and feed it to the rcup command
env RCRC=$HOME/dotfiles/rcrc rcup 
```

### vim

```bash
#open vim from anywhere
vim 
```

In vim
```vim
:PluginInstall
```

## Commands

```bash
rcup # this will update your dotfiles to match what is in tyour /dotfiles repo
rcdn # opposite of rcup
lsrc # list the dotfiles managed by rcm
mkrc # create a new dotfile to be managed by rcm
```

## local customizations

rcm allows you to have local customizations that are not tracked by git. All you need to do is create a local directory for putting your customizations called `~/dotfiles-local`. One common usage is for setting up your remote git credentials. Since I use this repo for work and home, I wrote a script that will create the folder, file, and open vim for you. just run:

```bash
sh bin/git-setup.sh
```
