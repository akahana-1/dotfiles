parse_git_branch()
{
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\s\(.*\)/ [\1]/'
}

promps(){
	local dir_color="\[\e[0;36m\]"
	local repo_color="\[\e[1;36m\]"
	local cmd_color="\[\e[0;00m\]"
	PS1="${dir_color}${debian_chroot:+($debian_chroot)}\w${repo_color}\$(parse_git_branch)${cmd_color}\n\u@\h \$ "
}

promps

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
