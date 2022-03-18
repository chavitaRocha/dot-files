export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="alanpeabody"
plugins=(
    git
    golang
    history
    history-substring-search
    sudo
    macos
    lein
    node
    npm
    jump
    mosh
    k
    z
    zsh-completions
    almostontop
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# set vim commands to zsh
# set -o vi
# bindkey -v

## ALIAS
alias gs="g status"
alias gss="g status -s"
alias c="clear"
alias n="nvim"
alias ez="vi $HOME/.zshrc"
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias mbrew='arch -arm64e /opt/homebrew/bin/brew'
# Share screen with VLC to Google Meet
# [ 0,    0, 1920, 1080] for my entire left screen
# [ 0, 1920, 1920, 1080] for my entire right screen
alias meet="vlc --no-video-deco --no-embedded-video --screen-fps=30 --screen-top=32  --screen-left=0  --screen-width=1920  --screen-height=1000  screen://"

## GIT
GIT_AUTHOR_NAME="Chavita1386"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="chavita1386@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global credential.helper "cache --timeout 9200"
git config --global core.editor "nvim"
git config --global core.autocrlf input

#export PATH=$PATH:~/
# NPM Global without sudo
# mkdir "${HOME}/.npm-packages"
# npm config set prefix "${HOME}/.npm-packages"
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
## NPM
npm set init.author.email "chavita1386@gmail.com"
npm set init.author.name "Chavita1386"
npm set init.license "MIT"


## File watcher
#sysctl -p

##### EXPORT

# Node.JS
export PATH="$PATH:`yarn global bin`"
export PATH=~/.npm-global/bin:$PATH

## JAVA / CLOJURE
#export JAVA_HOME=$(which java)
#export M2=$HOME/.m2
#export PATH=$PATH:$M2

## GO
export GOPATH=$HOME/code/go
export PATH=$GOPATH:$PATH
export PATH=$HOME/code/go/bin:$PATH

## Python3
export PYTHON3=/Users/chavita/Library/Python/3.9/lib/python/site-packages
export PATH=$PYTHON3:$PATH

## PosgreSQL
export PLSQL=/Applications/Postgres.app/Contents/Versions/14/bin
export PATH=$PLSQL:$PATH

## DotNet
export NET=/usr/local/share/dotnet
export PATH=$NET:$PATH

# Homecity Ice
export HCI_APPLICATION_ENVIRONMENT=Development
export PATH=$HCI_APPLICATION_ENVIRONMENT:$PATH

## Pure theme
#fpath+=$HOME/.zsh/pure
#autoload -U promptinit; promptinit
# optionally define some options
#PURE_CMD_MAX_EXEC_TIME=10
# change the path color
#zstyle :prompt:pure:path color '#96caf2'
# change the color for both `prompt:success` and `prompt:error`
# zstyle ':prompt:pure:prompt:*' color '#EBC5EE'
#zstyle :prompt:pure color '#EBC5EE'
# turn on git stash status
#zstyle :prompt:pure:git:stash show yes
#prompt pure


## CUSTOM FUNCTIONS
# Cd to render
function ninit() {
  nvim ~/.config/nvim/init.vim
}

function vimc() {
  nvim ~/.vimrc
}

function nzsh() {
  nvim ~/.zshrc
}

function nterminal() {
  nvim ~/.config/alacritty/alacritty.yml
}

function planck() {
  nvim ~/qmk_firmware/keyboards/planck/keymaps/vita
}

function corne() {
  nvim ~/qmk_firmware/keyboards/crkbd/keymaps/chavita
}

function findNodeModules() {
  find . -name "node_modules" -type d -prune | xargs du -chs
}

function removeNodeModules() {
  find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
}

#function ni3() {
  #nvim ~/.config/i3/config
#}

function pushConfig() {
  cp ~/.zshrc ~/dot-files/.zshrc &&
  cp -R ~/.config/nvim ~/dot-files/.config/ &&
  cp ~/.oh-my-zsh/themes/alanpeabody.zsh-theme ~/dot-files/alanpeabody.zsh-theme
}

function pullConfig() {
	cp  ~/dot-files/.zshrc ~/.zshrc &&
  cp -R ~/dot-files/.config/nvim/ ~/.config/nvim &&
  cp ~/dot-files/alanpeabody.zsh-theme ~/.oh-my-zsh/themes/alanpeabody.zsh-theme
}

function cdcode() {
  cd ~/code
}
# cd to exercism
function cdExercism() {
  cd ~/snap/exercism/5/exercism/go/
}
# cd to go path
function cdgo() {
  cd ~/code/go/src/github.com/chavita1386
}
# cd to js folder projects
function cdjs() {
	cd ~/code/js
}
# cd to typescript folder
function cdtypescript() {
	cd ~/code/js/typescript/github.com/chavita1386
}

#cd to homecityice
function homecity() {
  cd ~/code/smart/homeCityIce/
}

function hand() {
  cd ~/code/smart/homeCityIce/hha---front-end
}

function hca() {
  cd ~/code/smart/homeCityIce/hca---mobile
}

function windowClass() {
  xprop | grep WM_CLASS | awk '{ print $4 }'
}
# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}
function mdt() {
    markdown "$*" | lynx -stdin
}

function mdb() {
    local TMPFILE=$(mktemp)
    markdown "$*" > $TMPFILE && ( xdg-open $TMPFILE > /dev/null 2>&1 & )
}
# Git clone + npm install
function gcn {
    url=$1;
    if [ -n "${1}" ]; then
        echo 'OK'
    else
        echo 'Koooooooooooooooo'
    fi
    cd ~/code;
    reponame=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//');
    git clone $url $reponame;
    cd $reponame;
    npm install;
}

function cleanResolvers() {
  rm -rf /etc/resolver/homecityice*
}

local pwd='%{$fg[blue]%}%c~%{$reset_color%}'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#export PATH=/usr/local/bin:$PATH
eval $(/opt/homebrew/bin/brew shellenv)
# Android configuration
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# ignore fzh files
export FZF_DEFAULT_COMMAND=''

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
