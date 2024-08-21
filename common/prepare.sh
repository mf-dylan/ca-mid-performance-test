#!/bin/bash

. ./common/file.sh
. ./common/print.sh

prepare_ac_rpt_gq_target_txt() {
    local template_file="./_template/tpl_ac_rpt_gq.txt"
    print_green "COOKIE: $1"
    sed -e "s/{{COOKIE}}/$1/g" \
        "$template_file" > "$2"
}

prepare_ac_rpt_export_pj_csv_target_txt() {
    local template_file="./_template/tpl_ac_rpt_export_pj_csv.txt"
    print_green "COOKIE: $1"
    sed -e "s/{{COOKIE}}/$1/g" \
        "$template_file" > "$2"
}