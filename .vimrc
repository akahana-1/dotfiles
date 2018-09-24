" 定義済みのautocmdを一度全て削除
" 再読み込む時にこの設定が効いてくる
autocmd!

" 設定ファイルのエンコーディング
scriptencoding utf-8

runtime! rc/init/*.vim
runtime! rc/plugins/*.vim

" 背景を透明色にする
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

colorscheme molokai

" Other Settings
" TeXファイルの認識
let g:tex_flavor = "latex"

if system('uname -a | grep Microsoft') != ""
	let g:clipboard = {
		  \   'name': 'wslClipboard',
		  \   'copy': {
		  \      '+': 'win32yank.exe -i',
		  \      '*': 'win32yank.exe -i',
		  \    },
		  \   'paste': {
		  \      '+': 'win32yank.exe -o',
		  \      '*': 'win32yank.exe -o',
		  \   },
		  \   'cache_enabled': 1,
		  \ }
endif

filetype plugin indent on
