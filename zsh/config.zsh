if [[ -n $SSH_CONNECTION ]]; then
  export PS1='%m:%3~$(git_info_for_prompt)%# '
else
  export PS1='%3~$(git_info_for_prompt)%# '
fi

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

#fpath=($ZSH/zsh/functions $fpath)

#autoload -U $ZSH/zsh/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt always_to_end            # When complete from middle, move cursor
setopt append_history           # Append to history file, not overwrite it
setopt auto_cd                  # If a command is not in the hash table, and there exists an executable directory by that name, perform the cd command to that directory.
setopt complete_in_word         # Always auto complete, not just at the end
setopt extendedglob             # Extra filename generation features
setopt hist_ignore_dups         # Don't enter command in history if it is duplicate of previous command
setopt hist_find_no_dups        # Don't display duplicates when searching commands
setopt inc_append_history       # Append history item as soon as command is executed, rather than waiting until the shell is killed
setopt nobeep                   # Kill the fscking beep!
setopt nohup										# In general, we don't kill background jobs upon logging out
setopt prompt_subst             # parameter expansion, command substitution and arithmetic expansion is performed in prompts

bindkey '^K' kill-whole-line
bindkey "^R" history-incremental-search-backward
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^B" vi-backward-word
bindkey "^F" vi-forward-word
bindkey "^W" vi-backward-kill-word
bindkey "^[" vi-cmd-mode
