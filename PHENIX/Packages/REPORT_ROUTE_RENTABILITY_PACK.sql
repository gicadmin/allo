CREATE OR REPLACE PACKAGE phenix.REPORT_ROUTE_RENTABILITY_PACK IS
PROCEDURE rap_rentability_route_proc (
	p_from_route_code				IN NUMBER,   --FRE3725
  p_to_route_code         IN NUMBER,   --FRE3725
  p_from_route_date				IN DATE,     --FRE3725
  p_to_route_date	  			IN DATE,     --FRE3725
  p_langage_report        IN VARCHAR2  --FRE3725
);
END REPORT_ROUTE_RENTABILITY_PACK;
/