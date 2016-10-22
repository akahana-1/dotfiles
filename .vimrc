autocmd!

" 設定ファイルのエンコーディング
scriptencoding utf-8
" Vi互換にしない
if !has("nvim")
	set nocompatible
endif

" Neovim python settings
if has("nvim")
	let g:python_host_skip_check = 1
	let g:loaded_python_provider = 1
	let g:python3_host_prog = $PYENV_ROOT . "/versions/neovim3/bin/python"
endif

runtime! rc/init/*.vim
runtime! rc/plugins/*.vim

" 背景を透明色にする
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

colorscheme molokai

" Other Settings
" TeXファイルの認識
let g:tex_flavor = "latex"

filetype plugin indent on
