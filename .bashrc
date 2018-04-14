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

# パスの重複除去
# Ref : https://qiita.com/camisoul/items/78e43923615434ba519b
deduplication(){
	if typeset -A 2>&1 > /dev/null; then
		typeset -A _paths
		typeset _results
		while read -r _p; do
			if [[ -n ${_p} ]] && (( ${_paths["${_p}"]:-1} )); then
				_paths["${_p}"]=0
				_results=${_results}:${_p}
			fi
		done <<<"${PATH//:/$'\n'}"
		PATH=${_results/:/}
		unset -v _p _paths _results
	fi
}

promps

[[ -z $TMUX ]] && export PATH="$HOME/usr/local/bin:$HOME/.cabal/bin":$PATH

export PYENV_ROOT="$HOME/.pyenv"
[[ -z $TMUX && -d $PYENV_ROOT ]] && export PATH="$PYENV_ROOT/bin:"$PATH

if [[ -z $TMUX ]] && command -v pyenv 1> /dev/null 2>&1; then
	eval "$(pyenv init -)"
	# eval "$(pyenv virtualenv-init -)"
fi

export TEXMFCNF="$HOME/.texmf-config/web2c":$TEXMFCNF

deduplication
