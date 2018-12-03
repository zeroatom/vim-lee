#!/bin/sh
ROOT_PATH=`pwd`
VIM_HOME="${HOME}/.vim"
VIM_SETUP_FILE="${HOME}/.vimrc"

function func_backup() { #HELP 备份配置:\nCMD backup
    backup_path="$ROOT_PATH/backup/"`date +%F`
	rm -rf $backup_path
	mkdir -p $backup_path
	if [ -f $VIM_SETUP_FILE ]; then
		mv $VIM_SETUP_FILE $backup_path
	fi

	if [ -d $VIM_HOME ]; then
		mv $VIM_HOME $backup_path
	fi
}

function func_install() { #HELP 安装配置:\nCMD install
    func_backup
	mkdir -p $VIM_HOME
	ln -s $ROOT_PATH/bundle $VIM_HOME/bundle
	ln -s $ROOT_PATH/vim-init $VIM_HOME/vim-init
	echo "source ~/.vim/vim-init/init.vim" > $VIM_SETUP_FILE
}

function func_help() { #HELP 显示帮助信息:\nCMD help
    sed -n "s/^.*#HELP\\s//p;" < "$1" | sed "s/\\\\n/\n\t/g;s/$/\n/;s!CMD!${1/!/\\!}!g"
}

[[ -z "${1-}" ]]
case $1 in
    install|backup) func_"$1" "${@:2}" ;;
    *) func_help "$0" ;;
esac
