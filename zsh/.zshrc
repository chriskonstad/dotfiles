# Load custom prompt and theme
source ~/.zsh/theme.zsh

# Load custom functions
source ~/.zsh/functions.zsh

command_exists() {
  type "$1" > /dev/null
}

# Configure history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

setopt EXTENDED_HISTORY          # Write the history as the ":start:elapsed;command"
setopt INC_APPEND_HISTORY        # Write to the history file immediately
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

# Custom PATH
PATH_ADD () {
  export PATH="$1:$PATH"
}

PATH_ADD "/sbin"
PATH_ADD "/usr/sbin"
PATH_ADD "/bin"
PATH_ADD "/usr/bin"
PATH_ADD "/usr/local/bin"
PATH_ADD "$HOME/.cargo/bin"
PATH_ADD "$HOME/bin"

if [[ `uname` == 'Darwin' ]]; then
  PATH_ADD "/Library/TeX/texbin"
  PATH_ADD "/Applications/android-sdk-macosx/ndk-bundle"
  PATH_ADD "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin"
  PATH_ADD "/Applications/androidsdk/platform-tools"
fi

# Preferred editor for OSX vs everything else
if [[ `uname` == 'Darwin' ]]; then
  export EDITOR='mvim'
  export VISUAL='mvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi

# Setup solarized colors for ls
solarized_colors() {
  DIRCOLORS="dircolors"
  LS="ls"
  if [[ `uname` == 'Darwin' ]]
  then
    LS="gls"
    DIRCOLORS="gdircolors"
  elif [[ `uname` == 'Linux' ]]
  then
    # Nothing special for linux :)
  fi

  eval $($DIRCOLORS "$HOME/.zsh/dircolors.256dark")
  alias ls="$LS --color=auto"
}
solarized_colors

# OPAM configuration
if command_exists opam; then
  . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
fi

# rbenv configuration
if command_exists rbenv; then
  eval "$(rbenv init -)"
fi

# Enable emacs bindings
bindkey -e

# Use zplug to manage zsh plugins
export ZPLUG_HOME=~/.zsh/zplug
source $ZPLUG_HOME/init.zsh

zplug "plugins/git", from:oh-my-zsh, if:"command_exists git"
zplug "plugins/heroku", from:oh-my-zsh, if:"command_exists heroku"
zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/tmux", from:oh-my-zsh, if:"command_exists tmux"
zplug "Tarrasch/zsh-colors"
zplug "chrissicool/zsh-256color"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:3

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'
