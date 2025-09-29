#######################################################################################
# zsh settings
#######################################################################################
# Enable autocompletion
autoload -Uz compinit
compinit -C  # Uses a cached version for faster startup
# Disable terminal beep sounds
unsetopt BEEP
# Make coreutils the default for General Commands
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
# Add volta to path
export PATH="$HOME/.volta/bin:$PATH"
# Add personal cli tools to PATH
export PATH="$HOME/bin:$PATH"

#######################################################################################
# pure - preconfigured ZSH prompt (https://github.com/sindresorhus/pure)
#######################################################################################
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
RPROMPT="[%*]"

#######################################################################################
# history size
#######################################################################################
HISTFILESIZE=1000000
HISTSIZE=1000000

#######################################################################################
# aliases
#######################################################################################
alias grep="/usr/bin/grep --color=always"
alias gufp="git add -u && git commit --fixup head && git push origin head"
alias hist="history 1"
# The commented out are Mac commands replaced by those from coreutils below it.
#alias ll='ls -lGh'
#alias la='ls -lGhrAp'
alias ll='ls -lGh --group-directories-first --color'
alias la='ls -alGh --group-directories-first --color'

#######################################################################################
# Environment variables set everywhere
#######################################################################################
export ANSIBLE_CONFIG=$HOME/.ansible/ansible.cfg
export BROWSER="brave"
export EDITOR="vim"
export PIP_REQUIRE_VIRTUALENV=true
export UV_MANAGED_PYTHON=1
export XDG_CONFIG_HOME="$HOME/.config"
export VIMINIT='source $HOME/.config/vim/.vimrc'
export VOLTA_FEATURE_PNPM=1
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

#######################################################################################
# scmpuff - lite alternative to scm_breeze (https://github.com/mroth/scmpuff/#README)
#######################################################################################
[ -s "/Users/andrew/.scm_breeze/scm_breeze.sh" ] && source "/Users/andrew/.scm_breeze/scm_breeze.sh"
#eval "$(scmpuff init -s)"
## Additional aliases that were in scm_breeze but not available with scmpuff
#alias gco="git checkout"
#alias gcb="git checkout -b"
#alias gc="git commit"
#alias gps="git push origin"
#alias gpl="git pull origin"

export HYPERTUNE_TOKEN=$(gcloud secrets versions access latest --secret=HYPERTUNE_TOKEN)
