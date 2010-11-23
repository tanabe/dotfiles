set t_Co=256
colorscheme desert


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
"set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

set expandtab
set tabstop=2
set shiftwidth=2
set smartcase
set textmode

nnoremap j gj
nnoremap k gk
nnoremap ; :
nmap <silent> <C-n> :noh<CR>

autocmd FileType php :set ts=2 sw=2 expandtab
autocmd FileType ruby :set ts=2 sw=2 expandtab

autocmd BufRead *.html,*.css*.js call AutomaticallySetIndentStyle()

"backup
se backupdir=/tmp
se directory=/tmp

"vimrc編集
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>

"auto complete
set complete+=k

"closetag
let g:closetag_html_style=1
au Filetype html,xml,xsl,ant source $HOME/.vim/macros/closetag.vim

"JavaScript
autocmd FileType javascript nnoremap <buffer> <C-c>  :<C-u>call ASCommentWriter()<CR>
autocmd FileType javascript :set dictionary=$HOME/.vim/dict/javascript.dict

"選択範囲検索
function! RangeSearch(direction)
call inputsave()
let g:srchstr = input(a:direction)
call inputrestore()
if strlen(g:srchstr) > 0
let g:srchstr = g:srchstr.
\ '\%>'.(line("'<")-1).'l'.
\ '\%<'.(line("'>")+1).'l'
else
let g:srchstr = ''
endif
endfunction
" Each map should be on a single line
vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>

"FuzzyFinderBuffer
nnoremap <unique> <silent> <C-S> :FufBuffer!<CR>
nnoremap <unique> <silent> ef :FufFile!<CR>
nnoremap <silent> eff :FufFile!<CR>
nnoremap <silent> efm :FufMruFile!<CR>
autocmd FileType fuf nmap <C-c> <ESC>
let g:fuf_splitPathMatching = ' '
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\~$|\.bak$|\.swp|\.howm$'
let g:fuf_mrufile_maxItem = 10000
let g:fuf_enumeratingLimit = 20

imap <C-b> <Left>
imap <C-f> <Right>

" JavaScript, ECMAScript
au BufNewFile,BufRead *.as	set ft=actionscript
au BufNewFile,BufRead *.jsfl	set ft=jsfl

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

"smartchr
autocmd Filetype javascript,actionscript inoremap <buffer> <expr> = smartchr#one_of(' = ', ' == ', ' === ', '=')

" ポップアップメニューのカラーを設定
hi Pmenu guibg=#666666
hi PmenuSel guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333
