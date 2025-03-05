########################################
# 環境変数
export LANG="ja_JP.UTF-8"

########################################
# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=$XDG_CACHE_HOME/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit && compinit

# vim mode
bindkey -v

# vcs_info
autoload -Uz vcs_info

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default

# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# ls after cd
chpwd() {
	if [[ $(pwd) != $HOME ]]; then;
		ls
	fi
}

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# エイリアス


alias la='ls -a'
alias ll='ls -l'

alias mkdir='mkdir -p'

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

########################################

# rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
[ -s $CARGO_HOME/env ] && . "$CARGO_HOME/env"

# volta
export VOLTA_HOME="$XDG_DATA_HOME/volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# bun
export BUN_INSTALL="$XDG_DATA_HOME/bun"
[ -s $BUN_INSTALL/_bun ] && source $BUN_INSTALL/_bun
export PATH="$BUN_INSTALL/bin:$PATH"

# deno
export DENO_INSTALL="$XDG_DATA_HOME/deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# go
export GOPATH="$XDG_DATA_HOME/go"

# sccache
export SCCACHE_DIR="$XDG_CACHE_HOME/sccache"

# npm
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"

# nugget
export NUGET_PACKAGES="$XDG_CACHE_HOME/nuget"

# aws
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"

# alias

if not command -v cargo &> /dev/null ; then
    echo cargo not found
fi

if command -v eza &> /dev/null ; then
    alias ls='eza'
fi

if command -v bat &> /dev/null ; then
    alias cat='bat'
fi

if command -v fd &> /dev/null ; then
    alias find='fd'
fi

if command -v nvim &> /dev/null ; then
    alias vim='nvim'
fi

if command -v starship &> /dev/null ; then
    eval "$(starship init zsh)"
fi

if command -v rg &> /dev/null ; then
    alias grep='rg'
fi

if command -v jj &> /dev/null ; then
    source <(jj util completion zsh)
fi

# pyenv
export PYENV_ROOT="$XDG_CACHE_HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv &> /dev/null ; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    export PYENV_BIN="$PYENV_ROOT/versions/neovim3/bin"
fi

#.zshrc自動コンパイル
if [ ! -f $XDG_CONFIG_HOME/zsh/.zshrc.zwc -o $XDG_CONFIG_HOME/zsh/.zshrc -nt $XDG_CONFIG_HOME/zsh/.zshrc.zwc ]; then
    rm -rf $XDG_CONFIG_HOME/zsh/.zcompdump
    zcompile $XDG_CONFIG_HOME/zsh/.zshrc
fi
