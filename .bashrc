### FAVORITES
alias notes="vim ~/Dropbox/notes.md"


### ENV

export EDITOR="/usr/bin/vim"
if [[ -f "${HOME}/.ssh/id_rsa.pub" ]]; then
  export SSH_FINGERPRINT="$((awk '{print $2}' ~/.ssh/id_rsa.pub \
    | base64 --decode | md5 | sed 's/../&:/g; s/:*$//') 2>/dev/null)"
fi
. "$HOME/.tkns"


### ALIAS

# ll
alias ll="ls -lhA"
# color directories
alias ls="ls -G"
# cfg-init.sh (dotfiles)
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# git branch bash
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[$(tput bold)\]\[$(tput setaf 5)\]\[$(tput setaf 6)\]\w\[$(tput setaf 3)\]\$(parse_git_branch) \[$(tput sgr0)\]"
# include hidden files when globbing
shopt -s dotglob

### SCRIPTS

# Ctrl+s (opposite of Ctrl+r)
stty -ixon
# cd --
. ~/.bash-scripts/acd_func.sh
# save brew packages to dotfiles
if [ -f "/usr/local/bin/brew" ]; then
  (brew ls > "$HOME/.brew_formulas" &)
fi
# clean downloads directory
alias cleand="mv $HOME/Downloads/{*.zip,*.dmg} $HOME/.Trash > /dev/null 2>&1"


### ETC
# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
# NVM
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"
# GO
export GOPATH="$HOME/dev/go"


### PATH
export PATH="$GOPATH/bin:$PATH"
