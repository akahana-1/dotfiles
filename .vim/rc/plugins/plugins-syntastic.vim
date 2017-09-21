set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_loc_list_height = 4

let g:syntastic_cpp_compiler_options = '--std=c++11'

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = ''
let g:syntastic_python_flake8_exe = 'PYENV_VERSION=neovim3 flake8'
