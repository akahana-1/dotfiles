PS1='\[\e[0;36m\]${debian_chroot:+($debian_chroot)}\w\[\e[m\]\n\u@\h \$ '

export PATH="$HOME/usr/local/bin:$HOME/.cabal/bin":$PATH
export PYENV_ROOT="$HOME/.pyenv"

if [ -d "${PYENV_ROOT}" ]; then
	export PATH="$PYENV_ROOT/bin:"$PATH
	eval "$(pyenv init -)"
fi

export TEXMFCNF="$HOME/.texmf-config/web2c":$TEXMFCNF
