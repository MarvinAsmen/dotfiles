# " ============================================================================ "
# " ===                           SETTINGS                                   === "
# " ============================================================================ "
export EDITOR="nvim"
export VISUAL="nvim"



# " ============================================================================ "
# " ===                           ALIAS                                      === "
# " ============================================================================ "
alias ohmyzsh="nvim ~/.oh-my-zsh/oh-my-zsh.sh"
alias ohmyzshp="nvim ~/.oh-my-zsh/oh-my-zsh-private.sh"
alias t="tmux"
alias tcfg="nvim ~/.tmux.conf"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias zshrc="nvim ~/.zshrc"
alias home="cd ~"
alias ls="nnn -e"
alias vim="nvim"
alias yabairc="nvim ~/.yabairc"
alias skhdrc="nvim ~/.skhdrc"


# " ============================================================================ "
# " ===                           FZF                                        === "
# " ============================================================================ "
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



# " ============================================================================ "
# " ===                           NNN                                        === "
# " ============================================================================ "
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_PLUG=""

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
