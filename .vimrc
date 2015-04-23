" 設定ファイルのエンコーディング
scriptencoding utf-8
" Vi互換にしない
set nocompatible

if has('win32')
	set runtimepath+=$HOME/.vim
	cd $HOME
endif

" NeoBundle Settings
if has('vim_starting')
	filetype plugin off
	filetype indent off
	execute 'set runtimepath+=' . expand ('~/.vim/bundle/neobundle.vim')
endif

"NeoBundleの初期化
call neobundle#begin(expand('~/.vim/bundle'))

"Neobundle で Neobundleを管理
NeoBundleFetch 'Shougo/neobundle.vim'

" プラグインのインストール
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimproc.vim', {
			\ 'build' : {
			\	'windows' : 'tools\\update-dll-mingw',
			\	'cygwin' : 'make -f make_cygwin.mak',
			\	'linux' : 'make',
			\	}
			\}

NeoBundleLazy 'vim-jp/cpp-vim', {
			\ "autoload" : { "filetypes" : ["cpp"] }
			\ }

"NeoBundleの初期化終了
call neobundle#end()

"filetypeとインデントの有効化
filetype plugin indent on

NeoBundleCheck

" Ctrlp settings
let g:ctrlp_max_files = 100000
let g:ctrlp_max_depth = 10

nnoremap <silent> <space><C-p> :CtrlPMRU<CR>

" neosnippet settings
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" neocomplete settings
" Diable AutoComplPop
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionaly.
let g:neocomplete#sources#dictionary#dictionaries = {
	\ 'default' : '',
	\ 'vimshell' : $HOME.'/.vimshell_hist',
	\ 'scheme' : $HOME.'/.gosh_completions'
		\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>	neocomplete#undo_completion()
inoremap <expr><C-l>	neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()

"Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif

"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'

" User Settings
if has('unix')
	let g:lightline = {
	      \ 'colorscheme': 'default',
	      \ 'component': {
	      \   'readonly': '%{&readonly?"x":""}',
	      \ },
	      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
	      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
	      \ }
elseif has('win32')
	let g:lightline = {
		\ 'colorscheme': 'wombat',
		  \ 'component': {
		  \   'readonly': '%{&readonly?"x":""}',
		  \ }
		\ }
endif

" 256色表示に変更
set t_Co=256
" カラースキームを有効にする
colorscheme molokai
" シンタックスカラーを有効にする
syntax on

" カーソル行を強調表示
set cursorline
" 内部エンコーディングを設定
if has('win32')
	set encoding=utf-8
else
	set encoding=utf-8
endif
set fileencoding=utf-8
" スワップファイルを作成しない
set noswapfile
" バックアップファイルを作成しない
set nobackup
" 保存されていないファイルがあるときに確認を行う
set confirm
" ルーラーを表示する
set ruler
" 行番号を表示する
set number
" タイトルを開いているファイル名にする
set title
" 自動改行の無効化
set textwidth=0
" タブ幅の設定
set tabstop=4
" 自動インデントの幅の設定
set shiftwidth=4
" 改行時に前の行のインデントを継続
set autoindent
" 内容に応じて自動的にインデントを決める
set smartindent
" クリップボードをOSと連携
set clipboard=unnamedplus,unnamed
" カッコの対応を表示する
set showmatch
" <TAB>キーでのファイル補完を有効にする
set wildmenu
" 表示するフォントの設定
" set guifont=Ricty\ 10
" 大文字小文字を区別しない
set ignorecase
" 検索時は大文字小文字を区別する
set smartcase
" BSキーで何でも消せる
set backspace=indent,eol,start
" ステータスの高さを2行にする
set laststatus=2
" コマンドラインの高さを2行に
set cmdheight=2
" ビジュアルベルを使わない
set visualbell t_vb=
" ビジュアルベルの無効化
" set t_vb=
" エラーベルの無効化
set noerrorbells

" 無限Undoの実現
if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif

" 日本語環境用の設定
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    if has('mac')
      let &fileencodings = s:enc_jis .','. s:enc_euc
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    else
      let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    endif
    unlet s:fileencodings_default
  else
    let &fileencodings = fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac


" Other Settings
" TeXファイルの認識
let g:tex_flavor = "latex"
" My autocmd setting
augroup MyAutoGroup
	autocmd!
	" md as markdown, instead of modula2 (thanks to @kotatsu_mi)
	autocmd MyAutoGroup BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set ft=markdown
augroup END

