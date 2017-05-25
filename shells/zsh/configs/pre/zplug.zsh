#!/bin/sh
#
# # Check if zplug is installed
# if [[ ! -d ~/.zplug ]]; then
#     git clone https://github.com/zplug/zplug ~/.zplug
#     source ~/.zplug/init.zsh && zplug update --self
# fi
#
# # only source zplug on initial load
# # if [ -z ${RELOAD} ]; then
# #   # Clone zgen if not found
# #   if [[ ! -d ~/.zplug ]];then
# #     git clone https://github.com/b4b4r07/zplug.git ~/.zplug
# #     source ~/.zplug/init.zsh
# #     zplug update --self
# #   fi
# #
# #   source ~/.zplug/init.zsh
#
# zplug 'mafredri/zsh-async', from:github
# # zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme
#
# # Install plugins if there are plugins that have not been installed
# if ! zplug check; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi
#
# zplug load
# # fi
#
#
# # .zshrc
# autoload -U promptinit; promptinit
# prompt pure
