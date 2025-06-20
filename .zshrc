export XDG_CONFIG_HOME="$HOME/.config"
export ZSH="$HOME/.oh-my-zsh"

#integration with brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Settings for nvm oh-my-zsh plugin
NVM_HOMEBREW=$(brew --prefix nvm)

# Settings for pyenv oh-my-zsh plugin
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Settings for goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# oh-my-zsh plugin list
plugins=(git aws direnv fzf kubectl nvm pyenv starship zoxide)

# Env Vars
export PATH="$(brew --prefix rustup)/bin:$PATH"
export DOCS_HOME="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/second-brain"
export EDITOR="nvim"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export OP_PLUGINS_SOURCED="1"
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

## Custom functions
# Run nnn
n () {
  if [ -n $NNNLVL ] && [ "$NNNLVL" -ge 1 ]; then
    echo "nnn is already running"
    return
  fi

  export NNN_TMPFILE="$HOME/.config/nnn/.lastd"

  nnn -adeHo "$@"

  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE" > /dev/null
  fi
}

# Create new quick note in Second Brain
qn() {
  pushd $DOCS_HOME
  fileName=$(date +%Y%m%d%H%M)
  if [[ -n $1 ]]; then
    fileName=$fileName-$1.md
  else
    fileName=$fileName.md
  fi
  nvim $fileName
  popd
}

# Open Second Brain
sb() {
  pushd $DOCS_HOME
  nvim .
  popd
}

b() {
  nvim ~/.config/homebrew/Brewfile
}

bu() {
  b
  yadm bootstrap
}

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

PATH="$HOMEBREW_PREFIX/opt/gawk/libexec/gnubin:$PATH"

# Aliases
alias -- 'cat'='bat'
alias -- 'gh'='op plugin run -- gh'
alias -- 'glab'='op plugin run -- glab'
alias -- 'k'='kubectl'
alias -- 'lg'='lazygit'
alias -- 'll'='n'
alias -- 's'='doppler run --config "nixos" --project "$(whoami)"'
alias -- 'v'='nvim'
alias -- 'chc'='nvim ~/.config'
