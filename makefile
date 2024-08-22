# run performance test set
pj_rpt_perf_test_set:
	@make pj_gq_FetchProjectReport_without_filters_single
	@make delay
	@make pj_export_csv_without_filters_single
	@make delay
	@make pj_gq_FetchProjectReport_with_filters
	@make delay
	@make pj_export_csv_without_filters	

# pj_rpt_perf_test_set => old site get project details
pj_gq_GetProjectDetails_without_filters:
	@./pj/gq_GetProjectDetails_without_filters/exec.sh

pj_gq_GetProjectDetails_with_filters:
	@./pj/gq_GetProjectDetails_with_filters/exec.sh

# pj_rpt_perf_test_set => new site fetch project report
pj_gq_FetchProjectReport_without_filters:
	@./pj/gq_FetchProjectReport_without_filters/exec.sh

pj_gq_FetchProjectReport_without_filters_single:
	@./pj/gq_FetchProjectReport_without_filters_single/exec.sh

pj_gq_FetchProjectReport_without_filters_high_rate:
	@./pj/gq_FetchProjectReport_without_filters_high_rate/exec.sh

pj_gq_FetchProjectReport_with_filters:
	@./pj/gq_FetchProjectReport_with_filters/exec.sh

# pj_rpt_perf_test_set => export csv
pj_export_csv_without_filters:
	@./pj/export_csv_without_filters/exec.sh

pj_export_csv_without_filters_single:
	@./pj/export_csv_without_filters_single/exec.sh

# utils
delay: 
	@echo "Sleeping for 5 minutes..."
	@sleep 300