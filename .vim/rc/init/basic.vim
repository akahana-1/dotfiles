" シンタックスカラーを有効にする
" syntax enable
" カーソル行を強調表示しない
set nocursorline
" 内部エンコーディングを設定
" set encoding=utf-8
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
" タイトルを開いているファイル名にしない
set notitle
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
" エラーベルの無効化
set noerrorbells

" エンコードの認識対象
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp-3,latin1
" 改行コードの自動認識
set fileformats=unix,dos,mac

" 無限Undoの実現
if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif

" leaderを<Space>に
let mapleader = "\<space>"
let maplocalleader = "\<space>"

" Vi互換にしない
if !has("nvim")
	set nocompatible
endif

" ファイルタイプごとのインデント設定
augroup filetypeIndent
	autocmd!
	autocmd BufNewFile,BufRead *.yaml,*.yml setlocal tabstop=2 shiftwidth=2 
	autocmd BufNewFile,BufRead *.ts,*.js setlocal expandtab tabstop=2 shiftwidth=2
	autocmd BufNewFile,BufRead *.html setlocal tabstop=2 shiftwidth=2
	autocmd FileType json setlocal expandtab tabstop=2 shiftwidth=2
augroup END
