#
# environment
#

export LANG="ja_JP.UTF-8"
export TERM="xterm-256color"
export PATH="/usr/local/opt/openssl/bin:$PATH"

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
HISTSIZE=1000000
SAVEHIST=1000000

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
