CREATE INDEX phenix.ust_use_start_end_date_i ON phenix.user_session_transactions(ust_use_code,ust_start_date,ust_end_date);