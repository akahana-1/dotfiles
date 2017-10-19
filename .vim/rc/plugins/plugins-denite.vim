" Change default prompt
call denite#custom#option('default', 'prompt', '>')

" Change highlight cursorline
autocmd Filetype denite highlight CursorLine ctermbg=241

" Define my denite key mappings
nnoremap <SID>[denite] <Nop>
nmap <Space>d <SID>[denite]

nnoremap <silent> <SID>[denite]d :<C-u> Denite file_rec buffer file_old<CR>
nnoremap <silent> <SID>[denite]f :<C-u>Denite file_rec<CR>
nnoremap <silent> <SID>[denite]b :<C-u>Denite buffer<CR>
nnoremap <silent> <SID>[denite]g :<C-u>Denite grep<CR>
