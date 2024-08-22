#!/bin/bash

. ./common/print.sh

vegeta_attack() {
    print_yellow "VEGETA, start atacking..."
    print_yellow "VEGETA, duration: $1, rate: $2"
    vegeta attack -targets=target.txt -duration=$1 -rate=$2 | vegeta report -type=text -output=$3
}

vegeta_attack_with_timeout() {
    print_yellow "VEGETA, start atacking..."
    print_yellow "VEGETA, duration: $1, rate: $2, timeout: $3"
    vegeta attack -targets=target.txt -duration=$1 -rate=$2 -timeout=$3 | vegeta report -type=text -output=$4
}