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

filetype plugin indent on
