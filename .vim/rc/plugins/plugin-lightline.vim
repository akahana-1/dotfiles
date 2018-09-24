let g:lightline = {
	  \ 'colorscheme': 'default',
	  \ 'active' : {
	  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
	  \ },
	  \ 'component_function': {
	  \   'fugitive': 'LightlineFugitive',
	  \   'filename': 'LightlineFilename'
	  \ },
	  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
	  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
	  \ }

function! LightlineModified()
	return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightlineReadonly()
	return &ft !~? 'help\|vimfiler' && &readonly ? 'RO' : ''
endfunction
function! LightlineFilename()
	return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
	\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
	\  &ft == 'unite' ? unite#get_status_string() :
	\  &ft == 'vimshell' ? vimshell#get_status_string() :
	\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
	\ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction
function! LightlineFugitive()
	if &ft !~? 'vimfiler' && exists('*fugitive#head')
		let branch = fugitive#head()
		return branch !=# '' ? "\ue0a0 ".branch : ''
	endif
	return ''
endfunction
