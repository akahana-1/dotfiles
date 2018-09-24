" let g:ale_cache_executable_check_failures = 0
let g:ale_echo_msg_format = "[%linter%] %s [%severity%]"
let g:ale_echo_msg_warning_str = "W"
let g:ale_echo_msg_error_str = "E"

let g:ale_list_window_size = 3
" テキスト変更時の常時lintを無効化
let g:ale_lint_on_text_changed = "never"

let g:ale_linters = {
		\ "python": ["flake8"],
		\ }
let g:ale_linters_explicit = 1

" for python3
let g:ale_python_flake8_executable = $HOME . "/usr/local/bin/flake8"
let g:ale_python_flake8_use_global = 1
