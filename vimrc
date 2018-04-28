set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"Plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
Plugin 'fugitive.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tomasiser/vim-code-dark'

call vundle#end()           " required
filetype plugin indent on   " requiredn

" basic settings
set smartindent             " smart indenting
set tabstop=4               " tab = 4 spaces
set shiftwidth=4            " width of shift is 4 characters
set expandtab               " expand tabs
set backspace=2             " backspace in insert mode works like normal editor
set linebreak               " Causes vim to not wrap text in the middle of a word
set autoindent              " auto indenting
set nobackup                " get rid of anoying ~file
set pastetoggle=<F9>        " Useful so auto-indenting doesn't mess up code when pasting
set backspace=indent,eol,start
set showcmd                 " show command in bottom bar

" ui settings
set showmatch               " highlight matching [{()}]
set number                  " line numbers
filetype indent on          " activates indenting for files

syntax enable               " syntax highlighting

"For proper tabbing and bracket insertion"
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>
