colorscheme molokai

if has('win32')
	"set guifont=Saurce_Code_Powerline:h12
	set guifont=Migu_1M:h10

	" メニューの文字化け防止
	source $VIMRUNTIME/delmenu.vim
	set langmenu=ja_JP.utf-8
	source $VIMRUNTIME/menu.vim
endif

" GUI Setting
set lines=32
set columns=80

" ビジュアルベルに関する設定
set visualbell
set t_vb=
set noerrorbells
