if [[ "$PATH" != "/home/wally_road/.cargo/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl" ]]; then
  PATH="/home/wally_road/.cargo/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
fi

export PATH

if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi



# sourcing ~/.zsh/source_list to update sources in seperate file. export vartiables sourced here
source "$HOME/.zsh/source_list"
# startup for starship
eval "$(starship init zsh)"
# startup for z.lua
eval "$(lua $HOME/.config/zlua/z.lua --init zsh)"
# add zfunc dir to fpath for completions
fpath+=$HOME/.zfunc

autoload -Uz compinit && compinit
setopt completealiases
setopt correct
