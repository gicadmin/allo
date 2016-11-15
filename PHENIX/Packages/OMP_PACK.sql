CREATE OR REPLACE PACKAGE phenix.OMP_PACK IS

FUNCTION GET_OMP_ID_FUNC RETURN NUMBER;

PROCEDURE DELETE_OMP_ID_FUNC(
	p_omp_id IN NUMBER
);

PROCEDURE DELETE_OMP_FROM_OSM_ID_FUNC(
	p_osm_id IN NUMBER
);

PROCEDURE INSERT_OMP_PROC(	--ber590 création de la procédure
	p_omp_id                    IN outstanding_mission_picklists.omp_id%TYPE,
	p_omp_osm_id              	IN outstanding_mission_picklists.omp_osm_id%TYPE,
	p_omp_plh_id              	IN outstanding_mission_picklists.omp_plh_id%TYPE,
	p_omp_vph_id              	IN outstanding_mission_picklists.omp_vph_id%TYPE
);

FUNCTION EXISTS_FOR_PLH_FUNC(
    p_plh_id            in pick_list_headers.plh_id%TYPE)
RETURN BOOLEAN;

END OMP_PACK;
/