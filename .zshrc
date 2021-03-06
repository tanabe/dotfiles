#
# environment
#

export LANG="en_US.UTF-8"
export TERM="xterm-256color"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
export PATH="/usr/local/sbin:$PATH"

# brew install ant
export PATH="/usr/local/opt/openjdk/bin:$PATH"

#
# aliases
#

alias tig='tig status'
alias ll='gls -l -a --color=auto'
alias now='date +%Y%m%d%H%M%S'
alias code="open -a /Applications/Visual\ Studio\ Code.app"
alias agl='ag --pager="less -R"'

alias -s md=code
alias -s json=code
alias -s {js,cs,ts,html,css}=code
alias -s py=code

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
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS

#
# Ruby
#

eval "$(rbenv init -)"

#
# Python
#

eval "$(pyenv init -)"

#
# Go
#
export GOPATH=$HOME/go

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

# zsh autojump
# https://github.com/wting/autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#
# PROMPT
#

PROMPT='%F{1}%~%f $ '

#
# powerline
# see: https://github.com/b-ryan/powerline-shell
# how to setup
# $ brew tap sanemat/font
# $ brew install ricty --with-powerline
#

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
