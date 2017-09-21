#! /bin/bash

if [ ! $XDG_CONFIG_HOME ]; then
	CONFIG_HOME=$HOME/.config
else
	CONFIG_HOME=$XDG_CONFIG_HOME
fi

mkdir -p ${CONFIG_HOME}

if type "nvim" > /dev/null 2&>1; then
	EDITOR_TARGET="nvim"
	EDITOR_CONFIG_DIR="${CONFIG_HOME}/nvim"
else
	EDITOR_TARGET="vim"
	EDITOR_CONFIG_DIR="${HOME_DIR}/.vim"
fi

ln -sf .vim ${EDITOR_CONFIG_DIR} 2> /dev/null

for f in "*.toml"; do
	ln -sf ${f} ${EDITOR_CONFIG_DIR}/${f} 2> /dev/null
done

if [[ "nvim" == ${EDITOR_TARGET} ]]; then
	ln -sf ".vimrc" "${EDITOR_CONFIG_DIR}/init.vim"
else
	ln -sf ".vimrc" "${HOME}/.vimrc"
fi

if [[ ${SHELL##*/} == "bash" ]]; then
	if [ ! -f "${HOME}/.bashrc" ]; then
		touch "${HOME}/.bashrc"
	fi

	echo "source ${HOME}/dotfiles/.bashrc" >> ${HOME}/.bashrc
fi
