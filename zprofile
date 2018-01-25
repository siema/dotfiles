# enable shell colors for BSD/Mac tools (ls etc...)
export CLICOLOR=1

# wait 0.1s after key instead of 0.4
export KEYTIMEOUT=1

# vim4lyfe
export VISUAL='vim'
export EDITOR='vim'
export SVN_EDITOR='vim -c "set syntax=diff"'

# android and ndk
export ANDROID_HOME="$HOME/android/sdk"
export NDK_HOME="$HOME/android/sdk/ndk-bundle"

# AWEngine
export AW_ENGINE_PATH="$HOME/projects/multi/AWEngine"
export AW_PLUGIN_MANAGER_PATH="$HOME/projects/multi/AWPluginManager"
export TC_RESKIN_PATH="$HOME/projects/multi/TCReskin"

# PATH
if [ -n "/usr/local/bin/brew" ]; then
    export PATH="/usr/local/sbin:$PATH"
    export PATH="/usr/local/bin:$PATH"
fi

export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/tools/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/build-tools/latest:$PATH"
export PATH="$NDK_HOME:$PATH"
export PATH="$HOME/.bin:$PATH"

# ===== custom config =====
[ -e ~/.localprofile ] && source ~/.localprofile

