# enable shell colors for BSD/Mac tools (ls etc...)
export CLICOLOR=1

# wait 0.1s after key instead of 0.4
export KEYTIMEOUT=1

# locale
export LANG=en_US.UTF-8

# vim4lyfe
export VISUAL='vim'
export EDITOR='vim'
export SVN_EDITOR='vim -c "set syntax=diff"'

# android and ndk
export ANDROID_HOME="$HOME/android/sdk"
export NDK_HOME="$HOME/android/sdk/ndk-bundle"

# Java
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"

# PATH
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/tools/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/build-tools/latest:$PATH"
export PATH="$NDK_HOME:$PATH"
export PATH="$HOME/.bin:$PATH"

# Homebrew
if [ -e "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if [ -e "/usr/local/bin/brew" ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# pyenv
if command -v pyenv >/dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# rbenv
if command -v rbenv >/dev/null; then
    eval "$(rbenv init -)"
fi

# asdf
if [ -e "/opt/homebrew/opt/asdf/libexec/asdf.sh" ]; then
    source "/opt/homebrew/opt/asdf/libexec/asdf.sh"
fi
if [ -e "/usr/local/opt/asdf/libexec/asdf.sh" ]; then
    source "/usr/local/opt/asdf/libexec/asdf.sh"
fi

# ===== custom config =====
[ -e ~/.localprofile ] && source ~/.localprofile

