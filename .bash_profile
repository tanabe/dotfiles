if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

eval "$(rbenv init -)"
export PATH="/usr/local/opt/openssl/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
