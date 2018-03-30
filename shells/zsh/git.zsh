# git alias
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias gaca="git add . && git commit --amend"
alias gac="git add . && git commit -m"

# alias git-amend='git commit --amend -C HEAD'
alias git-undo='git reset --soft HEAD~1'
alias git-count='git shortlog -sn'
alias git-undopush="git push -f origin HEAD^:master"
alias cpbr="git rev-parse --abbrev-ref HEAD | pbcopy"

# git root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

function git-submodule-move() {
    #
    # Moves a Git submodule.
    #
    # Authors:
    #   Sorin Ionescu <sorin.ionescu@gmail.com>
    #

    if ! is-true "$(git rev-parse --is-inside-work-tree 2> /dev/null)"; then
    print "$0: not a repository work tree: $PWD" >&2
    return 1
    elif [[ "$PWD" != "$(git-root)" ]]; then
    print "$0: must be run from the root of the work tree" >&2
    return 1
    fi

    local src="$1"
    local dst="$2"
    local url

    url="$(git config --file "$(git-root)/.gitmodules" --get "submodule.${src}.url")"

    if [[ -z "$url" ]]; then
    print "$0: submodule not found: $src" >&2
    return 1
    fi

    mkdir -p "${dst:h}"

    git-submodule-remove "$src"
    git submodule add "$url" "$dst"
    return 0
}

function git-submodule-remove() {
    #
    # Removes a Git submodule.
    #
    # Authors:
    #   Sorin Ionescu <sorin.ionescu@gmail.com>
    #

    if ! "$(git rev-parse --is-inside-work-tree 2> /dev/null)"; then
    print "$0: not a repository work tree: $PWD" >&2
    return 1
    elif [[ "$PWD" != "$(git-root)" ]]; then
    print "$0: must be run from the root of the work tree" >&2
    return 1
    elif ! git config --file .gitmodules --get "submodule.${1}.path" &>/dev/null; then
    print "$0: submodule not found: $1" >&2
    return 1
    fi

    git config --file "$(git-dir)/config" --remove-section "submodule.${1}" &>/dev/null
    git config --file "$(git-root)/.gitmodules" --remove-section "submodule.${1}" &>/dev/null
    git add .gitmodules

    git rm --cached -rf "${1}"
    rm -rf "${1}"
    rm -rf "$(git-dir)/modules/${1}"

    return 0
}

function give-credit() {
    git commit --amend --author $1 <$2> -C HEAD
}

# a simple git rename file function
# git does not track case-sensitive changes to a filename.
function git-rename() {
    git mv $1 "${2}-"
    git mv "${2}-" $2
}

function g() {
    if [[ $# > 0 ]]; then
        # if there are arguments, send them to git
        git $@
    else
        # otherwise, run git status
        git s
    fi
}

function _git-submodule-move() {
    #compdef git-submodule-move
    #autoload

    #
    # Completes git-submodule-move.
    #
    # Authors:
    #   Sorin Ionescu <sorin.ionescu@gmail.com>
    #

    if ! is-true "$(git rev-parse --is-inside-work-tree 2> /dev/null)"; then
    return 1
    fi

    local state expl ret=1
    local -a submodules
    local submodule

    _arguments -C -s -S \
    '1::args:->submodule' \
    '2::args:->directory' && ret=0

    case "$state" in
    (submodule)
        while IFS=$'\n' read submodule; do
        submodules+=("$submodule")
        done < <(
        git config --file "$(git-root)/.gitmodules" --list \
            | grep '.path=' \
            | cut -d= -f2-
        )

        _describe -t submodule 'submodules' submodules && ret=0
    ;;
    (directory)
        _wanted directories expl 'directory' _path_files -/ || _message 'directory'
    ;;
    esac

    return $ret
}

function _git-submodule-remove() {

    #compdef git-submodule-remove
    #autoload

    #
    # Completes git-submodule-remove.
    #
    # Authors:
    #   Sorin Ionescu <sorin.ionescu@gmail.com>
    #

    if ! is-true "$(git rev-parse --is-inside-work-tree 2> /dev/null)"; then
    return 1
    fi

    local -a submodules
    local submodule

    while IFS=$'\n' read submodule; do
    submodules+=("$submodule")
    done < <(
    git config --file "$(git-root)/.gitmodules" --list \
        | grep '.path=' \
        | cut -d= -f2-
    )

    _describe -t submodule 'submodules' submodules && return 0

}
