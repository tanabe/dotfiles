#
# environment
#

export LANG="en_US.UTF-8"
export TERM="xterm-256color"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# brew install ant
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# always colored less
export LESS='-R'

#
# aliases
#

alias tig='tig status'
alias ll='gls -l -a --color=always'
alias now='date +%Y%m%d%H%M%S'
alias code="open -a /Applications/Visual\ Studio\ Code.app"
alias rg='rg -i --color always'
alias more='more -R'
alias history='history -E 1'
alias gcb='git checkout $(git branch | sed -r "s/^[ \*]+//" | peco)'
alias vim='nvim'
alias vi='nvim'
alias sandbox='cd ~/sandbox'
alias git-push-current-branch='git branch | grep "\*" | awk "{ print \$2 }" | chooser | xargs -I{} git push origin {}'
alias git-change-branch='git branch --format="%(refname:short)" | chooser --multiple | xargs -I{} git checkout {}'
alias git-delete-branch='git branch --format="%(refname:short)" | chooser --multiple | xargs -I{} git branch -d {}'

#
# These files will be opened with Visual Studio Code
#

alias -s md=code
alias -s json=code
alias -s {js,cs,ts,html,css}=code
alias -s py=code

#
# completion system
#

zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

#
# history
#

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

#
# Ruby
# https://github.com/rbenv/rbenv
#

eval "$(rbenv init -)"

#
# Python
# https://github.com/pyenv/pyenv
#

eval "$(pyenv init -)"

#
# Go
#
export GOPATH=$HOME/go

#
# Node.js
# https://github.com/Schniz/fnm
#
eval "$(fnm env --use-on-cd)"

#
# plugins
#

# zsh-completions
# brew install zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# zsh-autosuggestions
# brew install zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
# brew install zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh autojump
# https://github.com/wting/autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

#
# PROMPT
#

PROMPT='%F{1}%~%f $ '

#
# powerline
# see: https://github.com/b-ryan/powerline-shell
# https://github.com/b-ryan/powerline-shell#customization


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

#
# ignore append history
#

function zshaddhistory() {
  emulate -L zsh
  if ! [[ "$1" =~ "(^ |pwd|--force)" ]] ; then
      print -sr -- "${1%%$'\n'}"
      fc -p
  else
      return 1
  fi
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hideaki_tanabe/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/hideaki_tanabe/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hideaki_tanabe/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/hideaki_tanabe/google-cloud-sdk/completion.zsh.inc'; fi
