CREATE INDEX phenix.osm_trunc_date_prf_status_i ON phenix.outstanding_missions(TRUNC("OSM_ROUTE_DATE"),osm_prf_prd_code,osm_prf_fmt_code,osm_status);