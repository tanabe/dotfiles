if &term == "xterm-256color"
  set t_Co=256
  colorscheme desert256
else
  colorscheme desert
endif

set nocompatible
set autoindent
set smartindent
set ignorecase
set showmatch
set wildmenu
set wildmode=list:longest
set hlsearch

set encoding=japan
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8

syntax on
filetype on
filetype indent on
filetype plugin on

set number
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

set expandtab
set tabstop=2
set shiftwidth=2
set smartcase
set textmode

imap <C-b> <Left>
imap <C-f> <Right>
nnoremap j gj
nnoremap k gk
nnoremap ; :
nmap <silent> <C-n> :noh<CR>


autocmd BufRead *.html,*.css*.js call AutomaticallySetIndentStyle()

"backup
se backupdir=/tmp
se directory=/tmp

"vimrc編集
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>

"auto complete
set complete+=k

"function
"escape
function! EscapeHTMLSpecialChars() range
  let n = a:firstline
  while n <= a:lastline
    let target = getline(n)
    let target = substitute(target, "\&", "\\&amp;", "g")
    let target = substitute(target, "<", "\\&lt;", "g")
    let target = substitute(target, ">", "\\&gt;", "g")
    call setline(n, target)
    let n = n + 1
  endwhile
endfunction

"dict
autocmd FileType javascript :set dictionary=$HOME/.vim/dict/javascript.dict
autocmd FileType php :set dictionary=$HOME/.vim/dict/php.dict

"plugin
"acp
"ポップアップメニューのカラーを設定
hi Pmenu guibg=#666666
hi PmenuSel guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333

"closetag
let g:closetag_html_style=1
au Filetype html,xml,xsl,ant source $HOME/.vim/macros/closetag.vim


