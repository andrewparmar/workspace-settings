# zsh settings
#export ZDOTDIR=$HOME/.config/zsh
#HISTFILE=~/.zsh_history
#setopt appendhistory
#autoload -Uz compinit
#compinit
#setopt interactivecomments

# history size
HISTSIZE=1000000
HISTFILESIZE=1000000

# beeping is annoying
unsetopt BEEP

## homebrew
#eval "$(/opt/homebrew/bin/brew shellenv)"
#
## prompt
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

## Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b '

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} > 'kkk
setopt PROMPT_SUBST
NEWLINE=$'\n'
#NEWLINE='12345'
#PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
#PROMPT='%n@%m: ${(%):-%~} '
#PROMPT='%F{cyan}%n%f : %~ %F{green}${vcs_info_msg_0_}%f$ '
#PROMPT="%F{cyan}%n%f : %~ %F{green}${vcs_info_msg_0_}%f"$'\n'"$ "
#PROMPT="%F{cyan}%n%f : %~ %F{green}${vcs_info_msg_0_}%f ${NEWLINE}$ "
#PROMPT='%F{cyan}%n%f : %~ ${vcs_info_msg_0_} ${NEWLINE} $ '
autoload -U colors && colors
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
PROMPT='%{$fg[cyan]%}%n%{$reset_color%}: %~ %{$fg[green]%}${vcs_info_msg_0_} ${NEWLINE}%{$reset_color%}$ '

# aliases
alias ll='ls -al --color'
alias grep="`which grep` --color=always"
alias hist="history 1"
alias gufp="git add -u && git commit --fixup head && git push origin head"

# Environment variables set everywhere
export EDITOR="vim"
export BROWSER="brave"
export VIMINIT="source ~/.config/vim/.vimrc"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Add infrastructure bin directory to PATH environment variable
export PATH=$HOME/repo/infrastructure/bin:$PATH


# Enable vi editing mode
# bindkey -v
# Disabled because this disables reverse search using ctrl-r
# Need to find a workaround
#precmd() { print "" }
#
fpath+=("$(brew --prefix)/share/zsh/site-functions")

autoload -U promptinit; promptinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

# change the path color
zstyle :prompt:pure:path color white

# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:*' color cyan

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

prompt pure


# Poetry specific
fpath+=~/.zfunc
autoload -Uz compinit && compinit
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# scm_breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"
