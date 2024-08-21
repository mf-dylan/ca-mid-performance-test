#!/bin/bash

. ./common/env.sh
. ./common/print.sh
. ./common/cd.sh
. ./common/utils.sh
. ./common/time.sh
. ./common/vegeta.sh

# LOAD ENV
load_env

# print separator
print_separator

# FILE
TARGET_TEMPLATE_FILE="target_template.txt"
TARGET_FILE="target.txt"
BODY_JSON_FILE="body.json"
INFO_FILE="info.txt"

# PATH
EXEC_PATH="./pj/gq_GetProjectDetails_with_filters/"
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

# create target.txt
create_target_txt "$COOKIE" "$TARGET_TEMPLATE_FILE" "$FULL_PATH_TARGET_FILE"

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
echo "Start Time: $start_time" > $FULL_PATH_INFO_FILE
echo "End Time: $end_time" >> $FULL_PATH_INFO_FILE
echo "Elapsed Time: $elapsed_time seconds" >> $FULL_PATH_INFO_FILE
echo ""

# write info.txt
datadog_start_time=$((start_time*1000-60*1000))
datadog_end_time=$((end_time*1000+60*1000))
echo "Datadog Link: https://app.datadoghq.com/apm/resource/ca-mid-web/rack.request/3a1ddcc7b9538e9f?query=env%3Astg%20operation_name%3Arack.request%20resource_name%3AAccountingReportController%23proxy%20service%3Aca-mid-web&env=stg&fromUser=true&graphType=flamegraph&resourceMapPrefs=qson%3A%28data%3A%28threshold%3A%210.1%29%2Cversion%3A%210%29&shouldShowLegend=true&sort=time&summary=qson%3A%28data%3A%28visible%3A%21t%2Cerrors%3A%28selected%3Acount%29%2Chits%3A%28selected%3Acount%29%2Clatency%3A%28selected%3Alatency%2Cslot%3A%28agg%3A95%29%2Cdistribution%3A%28isLogScale%3A%21f%29%2CshowTraceOutliers%3A%21t%29%2Csublayer%3A%28slot%3A%28layers%3Aservice%29%2Cselected%3Apercentage%29%2ClagMetrics%3A%28selectedMetric%3A%21s%2CselectedGroupBy%3A%21s%29%29%2Cversion%3A%211%29&traces=qson%3A%28data%3A%28%29%2Cversion%3A%210%29&view=spans&start=$datadog_start_time&end=$datadog_end_time&paused=true" >> $FULL_PATH_INFO_FILE
