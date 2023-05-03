if [[ "$PATH" != "/home/wally_road/.cargo/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl" ]]; then
  PATH="/home/wally_road/.cargo/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
fi

export PATH

# sourcing ~/.zsh/source_list to update sources in seperate file. export vartiables sourced here
#source "$HOME/.zsh/source_list"

if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi
## expanding exercism excersize install command to switch user to the working dir for the newly downloaded track
exercism () {
    local out
    readarray -t out < <(command exercism "$@")
    printf '%s\n' "${out[@]}"
    if [[ $1 == "download" && -d "${out[-1]}" ]]; then
        cd "${out[-1]}" || return 1
    fi
}

# setup for fnm. this may be temporary as i will probably setup asdf or rtx when i have more time to atleast have available for projects as a more universal tool and to be able to setup project specific tooling without affecting my daily setup. 
eval "$(fnm env --use-on-cd)"
# setup for rtx
eval "$(rtx activate zsh)"
# startup for starship
eval "$(starship init zsh)"
# startup for z.lua
eval "$(lua $HOME/.config/zlua/z.lua --init zsh)"
# add zfunc dir to fpath for completions
fpath+=$HOME/.zfunc

autoload -Uz compinit && compinit
setopt completealiases
setopt correct

# TODO: probably a better way to do this but it works for now and helps me keep my 
# and gives me another reason to write scripts and try to automate things more and 
# more so future me lets try to look over everything and find optomizations or quality of life 
# features and improvements we can make. soon adding rtx in place of asdf as it was a b it rigid
# luckily rtx is a drop in replacement so everything should still work if not should be easy to 
# change will porably do this tn for atleast the basic and most vital stuff.

# sourcing ~/.zsh/source_list to update sources in seperate file. export vartiables sourced here
source "$HOME/.zsh/source_list"
