#!/bin/sh

. ./common/file.sh

load_env() {
    validate_file_exist ".env"
    export COOKIE=$(grep '^COOKIE=' .env | sed 's/COOKIE=//')
}