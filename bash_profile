[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$GOROOT/bin:$PATH"

#useful for getting the size of dirs in the current dir
alias ds="sudo du -hs * | sort -rh | head -10"

#make gopls not puke randomly
export GOPACKAGEDRIVER=off

alias ..="cd .."
alias l="ls -aGl"
alias lr="ls -aGlR"
alias editbash="vim ~/.bash_profile"
alias editvim="vim ~/.vimrc"
alias reloadbash="source ~/.bash_profile"
alias gs="git status"
alias ga="git add"
alias gaa="git add -A && git status"
alias gc="git commit"
alias gp="git pull"
alias gd="git diff"

alias tmux="TERM=screen-256color-bce tmux"
alias tn="TERM=screen-256color-bce tmux -CC new -s"
alias tk="TERM=screen-256color-bce tmux kill-session -t" 
alias ta="TERM=screen-256color-bce tmux -CC a"
alias tas="TERM=screen-256color-bce tmux -CC attach-session -t"
alias tls="TERM=screen-256color-bce tmux ls"
alias ft="ag"

# Bash Completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Have default fzf include hidden files
export FZF_DEFAULT_COMMAND='find .'

# ff - cd into the directory of the selected file
ff() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# fd - cd into the directory of the selected dir
fd() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# Open file
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  IFS=$'\n' out=($(fzf --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Make vim our default editor
export EDITOR=vim

# be explicit about java
export JAVA_HOME=$(/usr/libexec/java_home)

# explicitly use gnu tools
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# if we've got the ruby version manager, this is what it recommends
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
