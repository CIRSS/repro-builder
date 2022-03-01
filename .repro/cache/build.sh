#!/bin/bash

contents_filename=contents.txt

if [[ ! -f ${contents_filename} ]] ; then
    wget --quiet ${REPRO_BUILDER_RELEASE_URL}/${contents_filename}
fi

readarray lines < ${contents_filename}

for full_line in "${lines[@]}"
do
    trimmed_line=${full_line%%#*}
    read -ra tokens <<< ${trimmed_line}
    artifact_name=${tokens[0]}
    if [[ ! -f ${artifact_name} ]] ; then
        wget -nv -O ${artifact_name} ${REPRO_BUILDER_RELEASE_URL}/${artifact_name}
    fi
done

for filename in [0-9]*; do
    echo -e "\nSTARTING  ${filename}\n"
    source $filename
    echo -e "\nFINISHED ${filename}\n"
done
