# /usr/bin/env zsh

# Show the current IP addresses
ip () {
  ifconfig | grep inet | grep broadcast | cut -f 2 -d' '
}

