" deoplete-jedi は $PATH から見える Python の sys.path に jediを追加するので
" 他のライブラリの設定はPATHから見えてる Python に準ずる
let g:deoplete#sources#jedi#python_path = $PYENV_ROOT . "/shims/python"
