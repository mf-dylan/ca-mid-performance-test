#!/bin/bash

. ./common/print.sh

get_current_time() {
    echo $(date +%s)
}

get_duration() {
    local start_time=$1
    local end_time=$2
    echo $((end_time - start_time))
}