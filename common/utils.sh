#!/bin/bash

. ./common/file.sh

create_target_txt() {
    validate_file_exist $2
    print_green "COOKIE: $1"
    sed -e "s/{{COOKIE}}/$1/g" \
        "$2" > "$3"
}