#!/bin/bash

. ./common/print.sh

validate_file_exist() {
  if [ ! -f "$1" ]; then
    print_red "FILE: $1 is not existed."
    exit 1
  else 
    print_green "FILE: $1 is existed."
  fi
}