let g:tex_flavor = "latex"

" deprecated options sinc 2017-03-28
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

" reference : https://github.com/lervag/vimtex/issues/773#issuecomment-297371661
let g:vimtex_quickfix_latexlog = {'fix_paths' : 0}
