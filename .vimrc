colorscheme desert256

set nocompatible
set autoindent
set smartindent
set showmatch
set wildmenu
set wildmode=list:full
set hlsearch
set autochdir

set encoding=japan
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8

syntax on
filetype plugin indent on

set number
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']['.(&bomb?'bom':'nobom').']'}%=%l,%c%V%8P

set expandtab
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set incsearch
set virtualedit=block
set backspace=indent,eol,start

set history=1000

" keymappings
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk
nmap <silent> <C-n> :noh<CR>

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" backup

set backupdir=/tmp
set directory=/tmp
set noswapfile

" plugin
" https://github.com/junegunn/vim-plug

call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'qpkorr/vim-renamer'
call plug#end()

" plugin settings

nnoremap q :FZFMru<cr>
