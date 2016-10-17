let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
if has('nvim')
	let s:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
	let s:config_dir = s:config_home . '/nvim'
else
	let s:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.vim') : $XDG_CONFIG_HOME
	let s:config_dir = s:config_home
endif

let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" dein settings
let s:toml_file = s:config_dir . '/dein.toml'
let s:toml_lazy_file = s:config_dir . '/dein_lazy.toml'

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file, s:toml_lazy_file])

	call dein#load_toml(s:toml_file, { 'lazy' : 0 })
	call dein#load_toml(s:toml_lazy_file, { 'lazy' : 1 })

	call dein#end()
endif

if dein#check_install()
	call dein#install()
endif
