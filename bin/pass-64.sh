#!/usr/bin/env bash
# File     : pass-63.sh
# Created  : <2017-10-28 Sat 12:17:33 BST>
# Modified : <2017-10-28 Sat 13:35:19 BST> Sharlatan
# Author   : Sharlatan <sharlatanus@gmail.com>

RND_STR_LN=64

_rnd_lsof()
{
    lsof | wc -l
}

_rnd_date()
{
    date +%N
}

rnd_str()
{
    local flt1="$1"
    local flt2="$2"

    strings /dev/urandom \
        | head -n"$flt1" \
        | head -n"$flt2" \
        | sed -n 's/.*\([a-zA-Z0-9]\).*/\1/p' \
        | sed ':a;N;$!ba;s/\n//g'
}

main()
{
    [ -z "$1" ] || RND_STR_LN="$1"

    flt1="$(_rnd_lsof)"
    flt2="$(_rnd_date)"

    if [[ "$(echo $RND_STR_LN | wc -l)" -gt "$(echo "$flt2" | wc -l)" ]]; then
        printf "Choose shorter length for pass then %s. Exit\n" "$ln"
        exit 1
    fi
    string="$(rnd_str "$flt1" "$flt2")"

    echo "${string[@]::$RND_STR_LN}"
}

main "$@"
# End of pass-64.sh
