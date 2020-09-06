#!/bin/bash

SUDO=''
if (( $EUID != 0 )); then
    SUDO='sudo'
fi

installubuntu () {
    echo "Installing Ubuntu dependencies"
    $SUDO apt update
    $SUDO apt install -y software-properties-common
    $SUDO add-apt-repository -y ppa:neovim-ppa/stable
    $SUDO apt install -y neovim tmux git python3 python python3-pip nodejs zsh

    # Pip
    python3 -m pip install neovim
    echo "Done installing Ubuntu dependencies"
}

installdeps () {
    [  -n "$(uname -a | grep Ubuntu)" ] && installubuntu
}

installnvim () {
    echo "Installing neovim files"
    # backup old nvim config
    [ -d $HOME/.config/nvim ] && mv $HOME/.config/nvim $HOME/.config/nvim.old

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
    $SUDO chsh -s $(which zsh)

    echo "Install oh my zsh"
    [ -d $HOME/.oh-my-zsh ] && rm -rf $HOME/.oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "Installing dotfiles for ZSH"
    [ -f $HOME/.zshrc ] && mv $HOME/.zshrc $HOME/.zshrc.old
    [ -d $HOME/.zsh ] && mv $HOME/.zsh $HOME/.zsh.old
    ln -s $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc
    ln -s $HOME/dotfiles/zsh/.zsh $HOME/.zsh
}

base64 -d <<< cat << EOF
ICAgICAgICAgICBfX19fICAgICAgICAgICAgICAgICAgXyAgIF8gICAgIF8gICAgICAgICAgICAg
ICAgICAgICAgICAgIAogICAgICAgICAgfCAgXyBcIF8gICBfIF8gICBfICBfX3wgfCB8IHwgICAo
XylfIF9fICBfX18gX19fICBfX18gXyBfXyAgCiAgICAgICAgICB8IHxfKSB8IHwgfCB8IHwgfCB8
LyBfYCB8IHwgfCAgIHwgfCAnXyBcLyBfXy8gX198LyBfIFwgJ18gXCAKICAgICAgICAgIHwgIF8g
PHwgfF98IHwgfF98IHwgKF98IHwgfCB8X19ffCB8IHwgfCBcX18gXF9fIFwgIF9fLyB8IHwgfAog
ICAgICAgICAgfF98IFxfXFxfXyxffFxfXyxffFxfXyxffCB8X19fX198X3xffCB8X3xfX18vX19f
L1xfX198X3wgfF98CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAK
EOF

# Install dependencies
installdeps

# Create .config folder if it does not exist
[ -d $HOME/.config ] || mkdir $HOME/.config

# Clone this repo if it does not exist
[ -d $HOME/dotfiles ] || git clone https://github.com/ruudjelinssen/dotfiles $HOME/dotfiles

# Install neovim
which nvim > /dev/null && installnvim || (echo "ERROR: Neovim is not installed"; exit 1)

# Install tmux
which tmux > /dev/null && installtmux || (echo "ERROR: Tmux is not installed"; exit 1)

# Install zsh
which zsh > /dev/null && installzsh || (echo "ERROR: ZSH is not installed"; exit 1)
