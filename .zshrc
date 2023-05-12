# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh

plugins=(
    git
    golang
    history
    history-substring-search
    sudo
    macos
    node
    npm
    iterm2
    themes
    mosh
    vi-mode
    # zsh-colorls
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-dircolors
    web-search
)

# vi mode 
#bindkey -v
#export KEYTIMEOUT=1
[[ "$TERM" == "xterm" ]] && export TERM=xterm-256color
# ZSH_THEME="alanpeabody"
# source $(dirname $(gem which colorls))/tab_complete.sh
#
source $ZSH/oh-my-zsh.sh

MODE_INDICATOR="%F{white}+%f"
INSERT_MODE_INDICATOR="%F{green}+%f"
VI_MODE_SET_CURSOR=true

export CLICOLOR=1
# export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
# alias ll="ls -alG"
#works
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue

# alias 

alias dot="dotnet"
alias net="dotnet"
alias cat="bat"
alias gs="g status"
alias gss="g status -s"
alias c="clear"
alias n="nvim"
alias l="lvim"
alias nzsh="n $HOME/.zshrc"
alias nconfig="cd $HOME/.config/nvim/ && nvim ."
alias lconfig="cd $HOME/.config/lvim/ && lvim config.lua"
alias nalacritty="cd $HOME/.config/alacritty && nvim alacritty.yml"
alias nwez="cd $HOME/.config/wezterm && lvim wezterm.lua"
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias mbrew='arch -arm64e /opt/homebrew/bin/brew'
alias dotnet64='/usr/local/share/dotnet/x64/dotnet'
alias flashCorne='qmk flash -kb crkbd -km vita_via'
alias compileCorne='qmk compile -kb crkbd -km vita_via'
alias doom="~/.emacs.d/bin/doom install"
# alias ls="colorls -l"
# alias la="colorls -la"
# alias ld="colorls -dl"

alias cleanResolvers="rm -rf /etc/resolver/homecityice*"
alias homecity='cd ~/code/smart/homeCityIce/'
alias hci='cd ~/code/smart/homeCityIce/'
alias hciDocs='cd ~/Documents/smart/hci/'
alias boss='cd ~/code/smart/homeCityIce/RoutificRouteImporter/'
alias hcaMobile='cd ~/code/smart/homeCityIce/hca---mobile/'
alias hhaApi='cd ~/code/smart/homeCityIce/hha---api'
alias hha='cd ~/code/smart/homeCityIce/hha---front-end'
alias mapline='cd ~/code/smart/homeCityIce/MapLineApi'

alias nKitty='cd ~/.config/kitty/ && n kitty.conf'
alias nkitty='cd ~/.config/kitty/ && n kitty.conf'
# keyboards
alias planck="nvim ~/qmk_firmware/keyboards/planck/keymaps/vita"
alias lily="nvim ~/qmk_firmware/keyboards/lily58/keymaps/vita"
alias corne="cd ~/qmk_firmware/keyboards/crkbd/keymaps/vita_corne && nvim ."


eval $(/opt/homebrew/bin/brew shellenv)

# node 
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# yarn
export PATH="$PATH:`yarn global bin`"
export PATH=~/.npm-global/bin:$PATH

# go
export GOPATH=$HOME/code/go
export PATH=$GOPATH:$PATH
export PATH=$HOME/code/go/bin:$PATH

## Python3
export PYTHON3=/Users/chavita/Library/Python/3.9/lib/python/site-packages
export PATH=$PYTHON3:$PATH

# posgresql
export PLSQL=/Applications/Postgres.app/Contents/Versions/14/bin
export PATH=$PLSQL:$PATH

# dotnet core
export NET=/usr/local/share/dotnet
export PATH=$NET:$PATH
export DOTNET_ROOT=/usr/local/share/dotnet/
export DOTNET_ROOT_x64=/usr/local/share/dotnet/x64/
export PATH=$PATH:/Users/srocha/.dotnet/tools

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# java
# export JAVA_HOME=$(/usr/libexec/java_home)


# homecityice
export HCI_APPLICATION_ENVIRONMENT=Development
export PATH=$HCI_APPLICATION_ENVIRONMENT:$PATH

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# jetbrains toolbox
export PATH=/Users/srocha/jetbrains:$PATH

# netcoredbg
export PATH=$PATH:/usr/local/
# local pwd='%{$fg[blue]%}%c~%{$reset_color%}'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND=''

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#if [$TERM_PROGRAM == "Apple_Terminal"]; then
#else
eval "$(oh-my-posh init zsh --config ~/.oh-my-posh/themes/zash.chavita.omp.json)"
#fi


# .NET LOCAL ENVIRONMENTS
export ASPNETCORE_ENVIRONMENT=Local

# powerlevel10k
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# source ~/powerlevel10k/powerlevel10k.zsh-theme
#  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#  [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"

# Flash keyboard
#  qmk flash -kb crkbd -km via_alternative_choc


# ZSH_HIGHLIGHT_STYLES[default]=none
# ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
# ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
# ZSH_HIGHLIGHT_STYLES[alias]=fg=darkcyan,bold
# ZSH_HIGHLIGHT_STYLES[builtin]=fg=cyan,bold
# ZSH_HIGHLIGHT_STYLES[function]=fg=cyan,bold
# ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
# ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
# ZSH_HIGHLIGHT_STYLES[commandseparator]=none
# ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
# ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
# ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
# ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
# ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
# ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
# ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
# ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
# ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
# ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
# ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
# ZSH_HIGHLIGHT_STYLES[assign]=none


setTerminalText() {
  local mode = $1 ; shift
  echo -ne "\033]$mode;$@\007"
}

stt_both  () { setTerminalText 0 $@; }
stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }

function rename_wezterm_title {
  echo "\x1b]1337;SetUserVar=panetitle=$(echo -n $1 | base64)\x07"
}

function setTitle {
  echo "\x1b]1337;SetUserVar=panetitle=$(echo -n $1 | base64)\x07"
}

function getPid {
  lsof -t -i:7202
}


export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
