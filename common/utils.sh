#!/bin/bash

. ./common/file.sh

TEMPLATE_FILE="../target_template.txt"
OUTPUT_FILE="target.txt"

create_target_txt() {
    validate_file_exist "$TEMPLATE_FILE"
    print_green "COOKIE: $1"
    sed -e "s/{{COOKIE}}/$1/g" \
        "$TEMPLATE_FILE" > "$OUTPUT_FILE"
}