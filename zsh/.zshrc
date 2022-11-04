export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"

plugins=(git)
source $ZSH/oh-my-zsh.sh

# ---------------- ALIAS ---------------- #

alias vim='nvim'
alias l='ls -lrt'
alias la='ls -lart'
alias home='cd ~/home'
alias dev='cd ~/home/dev'
alias c='clear'
alias s='cd ~/home/dev/scratchpad'
alias h='cd ~/home'
alias py='cd ~/home/dev/scratchpad/lang/python'
alias z='vim ~/.zshrc'

# ---------------- ZSHRC ---------------- #

alias zs='source ~/.zshrc'

# ---------------- PATH ---------------- #

export PATH=/opt/homebrew/bin:$HOME/bin:/usr/local/bin:$PATH

# ---------------- ASDF ---------------- #

. $(brew --prefix asdf)/libexec/asdf.sh

# ---------------- PIP ---------------- #

# Note: The top of the hierarchy isn't necessarily what you've `pip installed`. You install dependencies in a flat structure; this shows how they depend on each other.
alias tree='pipdeptree --graph-output png | open -a Preview.app -f'

# ---------------- NVIM ---------------- #

export XDG_CONFIG_HOME=~/.config

# ---------------- GIT ---------------- #

alias gs="git status"
alias gc="git commit -m "
alias gpu="git push -u origin "
alias gpl="git pull origin "

# ---------------- VENV ---------------- #

export VIRTUAL_ENV_DISABLE_PROMPT=
alias cv="python3 -m venv .venv"
alias av=". .venv/bin/activate"
alias dv="deactivate"
alias rv="rm -rf .venv"

function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]] ; then
    ## If env folder is found then activate the vitualenv
      if [[ -d ./.venv ]] ; then
        source ./.venv/bin/activate
      fi
  else
    ## check the current folder belong to earlier VIRTUAL_ENV folder
    # if yes then do nothing
    # else deactivate
      parentdir="$(dirname "$VIRTUAL_ENV")"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        deactivate
      fi
  fi
}


