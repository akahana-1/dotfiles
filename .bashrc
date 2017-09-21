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

[[ -z $TMUX ]] && export PATH="$HOME/usr/local/bin:$HOME/.cabal/bin":$PATH

export PYENV_ROOT="$HOME/.pyenv"
[[ -z $TMUX ]] && export PATH="$PYENV_ROOT/bin:"$PATH

if [[ -z $TMUX ]] && command -v pyenv 1> /dev/null 2>&1; then
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

export TEXMFCNF="$HOME/.texmf-config/web2c":$TEXMFCNF
