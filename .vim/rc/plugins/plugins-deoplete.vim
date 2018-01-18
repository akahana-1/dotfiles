if has("nvim")
	let g:deoplete#enable_at_startup = 0
	autocmd InsertEnter * call deoplete#enable()

	let g:deoplete#max_list = 30

"	let g:deoplete#sources.cpp = ['buffer', 'tag']

	" buffer completion pattern
	let g:deoplete#keyword_patterns = {}
	let g:deoplete#keyword_patterns.tex = '\\?[a-zA-Z_]\w*'

	" omni completion pattern
	let g:deoplete#omni#input_patterns = {}
	let g:deoplete#omni#input_patterns.python = '[a-zA-Z_]\w*\|[^. \t]\.\w*'
	let g:deoplete#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%\(\.\|->\)\|[a-zA-Z_]\w*::'
	" autocmd FileType tex let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
	" let g:deoplete#omni#input_patterns.tex = '\\(?:'
    "   \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
    "   \ . '|(text|block)cquote\*?(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
    "   \ . '|(for|hy)\w*cquote\*?{[^}]*}(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
    "   \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
    "   \ . '|hyperref\s*\[[^]]*'
    "   \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    "   \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
    "   \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    "   \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
    "   \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
    "   \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
    "   \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
    "   \ . '|\w*'
    "   \ .')'

	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

	" <Tab> <S-Tab>: move next or previous match
	inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function() abort
	  return deoplete#close_popup() . "\<CR>"
	endfunction
endif

autocmd FileType python setlocal completeopt-=preview
