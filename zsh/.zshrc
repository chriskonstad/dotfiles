# Load custom prompt and theme
source ~/.zsh/theme.zsh

# Load custom functions
source ~/.zsh/functions.zsh

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
PATH_COMPONENTS=(
"/Users/chris/bin"
"/Users/chris/.cargo/bin"
"/Library/TeX/texbin"
"/Users/chris/.rvm/bin"
"/usr/local/Cellar/emacs/24.5/bin"
"/Applications/android-sdk-macosx/ndk-bundle"
"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin"
"/Applications/androidsdk/platform-tools"
"/usr/local/bin"
"/usr/bin"
"/bin"
"/usr/sbin"
"/sbin"
"$PATH"
)
OLD_IFS="$IFS"
export IFS=":"
export PATH="${PATH_COMPONENTS[*]}"
export IFS="$OLD_IFS"

 # Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Setup solarized colors for ls
eval `gdircolors ~/.zsh/dircolors.256dark`
alias ls="gls --color=auto"

# OPAM configuration
. /Users/chris/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Racer configuration
export RUST_SRC_PATH=/Users/chris/Programming/rustc-1.8.0/src

# rbenv configuration
eval "$(rbenv init -)"

# Enable emacs bindings
bindkey -e

# Use zplug to manage zsh plugins
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/heroku", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/tmux", from:oh-my-zsh
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
