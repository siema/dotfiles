# if not running interactively, don't do anything
[[ $- != *i* ]] && return

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
if [ "$(uname -s)" = "Linux" ]; then 
    compinit
else
    compinit -u
fi
_comp_options+=(globdots)

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
export BASE16_SHELL_SET_BACKGROUND=false
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)" && eval base16_default-dark

# dircolors
if hash dircolors 2>/dev/null; then 
    [ -e ~/.dircolors ] && eval $(dircolors -b ~/.dircolors)
fi

# fancy prompt with vi mode
bindkey -v
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

# ===== key bindings =====
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

# ===== hax for tmux not enabling auto-rename =====
if [ -n "$TMUX" ]; then
    tmux source ~/.tmux.conf > /dev/null
fi

# ===== Mac stuff =====
if [ -d /usr/local/share/zsh-completions ]; then
    # completion on Mac
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# ===== aliases =====
[ -e ~/.aliases ] && source ~/.aliases

# ===== custom config =====
[ -e ~/.localrc ] && source ~/.localrc

# vim: ft=sh cms=#%s

