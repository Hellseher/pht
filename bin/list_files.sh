#!/usr/bin/env bash
# File          : list_files.sh
# Created       : Tue 06 Sep 2016 22:53:51
# Last Modified : Thu 08 Sep 2016 08:06:17 sharlatan
# Short         : List files+symlink in shell with no external programms

SEARCH_PATH="$1"
IF_LIST=()
IGNORE=(lo virbr0 -nic)

if [[ -d "$SEARCH_PATH" ]]; then

    for file_link in "$SEARCH_PATH"/*; do

        # Add to list only file and symlinks with substituded path.
        if [[ -f "$file_link" ]] || [[ -h "$file_link" ]]; then
            IF_LIST+=("${file_link#*"$SEARCH_PATH"/}")
        fi
    done

else
    echo "$SEARCH_PATH" does not exists or is not a directory
fi

# Remove ignored entrances
for del in "${IGNORE[@]}"; do
    IF_LIST=("${IF_LIST[@]/"$del"}")
done

echo "${IF_LIST[1]}"
# End of list_files.sh
