#!/bin/bash

write_info_base() {
    local output_file=$1
    local start_time=$2
    local end_time=$3
    local elapsed_time=$4

    echo "Start Time: $start_time" > $output_file
    echo "Start Time(UTC): $(date -r $start_time)" >> $output_file
    echo "" >> $output_file
    echo "End Time: $end_time" >> $output_file
    echo "End Time(UTC): $(date -r $end_time)" >> $output_file
    echo "" >> $output_file
    echo "Elapsed Time: $elapsed_time seconds" >> $output_file
    echo "" >> $output_file
}

write_info_ddog() {
    local output_file=$1
    local start_time=$2
    local end_time=$3
    local ddog_start_time=$((start_time*1000-1*60*1000))
    local ddog_end_time=$((end_time*1000+3*60*1000))

    printf "%s" \
           "Datadog Link: https://app.datadoghq.com/apm/resource/ca-mid-web/rack.request/3a1ddcc7b9538e9f" \
           "?query=env%3Astg%20operation_name%3Arack.request%20resource_name%3AAccountingReportController%23proxy%20service%3Aca-mid-web&env=stg&fromUser=true&graphType=flamegraph&resourceMapPrefs=qson%3A%28data%3A%28threshold%3A%210.1%29%2Cversion%3A%210%29&shouldShowLegend=true&sort=time&summary=qson%3A%28data%3A%28visible%3A%21t%2Cerrors%3A%28selected%3Acount%29%2Chits%3A%28selected%3Acount%29%2Clatency%3A%28selected%3Alatency%2Cslot%3A%28agg%3A95%29%2Cdistribution%3A%28isLogScale%3A%21f%29%2CshowTraceOutliers%3A%21t%29%2Csublayer%3A%28slot%3A%28layers%3Aservice%29%2Cselected%3Apercentage%29%2ClagMetrics%3A%28selectedMetric%3A%21s%2CselectedGroupBy%3A%21s%29%29%2Cversion%3A%211%29&traces=qson%3A%28data%3A%28%29%2Cversion%3A%210%29&view=spans" \
           "&start=$ddog_start_time" \
           "&end=$ddog_end_time" \
           "&paused=true" >> $output_file
}