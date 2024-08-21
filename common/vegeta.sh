#!/bin/bash

. ./common/print.sh

vegeta_attack() {
    print_yellow "VEGETA, start atacking..."
    vegeta attack -targets=target.txt -duration=$1 -rate=$2 | vegeta report -type=text -output=$3
}