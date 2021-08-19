# quick location for profile
export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.zsh
export SHELLRC=$HOME/.zshrc

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"


# # initialize autocomplete
fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit && compinit -i
unsetopt share_history

# display how long all tasks over 10 seconds take
export REPORTTIME=10

# this sets the color for zsh default and will change to screen-256color if in tmux session
# export TERM=xterm-256color
# [ -z "$TMUX" ] && export TERM=xterm-256color

# getting characters to show up properly
export LANG=en_US.UTF-8


# turn off legacy ctrl-s issue with buffer
stty -ixon

command_exists() {
    type "$1" > /dev/null 2>&1
}
# alias git to hub
if command_exists hub; then
    eval "$(hub alias -s)"
fi

##################################################
# Start loading all other configs
##################################################
[ -f $ZSH/fzf.zsh ] && source $ZSH/fzf.zsh

# source all .zsh files inside of the zsh/ directory
for config ($ZSH/**/*.zsh) source $config
# source all .zsh files for completions
for config ($ZSH/**/*completion.zsh) source $config


### pyenv setup
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

# # Virtualenv
# eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

alias scp="noglob scp"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


## =====setup docker aliases
#############################################################################
#                                                                          #
#               ------- Useful Docker Aliases --------                     #
#                                                                          #
#     # Installation :                                                     #
#     copy/paste these lines into your .bashrc or .zshrc file or just      #
#     type the following in your current shell to try it out:              #
#     wget -O - https://gist.githubusercontent.com/jgrodziski/9ed4a17709baad10dbcd4530b60dfcbb/raw/d84ef1741c59e7ab07fb055a70df1830584c6c18/docker-aliases.sh | bash
#                                                                          #
#     # Usage:                                                             #
#     daws <svc> <cmd> <opts> : aws cli in docker with <svc> <cmd> <opts>  #
#     dc             : docker-compose                                      #
#     dcu            : docker-compose up -d                                #
#     dcd            : docker-compose down                                 #
#     dcr            : docker-compose run                                  #
#     dex <container>: execute a bash shell inside the RUNNING <container> #
#     di <container> : docker inspect <container>                          #
#     dim            : docker images                                       #
#     dip            : IP addresses of all running containers              #
#     dl <container> : docker logs -f <container>                          #
#     dnames         : names of all running containers                     #
#     dps            : docker ps                                           #
#     dpsa           : docker ps -a                                        #
#     drmc           : remove all exited containers                        #
#     drmid          : remove all dangling images                          #
#     drun <image>   : execute a bash shell in NEW container from <image>  #
#     dsr <container>: stop then remove <container>                        #
#                                                                          #
############################################################################

function dnames-fn {
        for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
        do
        docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
        done
}

function dip-fn {
    echo "IP addresses of all named running containers"

    for DOC in `dnames-fn`
    do
        IP=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' "$DOC"`
        OUT+=$DOC'\t'$IP'\n'
    done
    echo -e $OUT | column -t
    unset OUT
}

function dex-fn {
        docker exec -it $1 ${2:-bash}
}

function dex-fn-tbs {
        docker exec -e TMUX=$TMUX -e SHELL=/usr/bin/bash -it $1 ${2:-bash}
}

function di-fn {
        docker inspect $1
}

function dl-fn {
        docker logs -f $1
}

function drun-fn {
        docker run -it $1 $2
}

function dcr-fn {
        docker-compose run $@
}

function dsr-fn {
        docker stop $1;docker rm $1
}

function drmc-fn {
       docker rm $(docker ps --all -q -f status=exited)
}

function drmid-fn {
       imgs=$(docker images -q -f dangling=true)
       [ ! -z "$imgs" ] && docker rmi "$imgs" || echo "no dangling images."
}

# in order to do things like dex $(dlab label) sh
function dlab {
       docker ps --filter="label=$1" --format="{{.ID}}"
}

function dc-fn {
        docker-compose $*
}

function d-aws-cli-fn {
    docker run \
           -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
           -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
           -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
           amazon/aws-cli:latest $1 $2 $3
}

alias daws=d-aws-cli-fn
alias dc=dc-fn
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcr=dcr-fn
alias de=dex-fn
alias dex=dex-fn-tbs
alias di=di-fn
alias dim="docker images"
alias dip=dip-fn
alias dl=dl-fn
alias dnames=dnames-fn
alias dps="docker ps"
alias dpsa="docker ps -a"
alias drmc=drmc-fn
alias drmid=drmid-fn
alias drun=drun-fn
# TODO: not working...
# alias drunlatest=docker run -it $(dim | awk 'NR==2{split($0, a, " "); print a[3]}')
alias dsp="docker system prune --all"
alias dsr=dsr-fn
alias dport='docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" -a'
# =========


# source localrc
[ -e ~/.localrc ] && source ~/.localrc
