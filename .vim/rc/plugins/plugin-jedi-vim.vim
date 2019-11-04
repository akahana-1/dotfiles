command! -nargs=0 JediRename :call jedi#rename
inoremap <S-Space> g:jedi#completions_command

if !has("nvim")
	let g:jedi#completions_enabled = 1
else
	let g:jedi#completions_enabled = 0
endif

let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signatures = 0
let g:jedi#rename_command = ""
