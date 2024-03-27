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
    ln -sf ~/.dotfiles/hammerspoon ~/.hammerspoon
    ln -sf ~/.dotfiles/config/karabiner ~/.config/karabiner
    #mkdir -p ~/Library/LaunchAgents
    #ln -sf ~/.dotfiles/Library/LaunchAgents/pl.com.siema.env.plist ~/Library/LaunchAgents/pl.com.siema.env.plist

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    brew tap homebrew/cask-drivers
    brew tap homebrew/cask-fonts
    brew tap homebrew/cask-versions
    brew install rbenv ruby-build cloc cmake gcc git git-lfs imagemagick p7zip perl pidcat pyenv subversion tmux wget zsh zsh-completions grep mas gradle dotnet@6
    brew install --cask iterm2 temurin8 firefox google-chrome opera sublime-text tunnelblick scroll-reverser karabiner-elements hammerspoon jd-gui steam spotify discord veracrypt disk-inventory-x adobe-acrobat-reader minecraft mpv slack unity-hub jetbrains-toolbox 1password adobe-creative-cloud onedrive vmware-fusion

    PYTHON3_VERSION="3.12.1"
    PYTHON2_VERSION="2.7.18"
    eval "$(pyenv init -)"
    pyenv install $PYTHON3_VERSION 
    pyenv install $PYTHON2_VERSION 
    pyenv rehash
    pyenv global $PYTHON3_VERSION $PYTHON2_VERSION 

    RUBY_VERSION="2.7.8"
    eval "$(rbenv init -)"
    rbenv install $RUBY_VERSION
    rbenv rehash
    rbenv global $RUBY_VERSION
    gem install cocoapods

    echo "Adding zsh to /etc/shells..."
    echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
fi

git clone https://github.com/powerline/fonts /tmp/powerline-fonts && /tmp/powerline-fonts/install.sh && rm -rf /tmp/powerline-fonts

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

