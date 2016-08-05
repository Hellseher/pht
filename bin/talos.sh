#!/usr/bin/env bash
# File          : talos.sh
# Created       : Sun 31 Jul 2016 00:36:23 sharlatan
# Last Modified : Fri 05 Aug 2016 22:01:17 sharlatan
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

_log_header(){
    timeAndDate=$(date)
    script_name=$(basename "$0")
    echo "$FUNCNAME: $script_name" >> $TALOS_LOG
}

_log_footer(){
    script_name=$(basename "$0")
    echo "$FUNCNAME: $script_name" >> $TALOS_LOG
}

_log_entry(){
    local cfn tstamp msg

    cfg="${FUNCNAME[1]}"
    tstamp=$(date +"%Y-%m-%d W%U %T")
    msg="< $cfg $FUNCNAME"
    echo -e "[$tstamp] [DEBUG]\t$msg" >> $TALOS_LOG
}

_log_return(){
    local cfn tstamp msg

    cfg="${FUNCNAME[1]}"
    tstamp="$(date +"%Y-%m-%d W%U %T")"
    msg="> $cfg $FUNCNAME"
    echo -e "[$tstamp] [DEBUG]\t$msg" >> $TALOS_LOG
}

_log_info(){
    local msg tstamp

    msg="$1"
    tstamp="$(date +"%Y-%m-%d W%U %T")"
    echo -e "[$tstamp] [ INFO ]  $msg" >> $TALOS_LOG
    echo -e "[$tstamp] [\e[32m INFO \e[39m]  $msg"

}

_log_degub(){
    local msg tstamp

    msg="$1"
    tstamp="$(date  +"%Y-%m-%d W%U %T")"
    echo -e "[$tstamp] [DEBUG]\t$msg" >> $TALOS_LOG
}

_log_error(){
    local msg tstamp

    msg="$1"
    tstamp="$(date  +"%Y-%m-%d W%U %T")"
    echo -e "[$tstamp] [ ERROR ] $msg" >> $TALOS_LOG
    echo -e "[$tstamp] [\e[31m ERROR \e[39m] $msg"
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

    for cmd in "${REQUIRE[@]}"; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            rd=("${rd[@]}" "$cmd")
        fi
    done

    if [[ "${#rd[@]}" -eq 0 ]]; then
        _log_info "All required commands installed - ${REQUIRE[@]}"
       # echo -e "${OK} All requred command installed - ${REQURED[@]}"
        exit 0
    else
        _log_error "You need to install ${rd[@]} to proceed."
        #echo -e "${FAIL} You need to install ${rd[@]} first to proceed."
        exit 1
    fi
}

main(){
    #
    #
    _log_header
    _log_info "Start ${CMDNAME} v.${VERSION}"
    #echo -e "${BLNK} ${CMDNAME} v.${VERSION}"
    _log_info "Start at $(date)"
   # echo -e "${OK} Start at $(date)"

    if _ifnotroot; then
        _log_error "Run as root!"
        #echo -e "${FAIL} Run as root!"
        exit 1
    fi

    testRequire

    _log_footer
}

main "$@"
# End of taus.sh
