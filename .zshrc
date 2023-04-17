# Created by newuser for 5.9

if [[ "$PATH" != "/home/wally_road/.cargo/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl" ]]; then
  PATH="/home/wally_road/.cargo/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
fi

export PATH

# sourcing aliases
source $HOME/.zsh/aliases

export PATH="$PATH:/.local/bin"

# startup for starship
eval "$(starship init zsh)"




. "$HOME/.cargo/env"
