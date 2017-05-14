#!/bin/sh
ln -sf .dotfiles/gitconfig ~/.gitconfig
ln -sf .dotfiles/tmux.conf ~/.tmux.conf
ln -sf .dotfiles/vimrc ~/.vimrc
ln -sf .dotfiles/zshrc ~/.zshrc

if [ "$(uname -s)" = "Linux" ]; then
    if hash sudo 2>/dev/null; then
        SU_CMD="sudo"
    else
        SU_CMD="su -c"
    fi

    if hash pacman 2>/dev/null; then
        $SU_CMD pacman -S cloc cmake git imagemagick nodejs p7zip perl python python3 ruby subversion tmux vim wget zsh
    elif hash apt-get 2>/dev/null; then
        $SU_CMD apt-get install cloc cmake git imagemagick nodejs p7zip perl pidcat python python3 ruby subversion tmux vim wget zsh
    fi
elif [ "$(uname -s)" = "Darwin" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install ruby cloc cmake gcc git imagemagick p7zip perl pidcat python subversion tmux vim wget zsh zsh-completions
    brew cask install google-chrome iterm2 sublime-text tunnelblick caskroom/fonts/font-dejavu-sans caskroom/fonts/font-dejavu-sans-mono-for-powerline
fi

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

