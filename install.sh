#!/usr/bin/env bash

# esse código é baseado no instalador do projeto Lunarvim: https://github.com/ChristianChiarulli/LunarVim

installubuntu() {
	sudo apt install nodejs npm curl git 
}

installarch() {
	sudo pacman -S --needed nodejs npm curl git python-pynvim
}

install() {
	echo "Instalando dependencias..."
	[ -n "$(cat /etc/os-release | grep ubuntu)" ] && installubuntu
	[ -f "/etc/arch-release" ] && installarch
}

#Inicio
echo 'Instalando os dotfiles'

# mover o diretório nvim se ele já existe 
[ -d "$HOME/.config/nvim" ] && echo "Mova a pasta ~/.config/nvim antes de instalar" && exit

echo "======Instalando dependencias======"
install

echo "======Clone do repositorio======"
git clone https://github.com/micaelviana/nvim ~/.config/nvim

printf "\n\n"

echo "======Instalar o vim-plug======"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

printf "\n\n"

echo "======Abrindo o neovim e instalando os plugins. AGUARDE======"
nvim +PlugInstall +qall
