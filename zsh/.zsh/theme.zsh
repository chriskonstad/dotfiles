# Custom prompt
# Colors from https://github.com/Tarrasch/zsh-colors

hostcolor='cyan'
if [ `hostname` != 'mbp.local' ]; then
  hostcolor='magenta'
fi
ZSH_USER="%F{cyan}[%n@%F{$hostcolor}%m]%F{reset}"
ZSH_DIR="%F{yellow}[%1~% ]%F{reset}"
ZSH_PROMPT_END="%F{white}$ %F{reset}"

PROMPT="$ZSH_USER$ZSH_DIR$ZSH_PROMPT_END"
