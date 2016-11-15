CREATE OR REPLACE FORCE VIEW phenix.v_jobs (jsc_initial,jsc_job_jobs,jsc_use_code,jsc_active,int_description,jsc_id,jsc_pro_id,"JOB",log_user,priv_user,schema_user,last_date,last_sec,this_date,this_sec,next_date,next_sec,total_time,broken,"INTERVAL",failures,what) AS
SELECT JSC_INITIAL,JSC_JOB_JOBS,JSC_USE_CODE,JSC_ACTIVE,int_description,
	     	 JSC_ID,JSC_PRO_ID,
				 JOB, lowner LOG_USER, powner PRIV_USER, cowner SCHEMA_USER,
				 LAST_DATE, substr(to_char(last_date,'HH24:MI:SS'),1,8) LAST_SEC,
				 THIS_DATE, substr(to_char(this_date,'HH24:MI:SS'),1,8) THIS_SEC,
				 NEXT_DATE, substr(to_char(next_date,'HH24:MI:SS'),1,8) NEXT_SEC,
				 (total+(sysdate-nvl(this_date,sysdate)))*86400 TOTAL_TIME,
				 decode(mod(FLAG,2),1,'Y',0,'N','?') BROKEN,
				 INTERVAL# interval, FAILURES, WHAT
	from sys.job$ j, JOB_SCHEDULES, interval_type
	WHERE JSC_JOB_JOBS = JOB
	and int_id = jsc_int_id;