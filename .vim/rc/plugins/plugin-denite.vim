" Change default prompt
call denite#custom#option('default', 'prompt', '>')

" Change highlight cursorline
autocmd Filetype denite highlight CursorLine ctermbg=241

" Change mappings.
" call denite#custom#map(
" 	\ 'insert',
" 	\ '<C-t>',
" 	\ '<denite:do_action:tabopen>',
" 	\ 'noremap'
" 	\)
call denite#custom#map(
	\ 'normal',
	\ 'v',
	\ '<denite:do_action:vsplit>',
	\ 'noremap'
	\)

" Define my denite key mappings
" Hack Sample : http://vim-jp.org/vim-users-jp/2009/08/19/Hack-59.html
"             : http://vim-jp.org/vim-users-jp/2010/05/04/Hack-144.html
nnoremap <SID>[denite] <Nop>
nmap <Space>d <SID>[denite]

nnoremap <silent> <SID>[denite]d :<C-u> Denite file/rec buffer file/old<CR>
nnoremap <silent> <SID>[denite]f :<C-u>Denite file/rec<CR>
nnoremap <silent> <SID>[denite]b :<C-u>Denite buffer<CR>
nnoremap <silent> <SID>[denite]g :<C-u>Denite grep<CR>
