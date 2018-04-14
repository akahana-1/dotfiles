#! /bin/bash

PREFIX=$(cd $(dirname $0) && pwd)

if [ ! $XDG_CONFIG_HOME ]; then
	CONFIG_HOME=$HOME/.config
else
	CONFIG_HOME=$XDG_CONFIG_HOME
fi

# echo "CONFIG HOME : " ${CONFIG_HOME}

[[ -d ${CONFIG_HOME} ]] || mkdir -p ${CONFIG_HOME}

if type nvim > /dev/null 2>&1; then
	EDITOR_TARGET="nvim"
	EDITOR_CONFIG_DIR="${CONFIG_HOME}/nvim"
else
	EDITOR_TARGET="vim"
	EDITOR_CONFIG_DIR="${HOME_DIR}/.vim"
fi

# echo "EDITOR_TARGET : " ${EDITOR_TARGET}

ln -sf ${PREFIX}/.vim ${EDITOR_CONFIG_DIR} 2> /dev/null

for f in "*.toml"; do
	ln -sf ${PREFIX}/${f} ${EDITOR_CONFIG_DIR} 2> /dev/null
done

if [[ "nvim" == ${EDITOR_TARGET} ]]; then
	ln -sf "${PREFIX}/.vimrc" "${EDITOR_CONFIG_DIR}/init.vim"
else
	ln -sf "${PREFIX}/.vimrc" "${HOME}/.vimrc"
fi

type tmux > /dev/null 2>&1 && ln -sf "${PREFIX}/.tmux.conf" "${HOME}/.tmux.conf"

if [[ ${SHELL##*/} == "bash" ]]; then
	if [[ ! -f "${HOME}/.bashrc" ]]; then
		touch "${HOME}/.bashrc"
	fi

	echo "source ${PREFIX}/.bashrc" >> ${HOME}/.bashrc
fi
