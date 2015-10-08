"pathhogen
execute pathogen#infect()

if &term == "xterm-256color"
  set t_Co=256
  colorscheme desert256
else
  colorscheme desert
endif

if exists('&ambiwidth')
  set ambiwidth=double
endif

set nocompatible
set autoindent
set smartindent
set ignorecase
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
filetype on
filetype indent on
filetype plugin on

set number
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']['.(&bomb?'bom':'nobom').']'}%=%l,%c%V%8P

set expandtab
set tabstop=4
set shiftwidth=4
set smartcase
set textmode
set virtualedit+=block
set backspace=2

set history=1000

"key mapping
imap <C-b> <Left>
imap <C-f> <Right>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap ; :
nmap <silent> <C-n> :noh<CR>

"key maaping on command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

"backup
se backupdir=/tmp
se directory=/tmp

"edit vimrc
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter> :se ff=unix<Enter>

"auto complete
set complete+=k


"neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
" let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
  
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()


" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"

set completeopt=menu

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

"functions

function! RunPythonUnitTest()
    let className = matchlist(getline(search("^class", "bn")), "^class \\(\\w\\+\\)")[1]
    let testName = matchlist(getline(search("def test", "bn")), "def \\(test\\w\\+\\)")[1]
    let testCase = className . "." . testName
    let fileName = expand("%")
    let command = "!python " . fileName . " " . testCase
    execute command
endfun
autocmd FileType python nmap <silent> rr :call RunPythonUnitTest()<CR>

"popup colors
hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
hi PmenuSel ctermbg=blue ctermfg=white
hi PmenuSbar ctermbg=0 ctermfg=9
hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#DDDDDD

"MRU
let MRU_Max_Entries = 1000 

"CdCurrent
command! -nargs=1 CdCurrent cd %:p:h

set nf=

" 入力モードで開始
let g:unite_enable_start_insert=1

"mru,reg,buf
nnoremap m :Unite file_mru -buffer-name=file_mru<Enter>
let g:neomru#file_mru_limit = 200
let g:neomru#update_interval = 5
let g:neomru#do_validate = 0

nnoremap q :<C-u>Unite<Space>buffer file_mru<CR>

"incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
