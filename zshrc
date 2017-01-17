#
# ZShell
#

ZSH="$HOME/.oh-my-zsh"
ZSH_THEME='robbyrussell'

plugins=(git)

export PATH="/usr/local/bin:$PATH"

source "$ZSH/oh-my-zsh.sh"

# Fuzzy auto-completion
zstyle ':completion:*' matcher-list \
  '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'

#
# Rust
#

## Add rust packages
export PATH="$HOME/.cargo/bin:$PATH"

# Racer setup
export RUST_SRC_PATH="$HOME/Projects/other/rustc-1.6.0/src/"

#
# JavaScript
#

# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# React packager settings
export REACT_EDITOR='atom'

#
# Ruby
#

# rbenv setup
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# travis gem setup
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

#
# Other
#

# Aliases
alias git=hub
alias lynx="lynx -cfg=$HOME/.lynxrc"
alias vi="mvim -v"
alias vim=vi

# Heroku Toolbelt setup
export PATH="/usr/local/heroku/bin:$PATH"

# Use brew binaries before system binaries
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# thefuck setup
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

# Android SDK (installed via homebrew)
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools

# Add depot_tools binaries
export PATH="$HOME/Projects/depot_tools:$PATH"

# Command shortcuts
alias .is="cd ~/Projects/isair"
alias .mll="cd ~/Projects/movielala"
alias .ot="cd ~/Projects/other"

alias .gs="git status"
alias .ga="git add"
alias .gap="git add --patch"
alias .gf="git fetch"
alias .gb="git branch"
alias .gba="git branch -a"
alias .gch="git checkout"
alias .grb="git rebase"
alias .grbi="git rebase -i"
alias .gcm="git commit"
alias .gps="git push"
alias .gl="git log"
alias .glp="git log --pretty=\"oneline\""
alias .gpl="git pull"
alias .gplr="git pull --rebase"
alias .gd="git diff"
alias .gdc="git diff --cached"

alias .bin="bundle install --path=vendor/bundle"
alias .bup="bundle update"
alias .bx="bundle exec"

alias .pin="pod install"
alias .pup="pod update"
