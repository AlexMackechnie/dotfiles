# ---------------- ZSH ---------------- #

export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"

plugins=(git)
source $ZSH/oh-my-zsh.sh

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%} "

# ---------------- ALIAS ---------------- #

alias vim='nvim'
alias l='ls -lrt'
alias la='ls -lart'
alias home='cd ~/home'
alias dev='cd ~/home/dev'
alias p='cd ~/home/personal'
alias c='clear'
alias s='cd ~/home/dev/scratchpad'
alias h='cd ~/home'
alias py='cd ~/home/dev/scratchpad/lang/python'
alias z='vim ~/.zshrc'
alias cr='cd $(git rev-parse --show-toplevel)'
alias who='aws sts get-caller-identity --no-cli-pager'
alias t='cd ~/home/tmp'
alias e='exit'

# ---------------- ZSHRC ---------------- #

alias zs='source ~/.zshrc'

# ---------------- PATH ---------------- #

export PATH=/opt/homebrew/bin:$HOME/bin:/usr/local/bin:$PATH:$HOME/home/bin

# ---------------- ASDF ---------------- #

. $(brew --prefix asdf)/libexec/asdf.sh

# ---------------- PIP ---------------- #

# Note: The top of the hierarchy isn't necessarily what you've `pip installed`. You install dependencies in a flat structure; this shows how they depend on each other.
alias piptree='pipdeptree --graph-output png | open -a Preview.app -f'

# ---------------- JAVA ---------------- #

alias gw='./gradlew'

# ---------------- NVIM ---------------- #

export XDG_CONFIG_HOME=~/.config

# ---------------- GIT ---------------- #

alias gs="git status"
alias gc="git commit -m "
alias gpu="git push -u origin "
alias gpl="git pull origin "

# ---------------- VENV ---------------- #

export VIRTUAL_ENV_DISABLE_PROMPT=
alias cv="python3 -m venv venv"
alias av=". venv/bin/activate"
alias dv="deactivate"
alias rv="rm -rf venv"

function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]] ; then
    ## If env folder is found then activate the vitualenv
      if [[ -d ./venv ]] ; then
        source ./venv/bin/activate
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

# ---------------- ASDF ---------------- #

asdf_update_java_home() {
  local java_path
  java_path="$(asdf which java)"
  if [[ -n "${java_path}" ]]; then
    export JAVA_HOME
    JAVA_HOME="$(dirname "$(dirname "${java_path:A}")")"
    export JDK_HOME=${JAVA_HOME}
  fi
}
asdf_update_java_home

asdf_shell_java() {
  asdf shell java $1 
  asdf_update_java_home
}

# ---------------- DNS ---------------- #

export ROOT_NS_IPS=("198.41.0.4" "199.9.14.201" "192.33.4.12")
export ROOT_NS_NAMES=("a.root-servers.net" "b.root-servers.net" "c.root-servers.net")

DISABLE_UNTRACKED_FILES_DIRTY="true"
