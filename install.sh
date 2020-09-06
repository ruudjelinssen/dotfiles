#!/bin/bash

installubuntu () {
    echo "Installing Ubuntu dependencies"
    sudo add-apt-repository -y ppa:neovim-ppa/stable
    sudo apt update
    sudo apt install -y neovim tmux git python3 python python-pip python3-pip nodejs zsh

    # Pip
    python3 -m pip install neovim
    python2 -m pip install neovim
    echo "Done installing Ubuntu dependencies"
}

installdeps () {
    [  -n "$(uname -a | grep Ubuntu)" ] && installubuntu
}

installnvim () {
    echo "Installing neovim files"
    # backup old nvim config
    [ -d $HOME/.config/nvim] && mv $HOME/.config/nvim $HOME/.config/nvim.old

    # Link config files
    ln -s $HOME/dotfiles/nvim/ $HOME/.config/nvim

    # Install plugins
    nvim --headless +PlugInstall +qa

    # Install coc extensions
    nvim --headless +CocUpdateSync +qa

    echo "Done installing neovim files"
}

installtmux () {
    echo "Installing tmux files"

    # backup old tmux file
    [ -f $HOME/.tmux.conf ] && mv $HOME/.tmux.conf $HOME/.tmux.conf.old

    # Install new dotfile
    ln -s $HOME/dotfiles/tmux/.tmux.conf $HOME/.tmux.conf

    # TPM
    echo "Installing Tmux Plugin Manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 2> /dev/null
    echo "Done installing tmux plugin manager"

    echo "Tmux files have been installed"
}

installzsh () {
    echo "Installing ZSH"

    echo "Setting as default shell"
    sudo chsh -s $(which zsh)

    echo "Install oh my zsh"
    [ -d $HOME/.oh-my-zsh ] && rm -rf $HOME/.oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "Installing dotfiles for ZSH"
    [ -f $HOME/.zshrc ] && mv $HOME/.zshrc $HOME/.zshrc.old
    [ -d $HOME/.zsh ] && mv $HOME/.zsh $HOME/.zsh.old
    ln -s $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc
    ln -s $HOME/dotfiles/zsh/.zsh $HOME/.zsh
}
cat << EOF

           ____                  _   _     _                          
          |  _ \ _   _ _   _  __| | | |   (_)_ __  ___ ___  ___ _ __  
          | |_) | | | | | | |/ _` | | |   | | '_ \/ __/ __|/ _ \ '_ \ 
          |  _ <| |_| | |_| | (_| | | |___| | | | \__ \__ \  __/ | | |
          |_| \_\\__,_|\__,_|\__,_| |_____|_|_| |_|___/___/\___|_| |_|
                                                                      
EOF

# Install dependencies
installdeps

# Clone this repo if it does not exist
[ -d $HOME/dotfiles ] || git clone https://github.com/ruudjelinssen/dotfiles $HOME/dotfiles

# Install neovim
which nvim > /dev/null && installnvim || (echo "ERROR: Neovim is not installed"; exit 1)

# Install tmux
which tmux > /dev/null && installtmux || (echo "ERROR: Tmux is not installed"; exit 1)

# Install zsh
which zsh > /dev/null && installzsh || (echo "ERROR: ZSH is not installed"; exit 1)