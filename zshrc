# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git jira brew bower common-aliases)

# Make autojump work
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

source $ZSH/oh-my-zsh.sh

# User configuration

# Allow [ or ] whereever you want
unsetopt nomatch

export PATH="/usr/local/bin:/Users/giorgio/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/giorgio/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="Users/giorgio/mongodb/bin:$PATH"

# PostgreSql
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Vim

alias vi=vim

# Git
alias gbd="git branch -d \$(git branch | pick)"
alias gbD="git branch -D \$(git branch | pick)"
alias gcb="git checkout \$(git branch | pick)"
alias gfo="git fetch origin"
alias gnb="git checkout -b"
alias grb2="git rebase -i HEAD~2"

# Weather
alias weather="curl wttr.in"

# Shorcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Get updates
alias update='sudo softwareupdate -i -a'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reinstall npm packages for local project
alias coffeebreak="nvm use && rm -Rf node_modules/ && npm install --no-save"

# List 10 biggest files/folder
alias ducks="du -cks * | sort -rn | head"

# Enable http://localtunnel.me/
unalias lt

# Change MAC address
alias freewifi="sudo ifconfig en0 ether `openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`"

# Open Chrome Canary with CORS disabled
alias dev-chrome="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --disable-web-security --user-data-dir &"

# Check which process is running on a port
check-port() {
  lsof -i tcp:$1
}

# Restore vim with C-z
foreground() {
  fg
}

zle -N foreground
bindkey '^Z' foreground

# Run a command n times
# Usage: run 10 command
run() {
  number=$1
  shift
  for i in `seq $number`; do
    echo Execution $i
    $@
  done
}

clean-docker() {
  docker rm $(docker ps -a -q)
  docker rmi $(docker images -q)
  docker volume rm $(docker volume ls |awk '{print $2}')
  rm -rf ~/Library/Containers/com.docker.docker/Data/*
}

# Enable zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_Highlight_highlighters=(main brackets)

# Enable nvm https://github.com/creationix/nvm
export NVM_DIR=~/.nvm
. "$NVM_DIR/nvm.sh"

# automatically read .nvmrc files
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# added by travis gem
[ -f /Users/giorgio/.travis/travis.sh ] && source /Users/giorgio/.travis/travis.sh

# Enable cargo
source $HOME/.cargo/env
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
