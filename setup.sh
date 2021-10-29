#!/bin/sh
mkdir -p ~/.config
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/zprofile ~/.zprofile
ln -sf ~/.dotfiles/aliases ~/.aliases

if [ "$(uname -s)" = "Linux" ]; then
    ln -sf ~/.dotfiles/Xresources ~/.Xresources
    ln -sf ~/.dotfiles/dircolors ~/.dircolors
    ln -sf ~/.dotfiles/config/awesome ~/.config/awesome
    ln -sf ~/.dotfiles/config/termite ~/.config/termite

    if hash sudo 2>/dev/null; then
        SU_CMD="sudo"
    else
        SU_CMD="su -c"
    fi

    if hash pacman 2>/dev/null; then
        $SU_CMD pacman --needed --noconfirm -S cloc cmake git git-lfs imagemagick nodejs p7zip perl python python3 ruby subversion tmux vim wget zsh ttf-dejavu htop
    elif hash emerge 2>/dev/null; then
        echo "app-misc/tmux" | $SU_CMD tee -a /etc/portage/package.accept_keywords
        echo "x11-wm/awesome" | $SU_CMD tee -a /etc/portage/package.accept_keywords
        $SU_CMD emerge cloc cmake git git-lfs imagemagick nodejs p7zip perl python ruby subversion tmux vim wget zsh dejavu
    elif hash apt-get 2>/dev/null; then
        $SU_CMD apt-get install cloc cmake git imagemagick nodejs p7zip perl pidcat python python3 ruby subversion tmux vim wget zsh fonts-dejavu
    fi

    git clone https://github.com/chriskempson/base16-xresources.git ~/.config/base16-xresources
elif [ "$(uname -s)" = "Darwin" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    mkdir -p ~/Library/LaunchAgents
    ln -sf ~/.dotfiles/hammerspoon ~/.hammerspoon
    ln -sf ~/.dotfiles/config/karabiner ~/.config/karabiner
    ln -sf ~/.dotfiles/Library/LaunchAgents/pl.com.siema.env.plist ~/Library/LaunchAgents/pl.com.siema.env.plist
    brew tap homebrew/cask-drivers
    brew tap homebrew/cask-fonts
    brew tap homebrew/cask-versions
    brew install google-chrome firefox opera skype iterm2 sublime-text tunnelblick karabiner-elements hammerspoon steam spotify discord veracrypt virtualbox virtualbox-extension-pack xquartz wine-staging disk-inventory-x adobe-acrobat-reader minecraft mpv deluge slack dotnet mono-mdk google-drive unity-hub jetbrains-toolbox 1password scroll-reverser
    brew install --cask macvim temurin8 steelseries-gg
    brew install ruby cloc cmake gcc git git-lfs imagemagick p7zip perl pidcat python subversion tmux wget zsh zsh-completions grep mas
    sudo gem install cocoapods
    echo "Adding zsh to /etc/shells..."
    echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
fi

git clone https://github.com/powerline/fonts /tmp/powerline-fonts && /tmp/powerline-fonts/install.sh && rm -rf /tmp/powerline-fonts

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

