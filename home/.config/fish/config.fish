export PATH="$HOME/.poetry/bin:$PATH"
#set PATH /usr/local/bin $PATH
set -U fish_user_paths ~/bin /opt/bin

alias conda_init="/opt/anaconda/condabin/conda "shell.fish" "hook" $argv | source"
alias vim="nvim"
