" Change default prompt
call denite#custom#option('default', 'prompt', '>')

" Change highlight cursorline
autocmd Filetype denite highlight CursorLine ctermbg=241

autocmd Filetype denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action', 'open') 
	nnoremap <silent><buffer><expr> q denite#do_map('quit')
	nnoremap <silent><buffer><expr> v denite#do_map('do_action', 'vsplit')
	nnoremap <silent><buffer><expr> s denite#do_map('do_action', 'split')
	nnoremap <silent><buffer><expr> t denite#do_map('do_action', 'tabopen')
	nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
endfunction


autocmd Filetype denite-filter call s:denite_filter_my_action()
function! s:denite_filter_my_action() abort
	imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" Define my denite key mappings
" Hack Sample : http://vim-jp.org/vim-users-jp/2009/08/19/Hack-59.html
"             : http://vim-jp.org/vim-users-jp/2010/05/04/Hack-144.html
nnoremap <SID>[denite] <Nop>
nmap <Leader>d <SID>[denite]

nnoremap <silent> <SID>[denite]d :<C-u>Denite -start-filter file/rec buffer file/old<CR>
nnoremap <silent> <SID>[denite]f :<C-u>Denite -start-filter file/rec<CR>
nnoremap <silent> <SID>[denite]b :<C-u>Denite -start-filter buffer<CR>
nnoremap <silent> <SID>[denite]g :<C-u>Denite grep<CR>
