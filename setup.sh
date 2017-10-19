#!/bin/sh
mkdir -p ~/.config
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/zshenv ~/.zshenv
ln -sf ~/.dotfiles/aliases ~/.aliases

if [ "$(uname -s)" = "Linux" ]; then
    ln -sf ~/.dotfiles/dircolors ~/.dircolors
    ln -sf ~/.dotfiles/config/awesome ~/.config/awesome
    ln -sf ~/.dotfiles/config/termite ~/.config/termite
    if hash sudo 2>/dev/null; then
        SU_CMD="sudo"
    else
        SU_CMD="su -c"
    fi

    if hash pacman 2>/dev/null; then
        $SU_CMD pacman --noconfirm -S cloc cmake git imagemagick nodejs p7zip perl python python3 ruby subversion tmux vim wget zsh ttf-dejavu htop
    elif hash apt-get 2>/dev/null; then
        $SU_CMD apt-get install cloc cmake git imagemagick nodejs p7zip perl pidcat python python3 ruby subversion tmux vim wget zsh fonts-dejavu
    fi
elif [ "$(uname -s)" = "Darwin" ]; then
    ln -sf ~/.dotfiles/hammerspoon ~/.hammerspoon
    ln -sf ~/.dotfiles/config/karabiner ~/.config/karabiner
    ln -sf ~/.dotfiles/Library/LaunchAgents/pl.com.siema.env.plist ~/Library/LaunchAgents/pl.com.siema.env.plist
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install ruby cloc cmake gcc git gradle imagemagick p7zip perl pidcat python subversion tmux vim wget zsh zsh-completions grep mas --with-default-names
    brew cask install google-chrome firefox opera dropbox skype iterm2 sublime-text tunnelblick karabiner-elements hammerspoon font-dejavu-sans font-dejavu-sans-mono-for-powerline steam spotify discord teamspeak-client veracrypt filezilla virtualbox virtualbox-extension-pack wine-staging disk-inventory-x adobe-acrobat-reader 0xed minecraft disk-arbitrator mpv deluge android-studio guild-wars2
    sudo gem install cocoapods
fi

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

