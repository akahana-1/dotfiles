if has("nvim")
	let g:deoplete#enable_at_startup = 0
	autocmd InsertEnter * call deoplete#enable()

	" let g:deoplete#max_list = 30
	call deoplete#custom#var('max_list', 30)


	" buffer completion pattern
	" let g:deoplete#keyword_patterns = {}
	" let g:deoplete#keyword_patterns.tex = '\\?[a-zA-Z_]\w*'
	call deoplete#custom#option('keyword_patterns', {
		\ 'tex': '\\?[a-zA-Z_]\w*',
		\})

	" omni completion pattern
	call deoplete#custom#var('omni', 'input_patterns', {
		\ 'python':  '[a-zA-Z_]\w*\|[^. \t]\.\w*',
		\ 'cpp':  '[^.[:digit:] *\t]\%\(\.\|->\)\|[a-zA-Z_]\w*::'
		\ })
	autocmd FileType tex call deoplete#custom#var('omni', 'input_patterns', { 'tex': g:vimtex#re#deoplete })
	" let g:deoplete#omni#input_patterns = {}
	" let g:deoplete#omni#input_patterns.python = '[a-zA-Z_]\w*\|[^. \t]\.\w*'
	" let g:deoplete#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%\(\.\|->\)\|[a-zA-Z_]\w*::'
	" autocmd FileType tex let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

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
