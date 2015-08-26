#! /bin/sh
# File          :  usage.sh
# Created       :  Wed 26 Aug 2015 22:42:43
# Last Modified :  Wed 26 Aug 2015 22:46:26
# Maintainer    :  sharlatan, <sharlatanus@gmail.com>
# License       :  Same as Bash (GPL)
# Credits:
#
#..:: Description ::..
# Template of "usage" menue for *.sh scripts
# 
usage() {
    echo "Usage: `basename $0` <course>"
    echo "       `basename $0` [options]"
    echo "    --distro               List current Linux distro"
    echo "    --install              Install missing packages for the course"
    echo "    --list                 List all supported courses"
    echo "    --no-course-materials  Don't install course materials"
    echo "    --no-install           Don't check installed packages"
    echo "    --no-recommends        Don't install recommended packages"
    echo "    --update               Update to latest version of this script"
    echo "    --verify               Verify script MD5sum"
    echo "    --version              List script version"
    echo "    --verbose              Turn on extra messages"
    echo
    echo "Example: `basename $0` --install LFD411"
    exit 0
}


# Command option parsing
OPTS="$*"
while [[ $# -gt 0 ]] ; do
    case "$1" in
        --debug) DEBUG=y ;;
        --distro) LIST_DISTRO=y ;;
        --detect-vm) DETECT_VM=y ;;
        -i|--install) INSTALL=y ;;
        --force-update) FORCEUPDATE=y ;;
        --gather-info) gather_info ;;
        --json) JSON=y ;;
        -l|--list) LIST_COURSES=y; break ;;
        -L|--list-requirements) LIST_REQS=y ;;
        -C|--no-course-materials) NOCM=y ;;
        -I|--no-install) NOINSTALL=y ;;
        -R|--no-recommends) NORECOMMENDS=y ;;
        -D|--override-distro) DISTRO=$2; shift;;
        --progress) PROGRESS=y ;;
        --simulate-failure) SIMULATE_FAILURE=y ;;
        --try-all-courses) TRY_ALL_COURSES=y ;;
        --update-beta) UPDATE=beta; VERBOSE=y ;;
        --update) UPDATE=y; VERBOSE=y ;;
        --verify) VERIFY=y ;;
        -v|--verbose) VERBOSE=y ;;
        -V|--version) echo $VERSION; exit 0;;
        LFD*|LFS*) COURSE="$COURSE $1";;
        [0-9][0-9][0-9]) COURSE="$COURSE LFD$1";;
        -h*|--help*|*) usage ;;
    esac
    shift
done
CMD=$0
