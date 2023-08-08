if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# not all systems have `vim`, but i like it when they do
[[ -x $(whence -p vim) ]] && export EDITOR=$(whence -p vim)
# old (and/or crappy) versions of `grep` choke on this - make it safe
grep -q --color '.' . 2> /dev/null && export GREP_OPTIONS='--color'

# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _match _approximate
zstyle ':completion:*' completions set
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob unset
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
#zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' '' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' menu select=5
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
# you can't kill it dead - no duplicate completion on rm/kill/diff
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes

# location of history
HISTFILE=~/.zhistory
# number of lines kept in history
HISTSIZE=1000
# number of lines saved in the history after logout
SAVEHIST=1000
# append command to history file once executed
setopt inc_append_history
setopt appendhistory beep nomatch notify
unsetopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install

# fucking macs - fixes fn-delete
bindkey -e '\e[3~' delete-char


# store environment vars elsewhere
[ -f ~/.zsh_env_vars ] && source ~/.zsh_env_vars
# store local var overrides vars elsewhere
[ -f ~/.zsh_local_vars ] && source ~/.zsh_local_vars
# store aliases elsewhere
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
#store path
[ -f ~/.zsh_path ] && source ~/.zsh_path
#store machine specific path
[ -f ~/.zsh_local_path ] && source ~/.zsh_local_path
#store ssh
[ -f ~/.zsh_ssh_agent ] && source ~/.zsh_ssh_agent
#store wsl
[ -f ~/.zsh_wsl_startup ] && source ~/.zsh_wsl_startup

#FZF
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

# This makes cd=pushd
setopt AUTO_PUSHD

# display for xterm
[ -z $DISPLAY ] && export DISPLAY=localhost:0.0

# zsh-hilighting, needs to be sourced before history-substring-search
source ~/.zsh/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# zsh-history-substring-search
# bind UP and DOWN arrow keys
source ~/.zsh/zsh-history-substring-search.zsh
for keycode in '[' '0'; do
  bindkey "^[${keycode}A" history-substring-search-up
  bindkey "^[${keycode}B" history-substring-search-down
done
unset keycode

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

. "$HOME/.asdf/asdf.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

eval "$(starship init zsh)"
