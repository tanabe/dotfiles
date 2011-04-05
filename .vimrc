"pathhogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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
set virtualedit+=block
set backspace=2

"key mapping
imap <C-b> <Left>
imap <C-f> <Right>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap ; :
nmap <silent> <C-n> :noh<CR>


au BufRead *.html,*.css*.js call AutoSetIndentStyle()
au BufRead,BufNewFile *.html call LoadHTMLTemplate()

"backup
se backupdir=/tmp
se directory=/tmp

"vimrc編集
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>

"auto complete
set complete+=k

"dict
autocmd FileType javascript :set dictionary=$HOME/.vim/dict/javascript.dict
autocmd FileType php :set dictionary=$HOME/.vim/dict/php.dict

"file type
au FileType javascript nnoremap <buffer> <C-c>  :<C-u>call ASCommentWriter()<CR>


"plugin
"acp
"let g:acp_completeOption = '.,w,b,u,t,i,k'
"hi Pmenu ctermbg=4
"hi PmenuSel ctermbg=1
"hi PMenuSbar ctermbg=4

"closetag
"let g:closetag_html_style=1
"au Filetype html,xml,xsl,ant source $HOME/.vim/macros/closetag.vim

"neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
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

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

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

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

"function

"template
function! LoadHTMLTemplate()
  if (line("$") == 1) && (match(getline(1), "^$") == 0)
    se fenc=utf-8
    "Windows
    0r $HOME/.vim/templates/template.html
  endif
endfun

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

"comment
function! ASCommentWriter()
  let c = col(".")
  let l = a:firstline - 1
  let s = ''
  while len(s) < (c - 1)
    let s = s . " "
  endwhile
  call append(l, s . ' */')
  call append(l, s . ' *')
  call append(l, s . '/**')
endfunction

"ポップアップメニューのカラーを設定
hi Pmenu ctermbg=0
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=2
hi PmenuThumb ctermbg=3




