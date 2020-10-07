#!/bin/bash

SUDO=''
if (( $EUID != 0 )); then
    SUDO='sudo'
fi

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --bspwm)
            INSTALL_BSPWM=1
            shift
            ;;
        *)
            ;;
    esac
done

installubuntu () {
    echo "Installing Ubuntu dependencies"
    $SUDO apt update
    $SUDO apt install -y software-properties-common
    $SUDO add-apt-repository -y ppa:neovim-ppa/stable
    $SUDO apt install -y neovim tmux git python3 python python3-pip nodejs zsh yarn npm ripgrep fzf

    # Pip
    python3 -m pip install --user neovim
    echo "Done installing Ubuntu dependencies"
}

installfedora () {
    echo "Installing Fedora dependencies"
    $SUDO dnf check-update
    $SUDO dnf upgrade python-setuptools
    $SUDO dnf install -y neovim tmux git python3 nodejs zsh ripgrep
    $SUDO npm install -g yarn

    # Pip
    python3 -m pip install --user neovim

    # install bspwm if needed
    if [[ $INSTALL_BSPWM -eq "1" ]]; then
        echo "Installing bspwm and dependencies"
        $SUDO dnf install -y rofi bspwm sxhkd compton dunst polybar yad udiskie feh ImageMagick fzf xautolock
    fi
}

installdebian() {
    echo "Installing Debian dependencies"
    $SUDO apt update
    $SUDO apt install -y neovim tmux git python3 python python3-pip zsh yarn npm ripgrep fzf snapd
    $SUDO snap install --edge --classic nodejs

    # pip dependencies
    python3 -m pip install --user neovim

    # install bspwm if needed
    if [[ $INSTALL_BSPWM -eq "1" ]]; then
        echo "Installing bspwm and dependencies"
        $SUDO apt install -y rofi bspwm sxhkd compton dunst yad udiskie feh imagemagick xautolock cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev libjsoncpp-dev
        if ! command -v polybar &> /dev/null; then
            git clone https://github.com/jaagr/polybar.git /tmp/polybar
            cd /tmp/polybar
            ./build.sh
            cd $OLDPWD
        fi
    fi
}

installdeps () {
    OS=`awk -F= '/^NAME/{print $2}' /etc/os-release | sed s/\"//g`
    [[ $OS =~ "Ubuntu" ]] && installubuntu
    [[ $OS =~ "Fedora" ]] && installfedora
    [[ $OS =~ "Debian" ]] && installdebian

    if [[ $INSTALL_BSPWM -eq "1" ]]; then
        $SUDO python3 -m pip install blurwal
        ln -sfn $HOME/dotfiles/betterlockscreenrc $HOME/.config/betterlockscreenrc
    fi
}

installnvim () {
    echo "Installing neovim files"
    # backup old nvim config
    [[ -d $HOME/.config/nvim && ! -L $HOME/.config/nvim ]] && mv $HOME/.config/nvim $HOME/.config/nvim.old

    # Link config files
    ln -sfn $HOME/dotfiles/nvim/ $HOME/.config/nvim

    # Install plugins
    nvim --headless +PlugInstall +qa > /dev/null

    # Install coc extensions
    nvim --headless +CocUpdateSync +qa > /dev/null

    echo "Done installing neovim files"
}

installtmux () {
    echo "Installing tmux files"

    # backup old tmux file
    [[ -f $HOME/.tmux.conf ]] && mv $HOME/.tmux.conf $HOME/.tmux.conf.old

    # Install new dotfile
    ln -sf $HOME/dotfiles/tmux/.tmux.conf $HOME/.tmux.conf

    # TPM
    echo "Installing Tmux Plugin Manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 2> /dev/null
    echo "Done installing tmux plugin manager"

    echo "Tmux files have been installed"
}

installzsh () {
    echo "Installing ZSH"

    echo "Setting as default shell"
    chsh -s $(which zsh)

    echo "Install oh my zsh"
    [[ ! -d $HOME/.oh-my-zsh ]] && git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

    echo "Install pure prompt"
    git clone https://github.com/sindresorhus/pure.git $HOME/dotfiles/zsh/.zsh/pure

    echo "Installing dotfiles for ZSH"
    [[ -f $HOME/.zshrc && ! -L $HOME/.zshrc ]] && mv $HOME/.zshrc $HOME/.zshrc.old
    [[ -d $HOME/.zsh && ! -L $HOME/.zsh ]] && mv $HOME/.zsh $HOME/.zsh.old
    ln -sf $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc
    ln -sfn $HOME/dotfiles/zsh/.zsh $HOME/.zsh
}

installbspwm () {
    echo "Installing bspwm files"

    # Install the dotfiles
    for a in "rofi" "bpwm" "sxhkd" "compton" "dunst" "polybar"; do
        [[ -d $HOME/.config/$a && ! -L $HOME/.config/$a ]] && mv $HOME/.config/$a $HOME/.config/$a.old
        ln -sfn $HOME/dotfiles/$a $HOME/.config/$a    
    done

    echo "Finished installing bspwm"
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
[[ -d $HOME/.config ]] || mkdir $HOME/.config

# Install bin files
echo "Installing ~/.bin folder"
[[ -d $HOME/.bin && ! -L $HOME/.bin ]] && mv $HOME/.bin $HOME/.bin.old
ln -sfn $HOME/dotfiles/bin $HOME/.bin


# Clone this repo if it does not exist
if [[ -d $HOME/dotfiles ]]; then
    cd ~/dotfiles
    git pull
    cd $OLDPWD
else
    git clone https://github.com/ruudjelinssen/dotfiles $HOME/dotfiles
fi

# Install neovim
which nvim > /dev/null && installnvim || (echo "ERROR: Neovim is not installed"; exit 1)

# Install tmux
which tmux > /dev/null && installtmux || (echo "ERROR: Tmux is not installed"; exit 1)

# Install zsh
which zsh > /dev/null && installzsh || (echo "ERROR: ZSH is not installed"; exit 1)

# Install bspwm
which bspc > /dev/null && which sxhkd > /dev/null && installbspwm || (echo "Ignoring bspwm")

# Install alacritty
ln -sfn $HOME/dotfiles/alacritty $HOME/.config/alacritty
