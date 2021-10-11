# exa
alias ls='exa'

# web
alias bi='bundle install'
alias wds='bin/webpack-dev-server'

# enviroment
alias sz='source ~/.zshrc'
alias codez='code ~/.zshrc'
alias codea='code ~/.zsh.d/alias.zsh'
alias codec='code ~/.zsh.d/config.zsh'
alias codel='code ~/.zsh.d/local.zsh'

# git
function gas() {
  git add -A;
  git status;
}
alias gs='git status'
alias gas='gas'
alias gb='git branch'
alias gf='git fetch origin'
alias gcb='git checkout -b'
alias ga='git add'
alias gcm='git commit -m'
alias gcmfix='git commit --amend -m'
alias gcr='git reset --soft HEAD^'
alias gma='git merge --abort'

# push
alias gpu='git push -u origin HEAD'
alias gpo='git push origin HEAD'

# peco
alias gc='git branch | peco | xargs git checkout'
alias gsp="git stash list | peco | awk -F '{|}' '{print $2}' | git stash pop"
alias gss='git stash save'

# Ctr + r でコマンドインクリメンタルサーチ
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# リモートブランチを候補に含めたチェックアウト
function gcop() {
  git branch -a --sort=-authordate |
    grep -v -e '->' -e '*' |
    perl -pe 's/^\h+//g' |
    perl -pe 's#^remotes/origin/###' |
    perl -nle 'print if !$c{$_}++' |
    peco |
    xargs git checkout
}
alias gcop='gcop'

# yarn
alias yi='yarn install'

# docker
alias dcps='docker-compose ps'
alias dcup='docker-compose up -d'
alias dcdown='docker-compose down'

# sound
# !brew install switchaudio-osx!
function sci() {
    SwitchAudioSource -s 外部ヘッドフォン;
    SwitchAudioSource -t input -s 外部マイク;
}

function scb() {
    SwitchAudioSource -s 'SOUNDPEATS TrueAir2';
    SwitchAudioSource -t input -s 'SOUNDPEATS TrueAir2';
}

alias sci='sci'
alias scb='scb'

