#!/bin/bash

. ./common/env.sh
. ./common/print.sh
. ./common/cd.sh
. ./common/time.sh

. ./common/prepare.sh
. ./common/analyze.sh
. ./common/vegeta.sh

# LOAD ENV
load_env

# print separator
print_separator

# FILE
TARGET_FILE="target.txt"
BODY_JSON_FILE="body.json"
INFO_FILE="info.txt"

# PATH
EXEC_PATH="./pj/gq_FetchProjectReport_without_filters/"
FULL_PATH_TARGET_FILE="${EXEC_PATH}${TARGET_FILE}"
FULL_PATH_BODY_JSON_FILE="${EXEC_PATH}${BODY_JSON_FILE}"
FULL_PATH_INFO_FILE="${EXEC_PATH}${INFO_FILE}"

# VEGETA
VEGETA_DURATION="5s"
VEGETA_RATE="1"
VEGETA_REPORT_FILE="report.txt"

# print base info
print "PWD: $(pwd)"
print "DATE: $(date)"

# print separator
print_separator

# check prerequisite
validate_file_exist "$FULL_PATH_BODY_JSON_FILE"

# prepare target.txt
prepare_ac_rpt_gq_target_txt "$COOKIE" "$FULL_PATH_TARGET_FILE"

# print separator
print_separator

# record attact start time
start_time=$(get_current_time)
print "Start Time: $start_time"

# exec vegeta attack
ORIGIN_PATH=$(pwd)
go_to "$EXEC_PATH" 
vegeta_attack "$VEGETA_DURATION" "$VEGETA_RATE" "$VEGETA_REPORT_FILE"
go_to "$ORIGIN_PATH"

# record attact end time
end_time=$(get_current_time)
print "End Time: $end_time"

# calculate elapsed time
elapsed_time=$(get_duration $start_time $end_time)
print "Elapsed Time: ${elapsed_time} seconds"

# write info.txt
write_info_base "$FULL_PATH_INFO_FILE" "$start_time" "$end_time" "$elapsed_time"
write_info_ddog "$FULL_PATH_INFO_FILE" "$start_time" "$end_time"
