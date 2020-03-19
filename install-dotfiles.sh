#!/bin/bash
function clearLastLine() {
    tput cuu 1 && tput el
}

# Install the dotfiles under all folders
echo "Installing dotfiles from all folders using Stow..."
for d in `ls -d */`; do
    echo -e "[\e[33mWait\e[0m]\t$d"        
    stow $d
    clearLastLine
    echo -e "[\e[32mOK\e[0m]\t$d"        
done

echo "Installing neovim plugins"
nvim +PlugInstall +UpdateRemotePlugins +qa

echo "\n\nInstalling Tmux Plugin Manager\n"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 2> /dev/null
echo "Done!"
