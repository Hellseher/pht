#!/usr/bin/env bash
# File          :  install.sh
# Created       :  Fri 16 Oct 2015 14:50:01
# Last Modified : <2016-11-02 Wed 20:52:32 GMT> sharlatan
# Maintainer    :  sharlatan <sharlatanus@gmail.com>


ABS_PATH="$(dirname $(readlink -f $0))"
LOCAL_BIN="$HOME/.local/bin"
TTB_BIN_PATH="$ABS_PATH"/bin/


main() {
    # Recursively create ~/.local/bin path
    if [[ ! -d "${LOCAL_BIN}" ]]; then
        mkdir -p ${LOCAL_BIN}
    fi

    # Add to PATH
    if [[ -z "$(echo $PATH | grep -Po "$LOCAL_BIN")" ]]; then
        echo "Add $LOCAL_BIN to your $PATH"
        export PATH=$PATH:$LOCAL_BIN
    else
        echo Already there.
    fi

    # Symlincs to bin files
    for bin in $(find "$TTB_BIN_PATH" -type f); do
        ln -sf "$bin" "$LOCAL_BIN"
    done
 }

main "$@"
# End of install.sh
