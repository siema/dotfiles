# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# ===== detect os =====

if [[ "$(uname -s)" == "Linux" ]]; then
    OS_LINUX=true
elif [[ "$(uname -s)" == "Darwin" ]]; then
    OS_MAC=true
else
    OS_CYGWIN=true
fi

# ===== zsh config =====

# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# history length
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# completion
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
if [[ -n $OS_LINUX ]]; then 
    compinit
else
    compinit -u
fi
_comp_options+=(globdots)

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-default-dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# dircolors
if [[ -z $OS_MAC ]]; then 
    [[ -e ~/.dircolors ]] && eval $(dircolors -b ~/.dircolors)
fi

# fancy prompt with vi mode
VIMODE='I'
function zle-line-init zle-keymap-select
{
    #VICOLOR="${${KEYMAP/vicmd/yellow}/(main|viins)/blue}"
    VICOLOR="${${KEYMAP/vicmd/blue}/(main|viins)/green}"
    VIMODE="${${KEYMAP/vicmd/N}/(main|viins)/I}"
    #PS1="%B%K{${VICOLOR}} %F{18}${VIMODE}%f %k%F{${VICOLOR}}%f %F{%(!.red.green)}%(!..%n@)%m%f %F{blue}%~ %(!.#.$)%f%b "
    PS1="%B%F{${VICOLOR}}[${VIMODE}]>%f %F{%(!.red.green)}%(!..%n@)%m%f %F{blue}%~ %(!.#.$)%f%b "
    #PS1="%B%F{${VICOLOR}}[${VIMODE}]%f %F{%(!.red.green)}%(!..%n@)%m%f %F{blue}%~%f %F{${VICOLOR}}%(!.#.$)%f%b "
    #PS1="%B%F{%(!.red.green)}%(!..%n@)%m%f %F{blue}%~%f %F{${VICOLOR}}%(!.#.$)%f%b "
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# ===== aliases =====

# some colors
if [[ -z $OS_MAC ]]; then 
    alias ls='ls --color=auto'
fi

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# make it human readable
alias ll='ls -lh'
alias df='df -h'
alias du='du -h'

# misc aliases
alias pidcat='pidcat --always-display-tags'
alias svnclean='svn st | grep ^! | awk "{print \\" --force \\"$2}" | xargs svn rm'

if [[ -n $OS_LINUX ]]; then
    alias poweroff='systemctl poweroff'
    alias restart='systemctl restart'
    alias suspend='systemctl suspend'
    alias hibernate='systemctl hibernate'
fi

# technically an alias with parameter :v
ssht(){
    ssh $1 -t 'LANG=en_US.UTF-8 tmux a || LANG=en_US.UTF-8 tmux'
}

# ===== exports =====

# enable shell colors for BSD/Mac tools (ls etc...)
export CLICOLOR=1

# wait 0.1s after key instead of 0.4
export KEYTIMEOUT=1

# vim4lyfe
bindkey -v
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
if [[ -n $OS_MAC ]]; then
    export PATH="/usr/local/sbin:$PATH"
    export PATH="/usr/local/bin:$PATH"
fi

export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/tools/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/build-tools/latest:$PATH"
export PATH="$NDK_HOME:$PATH"
export PATH="$HOME/.bin:$PATH"

# ===== misc stuff =====

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

# hax for tmux not enabling auto-rename
if [[ -n $TMUX ]]; then
    tmux source ~/.tmux.conf > /dev/null
fi

# ===== other Mac shit =====

if [[ -n $OS_MAC ]]; then
    # completion on Mac
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# Custom configuration
ZSHRC_CUSTOM="$HOME/.zshrc_custom"
[[ -s $ZSHRC_CUSTOM ]] && source $ZSHRC_CUSTOM

