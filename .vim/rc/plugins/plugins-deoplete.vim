if has("nvim")
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#max_list = 20

	" buffer completion pattern
	let g:deoplete#keyword_patterns = {}
	let g:deoplete#keyword_patterns.tex = '\\?[a-zA-Z_]\w*'

	" omni completion pattern
	let g:deoplete#omni#input_patterns = {}
	let g:deoplete#omni#input_patterns.python = '[a-zA-Z_]\w*\|[^. \t]\.\w*'
	let g:deoplete#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|[a-zA-Z_]\w*::'

	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function() abort
	  return deoplete#close_popup() . "\<CR>"
	endfunction
endif

autocmd FileType python setlocal completeopt-=preview
