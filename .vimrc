" VIM-PLUG + PLUGINS
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins/
call plug#begin() | Plug 'preservim/nerdtree' | Plug 'ryanoasis/vim-devicons' | Plug 'jiangmiao/auto-pairs' | Plug 'junegunn/goyo.vim'  | Plug 'junegunn/limelight.vim' | Plug 'lilydjwg/colorizer' | call plug#end()

" Goyo Settings.
autocmd! User GoyoEnter Limelight     | autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 240 | let g:limelight_conceal_guifg = '#777777'

" NERDTree Settings.
let NERDTreeMinimalUI =1 | let NERDTreeDirArrows =1
let NERDTreeShowHidden=1 | let NERDTreeQuitOnOpen=1

" GENERAL
set encoding=utf-8
set mouse=a
set linebreak
set gdefault
set clipboard^=unnamed,unnamedplus
set background=dark
set viminfo=""
set virtualedit=onemore
set shortmess+=I
set wildmenu wildoptions=pum
set equalalways splitbelow splitright
set nobackup nowritebackup noswapfile
set incsearch hlsearch ignorecase smartcase wildignorecase
set backspace=indent,eol,start
filetype plugin on | filetype indent on | syntax enable

" KEYBINDINGS

" Leader key.
let g:mapleader = "\<Space>"

" Disable Recording & Ex Mode
map q <Nop>
map Q <Nop>

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
map <PageUp> <nop>
map <PageDown> <nop>

" : to ;
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Copies the contents of the entire file to clipboard
nnoremap <C-y> ggmqvG"+y'q

" File explorer
nnoremap <silent> <C-f> :NERDTreeToggle<CR>

" Toggle Goyo
nnoremap <leader><ENTER> :Goyo<CR>

" AUTOCOMMANDS

" Disable automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
