CREATE OR REPLACE PACKAGE phenix.TRD_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_route_dates%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_trd_route_date                 IN         temporary_route_dates.trd_route_date%TYPE,
  p_trd_rou_code                   IN         temporary_route_dates.trd_rou_code%TYPE,
  p_trd_cus_code                   IN         temporary_route_dates.trd_cus_code%TYPE,
  p_trd_rec                        OUT NOCOPY temporary_route_dates%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_trd_route_date                 IN         temporary_route_dates.trd_route_date%TYPE,
  p_trd_rou_code                   IN         temporary_route_dates.trd_rou_code%TYPE,
  p_trd_cus_code                   IN         temporary_route_dates.trd_cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_trd_route_date                 IN         temporary_route_dates.trd_route_date%TYPE,
  p_trd_rou_code                   IN         temporary_route_dates.trd_rou_code%TYPE,
  p_trd_cus_code                   IN         temporary_route_dates.trd_cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_trd_route_date                 IN         temporary_route_dates.trd_route_date%TYPE,
  p_trd_rou_code                   IN         temporary_route_dates.trd_rou_code%TYPE,
  p_trd_cus_code                   IN         temporary_route_dates.trd_cus_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_trd_route_date                 IN         temporary_route_dates.trd_route_date%TYPE,
  p_trd_rou_code                   IN         temporary_route_dates.trd_rou_code%TYPE,
  p_trd_cus_code                   IN         temporary_route_dates.trd_cus_code%TYPE);


PROCEDURE INSERT_PROC(
  p_trd_route_date                IN         temporary_route_dates.trd_route_date%TYPE,
  p_trd_rou_code                  IN         temporary_route_dates.trd_rou_code%TYPE,
  p_trd_cus_code                  IN         temporary_route_dates.trd_cus_code%TYPE,
  p_trd_position                  IN         temporary_route_dates.trd_position%TYPE                       DEFAULT NULL,
  p_trd_includes_transport_switc  IN         temporary_route_dates.trd_includes_transport_switch%TYPE      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_route_dates%ROWTYPE);

PROCEDURE INIT_INCLUDES_PROC(
  p_init_switch                   IN NUMBER DEFAULT 1,
  p_trd_route_date								IN temporary_route_dates.trd_route_date%TYPE,
	p_trd_rou_code           				IN temporary_route_dates.trd_rou_code%TYPE,
	p_trd_cus_code     							IN temporary_route_dates.trd_cus_code%TYPE);


PROCEDURE INSERT_TRD_PROC(
	p_trd_route_date								IN temporary_route_dates.trd_route_date%TYPE,
	p_trd_rou_code           				IN temporary_route_dates.trd_rou_code%TYPE,
	p_trd_cus_code     							IN temporary_route_dates.trd_cus_code%TYPE,
	p_trd_position           				IN temporary_route_dates.trd_position%TYPE,
	p_trd_includes_transport_switc	IN temporary_route_dates.trd_includes_transport_switch%TYPE DEFAULT 0
);

END TRD_PACK;
/