let g:tex_flavor = "latex"
let g:tex_conceal = "b"

" deprecated options since 2017-03-28
" let g:vimtex_latexmk_options = '-pdfdvi'

let g:vimtex_compiler_latexmk = {
\ 'background' : 1,
\ 'build_dir' : '',
\ 'continuous' : 1,
\ 'options' : [
\   '-pdfdvi',
\   '-verbose',
\   '-file-line-error',
\   '-interaction=nonstopmode',
\ ],
\}

let g:vimtex_compiler_latexmk_engines = {
	\ '_' : '-pdfdvi',
	\}
" reference : https://github.com/lervag/vimtex/issues/773#issuecomment-297371661
" let g:vimtex_quickfix_latexlog = {'fix_paths' : 0}
let g:vimtex_quickfix_open_on_warning = 0
