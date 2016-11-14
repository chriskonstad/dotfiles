# Load custom prompt and theme
source ~/.zsh/theme.zsh

# Load custom functions
source ~/.zsh/functions.zsh

# Custom PATH
export PATH="/Users/chris/.cargo/bin:/usr/local/Cellar/emacs/24.5/bin:/Applications/android-sdk-macosx/ndk-bundle:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:/Users/chris/bin:/Users/chris/Qt5.3/5.3/clang_64/bin:/usr/local/bin:/Users/chris/Qt/5.1.0/clang_64/bin:/Applications/androidsdk/platform-tools:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Applications/microchip/xc8/v1.31/bin:/Applications/microchip/xc8/v1.31/bin:/Users/chris/.rvm/bin:/Users/chris/.rvm/bin:/Users/chris/checker-277:/Users/chris/anaconda/bin"

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
zplug "zsh-users/zsh-syntax-highlighting", nice:10

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load
