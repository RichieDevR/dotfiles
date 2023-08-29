if [[ "$PATH" != "$HOME/.cargo/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl" ]]; then
  PATH="$HOME/.cargo/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
fi

export PATH

# sourcing ~/.zsh/source_list to update sources in seperate file. export variables sourced here
#source "$HOME/.zsh/source_list"

if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi

exercism () {
    local out=()
    while IFS= read -r line; do
        out+=("$line")
    done < <(command exercism "$@")
    printf '%s\n' "${out[@]}"
    if [[ \$1 == "download" && -d "${out[-1]}" ]]; then
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


# sourcing ~/.zsh/source_list to update sources in seperate file. exported variables sourced here in sepertae file
#as well
source "$HOME/.zsh/source_list.zsh"

## use degit to install modules
zstyle ':zim:zmodule' use 'degit'

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh


# pnpm
export PNPM_HOME="/home/wally_road/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end