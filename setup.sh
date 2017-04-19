if [ ! $XDG_CONFIG_HOME ]; then
	HOME_DIR=$HOME
else
	HOME_DIR=$XDG_CONFIG_HOME
fi

if [ -x "nvim" ]; then
	EDITOR_TARGET="nvim"
	EDITOR_CONFIG_DIR="${HOME_DIR}/.config/nvim"

	mkdir -p "${HOME_DIR}/.config"
else
	EDITOR_TARGET="vim"
	EDITOR_CONFIG_DIR="${HOME_DIR}/.vim"
fi

ln -sf ".vim" ${EDITOR_CONFIG_DIR} 2> /dev/null

for f in "dein.toml" "dein_lazy.toml"; do
	ln -sf ${f} ${EDITOR_CONFIG_DIR}/${f} 2> /dev/null
done

if "nvim" -eq ${EDITOR_TARGET}; then
	ln -sf ".vimrc" "${EDITOR_CONFIG_DIR}/init.vim"
else
	ln -sf ".vimrc" "${HOME}/.vimrc"
fi

if ${SHELL##*/} -eq "bash"; then
	if [ ! -f "${HOME}/.bashrc" ]; then
		touch "${HOME}/.bashrc"
	fi

	echo "source ${HOME}/dotfiles/.bashrc" >> ${HOME}/.bashrc
fi
