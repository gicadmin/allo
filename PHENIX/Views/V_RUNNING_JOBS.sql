CREATE OR REPLACE FORCE VIEW phenix.v_running_jobs (pro_command,what,this_date,this_sec,jsc_use_code,jsc_id) AS
select d.PRO_COMMAND, b.WHAT, b.THIS_DATE, b.THIS_SEC, c.JSC_USE_CODE, c.jsc_id
	from  dba_jobs_running a, dba_jobs b, job_schedules c, programs d
	where a.job = b.job
	and a.job = c.JSC_JOB_JOBS
	and c.jsc_pro_id = d.pro_id
 ;