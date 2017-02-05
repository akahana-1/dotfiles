PS1='\[\e[0;36m\]${debian_chroot:+($debian_chroot)}\w\[\e[m\]\n\u@\h \$ '

if [ -d "$HOME/.cargo" ]; then
	source $HOME/.cargo/env
	export RUST_SRC_PATH=$HOME/.multirust/toolchains/$(\
		rustup toolchain list |\
		grep default |\
		cut -d' ' -f 1 -)/lib/rustlib/src/rust/src
fi

export PATH="$HOME/usr/local/bin:$HOME/.cabal/bin":$PATH
export PYENV_ROOT="$HOME/.pyenv"

if [ -d "${PYENV_ROOT}" ]; then
	export PATH="$PYENV_ROOT/bin:"$PATH
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

export TEXMFCNF="$HOME/.texmf-config/web2c":$TEXMFCNF
