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
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ryanoasis/vim-devicons'

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
set encoding=UTF-8          " set for file icons
filetype indent on          " activates indenting for files
syntax enable               " syntax highlighting

"For proper tabbing and bracket insertion"
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>
nnoremap o o<Esc>
nnoremap O O<Esc>
nnoremap \ :Ag<SPACE>

"Plugin Settings
"autocmd vimenter * NERDTree

"Custom Commands
:command NE NERDTree

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

