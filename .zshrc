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
# Keep a reference to the original preprompt renderer
# eval "original_$(declare -f prompt_pure_preprompt_render)"

# Override: add a right-aligned timestamp on the SAME line as the path
#prompt_pure_preprompt_render() {
#  # Let Pure build its usual preprompt (left side)
#  original_prompt_pure_preprompt_render
#
#  # Add/replace the right side for that same line
#  # (format examples: %D{%H:%M:%S}, %D{%Y-%m-%d %H:%M})
#  RPROMPT='%F{8}%D{%H:%M:%S}%f'
#}
#######################################################################################
# history size
#######################################################################################
HISTFILESIZE=1000000
HISTSIZE=1000000

#######################################################################################
# aliases
#######################################################################################
alias rm="trash"
alias grep="/usr/bin/grep --color=always"
alias gufp="git add -u && git commit --fixup head && git push origin head"
alias hist="history 1"
# The commented out are Mac commands replaced by those from coreutils below it.
#alias ll='ls -lGh'
#alias la='ls -lGhrAp'
alias ll='ls -lGh --group-directories-first --color'
alias la='ls -alGh --group-directories-first --color'
alias gulog='gcloud auth application-default login'
alias "gcloud auth application-default login --no-launch-browser"

#######################################################################################
# Environment variables set everywhere
#######################################################################################
export ANSIBLE_CONFIG=$HOME/.ansible/ansible.cfg
export BROWSER="brave"
export EDITOR="nvim"
export PIP_REQUIRE_VIRTUALENV=true
export UV_MANAGED_PYTHON=1
export XDG_CONFIG_HOME="$HOME/.config"
# export VIMINIT='source $HOME/.config/vim/.vimrc'
export VOLTA_FEATURE_PNPM=1
export CLAUDE_AUTOCOMPACT_PCT_OVERRIDE=75
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

#######################################################################################
# scmpuff - lite alternative to scm_breeze (https://github.com/mroth/scmpuff/#README)
#######################################################################################
[ -z "$CLAUDECODE" ] && [ -s "/Users/andrew/.scm_breeze/scm_breeze.sh" ] && source "/Users/andrew/.scm_breeze/scm_breeze.sh"
#eval "$(scmpuff init -s)"
## Additional aliases that were in scm_breeze but not available with scmpuff
#alias gco="git checkout"
#alias gcb="git checkout -b"
#alias gc="git commit"
#alias gps="git push origin"
#alias gpl="git pull origin"

# export HYPERTUNE_TOKEN=$(gcloud secrets versions access latest --secret=HYPERTUNE_TOKEN)
# export PATH="/opt/homebrew/opt/trash/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/andrew/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

rye-aws() {
  local env="${1:?Usage: rye-aws <dev|staging|prod>}"
  local account_id

  case "$env" in
    dev)     account_id="757195445067" ;;
    staging) account_id="523761210016" ;;
    prod)    account_id="036589172967" ;;
    *)       echo "Unknown env: $env (use dev, staging, prod)"; return 1 ;;
  esac

  # Clear any previous assumed role so we fall back to SSO identity
  unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN

  eval "$(aws sts assume-role \
    --role-arn "arn:aws:iam::${account_id}:role/OrganizationAccountAccessRole" \
    --role-session-name "rye-${env}" \
    --query 'Credentials.[AccessKeyId,SecretAccessKey,SessionToken]' \
    --output text | awk '{
      print "export AWS_ACCESS_KEY_ID="$1;
      print "export AWS_SECRET_ACCESS_KEY="$2;
      print "export AWS_SESSION_TOKEN="$3
    }')"

  echo "Switched to $env ($account_id)"
}
