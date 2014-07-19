export PATH=/Applications/androidsdk/platform-tools:$PATH
export PATH=/Users/chris/Qt/5.1.0/clang_64/bin:$PATH

#Load aliases
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

#Use the powerline
if [ -d "$HOME/Library/Python/2.7/bin" ]; then
    PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi

#Add option to avoid history
export HISTCONTROL=ignorespace
export HISTCONTROL=ignoredups
shopt -s histverify

#Add colors to terminal
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagaced
#export PS1='\[\033[0;32m\]\h:\[\033[0;35\]\w \[\033[1;33\]\u\$ \[\033[00m\]'
PS1='\[\033[00;34m\]\h:\[\033[00;32m\]\w \[\033[00;34m\]\u\[\033[00;33m\]\$ \[\033[00m\]'

function arduinoupload() {
#extract file from path
filename=$(basename "$1")
#copy the file over
scp "$1" pi@192.168.2.16:/home/pi/sw/$filename
#ssh into remote and pass following commands to remote terminal
ssh pi@192.168.2.16 <<END
cd sw
avrdude -b 57600 -p m328p -c arduino -P /dev/ttyUSB0 -U flash:w:$filename -v
END
}

function beep() {
echo -en "\007"
}

export PATH=$PATH:/Applications/microchip/xc8/v1.31/bin
export PATH=/usr/local/bin:$PATH

#Include settings from .bashrc
source ~/.bashrc
