# -------------------------------------
# 環境変数
# -------------------------------------

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# -------------------------------------
# zshのオプション
# -------------------------------------

# ディレクトリの色を変更 青 → シアン
export LSCOLORS=gxfxcxdxbxegedabagacad

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=5000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY


# -------------------------------------
# パス
# -------------------------------------

# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

path=(
    $HOME/bin(N-/)
            /usr/local/bin(N-/)
                        /usr/local/sbin(N-/)
                                        $path
                                                        )


# -------------------------------------
# プロンプト
# -------------------------------------

autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -Uz is-at-least

# begin VCS
zstyle ":vcs_info:*" enable git svn hg bzr
zstyle ":vcs_info:*" formats "(%s)-[%b]"
zstyle ":vcs_info:*" actionformats "(%s)-[%b|%a]"
zstyle ":vcs_info:(svn|bzr):*" branchformat "%b:r%r"
zstyle ":vcs_info:bzr:*" use-simple true

zstyle ":vcs_info:*" max-exports 6

if is-at-least 4.3.10; then
    zstyle ":vcs_info:git:*" check-for-changes true # commitしていないのをチェック
            zstyle ":vcs_info:git:*" stagedstr "<S>"
                        zstyle ":vcs_info:git:*" unstagedstr "<U>"
                                        zstyle ":vcs_info:git:*" formats "(%b) %c%u"
                                                            zstyle ":vcs_info:git:*" actionformats "(%s)-[%b|%a] %c%u"
                                                                                fi

function vcs_prompt_info() {
    LANG=en_US.UTF-8 vcs_info
            [[ -n "$vcs_info_msg_0_" ]] && echo -n " %{$fg[white]%}$vcs_info_msg_0_%f"
                    }
                            # end VCS

OK="^_^%) "
NG="X_X%) "

PROMPT=""
PROMPT+="%(?.%F{cyan}$OK%f.%F{magenta}$NG%f) "
PROMPT+="%n@%m "
PROMPT+="%# %F{cyan}%d%f"
#PROMPT+="\$(vcs_prompt_info)"
PROMPT+="
"
PROMPT+="> "

RPROMPT="(%i)[%D %*]"


# -------------------------------------
# エイリアス
# -------------------------------------

# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける


# -------------------------------------
# その他（プラグイン関係）
# -------------------------------------

# for pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# NAS接続
