#!/bin/bash

. ./common/print.sh

go_to() {
    cd "$1"
    print_cyan "GOTO: $(pwd)"
}