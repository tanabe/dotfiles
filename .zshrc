#
# UI
#

PROMPT='%F{1}%~%f $ '

#
# environment
#

export LANG="en_US.UTF-8"
export TERM="xterm-256color"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH

#
# alias
#

alias tig='tig status'
alias ll='gls -l -a --color=auto'
alias now='date +%Y%m%d%H%M%S'

#
# completion system
#

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

#
# history
#

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_no_store
setopt hist_reduce_blanks

#
# rbenv
#

eval "$(rbenv init -)"

#
# pyenv
#

eval "$(pyenv init -)"

#
# plugins
# install with homebrew
#

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc';
fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc';
fi
