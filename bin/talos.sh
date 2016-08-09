#!/usr/bin/env bash
# File          : talos.sh
# Created       : Sun 31 Jul 2016 00:36:23 sharlatan
# Last Modified : Tue 09 Aug 2016 23:56:16 sharlatan
# Author        : sharlatan <sharlatanus@gmail.com>
# Maintainer(s) : sharlatan
# Short         : Besic security check on fresh servers

#-------------------------------------------------------------------------------
# REFERANCE
# http://www.cubicrace.com/2016/03/efficient-logging-mechnism-in-shell.html

#===============================================================================
VERSION=0.0.1
CMDNAME="talos"
ABSPATH="$(dirname $(readlink -f $0))"
#-------------------------------------------------------------------------------

REQUIRE=(sshd rsync nmap nc)
RD=()

# Conditional output formats.
OK="[\e[32m OK \e[39m]   :"
SKIP="[\e[33m SKIP \e[39m]  :"
FAIL="[\e[31m FAIL \e[39m] :"
BLNK="[-><-]   :"
TIMESTAMP="$(date "+%Y%m%d%H%M%S")"
#===============================================================================

SSH_CONF="/etc/ssh/sshd_config"
TALOS_LOG="${ABSPATH}/talos.log"

#-------------------------------------------------------------------------------
# LOGGIN FUNCTIONS SET

_log_entry(){
    local cfn ts msg

    cfg="${FUNCNAME[1]}"
    ts="[ $(date +"%Y-%m-%d W%U %T") ]"
    msg="Begin: $cfg"
    echo "${ts} [ -><- ] ${msg}" >> "${TALOS_LOG}"
}

_log_return(){
    local cfn ts msg

    cfg="${FUNCNAME[1]}"
    ts="[ $(date +"%Y-%m-%d W%U %T") ]"
    msg="End: $cfg"
    echo "${ts} [ -><- ] ${msg}" >> "${TALOS_LOG}"
}

_log_blank(){
    local msg ts

    msg="$1"
    ts="[ $(date +"%Y-%m-%d W%U %T") ]"
    echo "${ts} [ -><- ] -----${msg}" >> "${TALOS_LOG}"

    if [ "${QUIET}" -eq 0 ]; then
        echo "${ts} [ -><- ] -----${msg}"
    fi
}


_log_info(){
    local msg ts

    msg="$1"
    ts="[ $(date +"%Y-%m-%d W%U %T") ]"
    echo -e "$ts [ INFO ]  ${msg}" >> "${TALOS_LOG}"

    if [ "${QUIET}" -eq 0 ]; then
        echo -e "$ts [\e[32m INFO \e[39m]  ${msg}"
    fi
}

_log_warn(){
    local msg ts

    msg="$1"
    ts="[ $(date  +"%Y-%m-%d W%U %T") ]"
    echo -e "${ts} [WARN] ${msg}" >> "${TALOS_LOG}"

    if [ "${QUIET}" -eq 0 ]; then
        echo -e "${ts} [\e[33m WARN \e[39m] ${msg}"
    fi
}

_log_mist(){
    local msg ts

    msg="$1"
    ts="[ $(date  +"%Y-%m-%d W%U %T") ]"
    echo -e "${ts} [ ERROR ] ${msg}" >> $TALOS_LOG

    if [ "${QUIET}" -eq 0 ]; then
       echo -e "${ts} [\e[31m MIST \e[39m] ${msg}"
    fi
}

#-------------------------------------------------------------------------------
_ifnotroot() {
    ##
    # Do not allow run installation if not ROOT.
    ##
    if [[ $EUID -ne 0 ]]; then
        return 0
    else
        return 1
    fi
}

testRequire() {
    #######################################
    # Go throught the array of requirements
    # and add to "required" array if not
    # Globals:
    #     FAIL, OK, RQUIRE
    # Arguments:
    #
    # Return:
    ######################################
    local rd
    _log_entry

    for cmd in "${REQUIRE[@]}"; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            rd=("${rd[@]}" "$cmd")
        fi
    done

    if [[ "${#rd[@]}" -eq 0 ]]; then
        _log_info "All required commands installed - ${REQUIRE[@]}"
       # echo -e "${OK} All requred command installed - ${REQURED[@]}"
        _log_return; return 0
    else
        _log_warn "You need to install ${rd[@]} to proceed."
        #echo -e "${FAIL} You need to install ${rd[@]} first to proceed."
        _log_return; return 1
    fi
}

main(){
    #
    #
    QUIET=0
    _log_header
    _log_blank "----------------------------------------------------------------"
    _log_info "Start ${CMDNAME} v.${VERSION}"
    #echo -e "${BLNK} ${CMDNAME} v.${VERSION}"
    _log_info "Start at $(date)"
   # echo -e "${OK} Start at $(date)"

    if _ifnotroot; then
        _log_mist "Run as root!"
        #echo -e "${FAIL} Run as root!"
        exit 1
    fi

    testRequire
    _log_warn "test massage"

    _log_footer
}

main "$@"
# End of taus.sh
