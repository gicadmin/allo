CREATE OR REPLACE PACKAGE phenix.RAP_VOLUME_CLIENT_PACK IS

PROCEDURE GENERATE_RAP_VOLUME_DATA_PROC(
	p_de_la_date IN DATE,
	p_a_la_date  IN DATE,
	p_de_client  IN NUMBER,
	p_a_client   IN NUMBER,
	p_de_grille  IN NUMBER,
	p_a_grille   IN NUMBER
);

END RAP_VOLUME_CLIENT_PACK;
/