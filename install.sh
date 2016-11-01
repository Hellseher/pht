#!/usr/bin/env bash
# File          :  install.sh
# Created       :  Fri 16 Oct 2015 14:50:01
# Last Modified :  Mon Jun 06 2016 00:35:10 sharlatan
# Maintainer    :  sharlatan, <sharlatanus@gmail.com>
# License       :  Same as Bash (GPL)
# Credits       :  See EOF
#
# Installation of ttb package.
#
#  ##############
#    #    #   #
#    #    #   ####
#    #    #   #  #
#    #    #   ####

# TODO (sharlata) :  show all var and func (use grep *() { for func)
#                 :  rename all lib var to __<var_name> format

# ------------------------------------------------------------------------------
# GLOBAL VAR
#

__abs_path="$(dirname $(readlink -f $0))"

LOCAL_BIN="$HOME/.local/bin"
TTB_BIN_PATH="$__abs_path/bin/"

# ------------------------------------------------------------------------------
# FUNCTIONS
#

function help_info() {
     cat << EOF
     usage: $0 [OPTION]
     -h, --help     Show this message
EOF
 }


function makedir_local_bin() {
    #
    # Recursively create ~/.local/bin path
    #
     if [[ ! -d "${LOCAL_BIN}" ]]; then
         mkdir -p ${LOCAL_BIN}
     fi
 }

function  export_path() {
    #
    # Export $HOME/.local/bin to $PATH if not already there.
    #
     if [[ -z "$(echo $PATH | grep -Po "${LOCAL_BIN}")" ]]; then
         echo Add ${LOCAL_BIN} to your $PATH
         export PATH=$PATH:${LOCAL_BIN}
     else
         echo Already there.
     fi
 }

function ln_make() {
     #
     # Force create symliks to $HOME./local/bin/
     #
     for bin in $(ls ${TTB_BIN_PATH}); do
         ln -sf $bin ${LOCAL_BIN}
     done
 }

 help_info

 makedir_local_bin
 export_path
 ln_make

# Credits :  http://www.cyberciti.biz/faq/bash-loop-over-file/
#         :  https://google.github.io/styleguide/
#         :  https://regex101.com/

# EOF
