" Vi互換にしない
if !has("nvim")
	set nocompatible
endif

if has('win32') || has('win64')
	set runtimepath+=$HOME/.vim
	cd $HOME
endif

" Neovim python settings
if has("nvim")
	let g:python_host_skip_check = 1
	let g:python3_host_skip_check = 1
	let g:loaded_python_provider = 1
	let g:python3_host_prog = $PYENV_ROOT . "/versions/neovim3/bin/python3"
endif
