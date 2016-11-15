CREATE OR REPLACE PACKAGE phenix.CAR_PACK IS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  carriers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_car_code                       IN         carriers.car_code%TYPE,
  p_car_rec                        OUT NOCOPY carriers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_car_code                       IN         carriers.car_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_car_code                       IN         carriers.car_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_car_code                       IN         carriers.car_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_car_code                       IN         carriers.car_code%TYPE);


PROCEDURE INSERT_PROC(
  p_car_code               IN         carriers.car_code%TYPE,
  p_car_name               IN         carriers.car_name%TYPE,
  p_car_address            IN         carriers.car_address%TYPE,
  p_car_city               IN         carriers.car_city%TYPE,
  p_car_prv_code           IN         carriers.car_prv_code%TYPE,
  p_car_postal_code        IN         carriers.car_postal_code%TYPE,
  p_car_telephone_number   IN         carriers.car_telephone_number%TYPE,
  p_car_maritime_switch    IN         carriers.car_maritime_switch%TYPE         DEFAULT 0 ,
  p_car_email              IN         carriers.car_email%TYPE                   DEFAULT NULL,
  p_car_fax_number         IN         carriers.car_fax_number%TYPE              DEFAULT NULL,
  p_car_contact_first_name IN         carriers.car_contact_first_name%TYPE      DEFAULT NULL,
  p_car_contact_last_name  IN         carriers.car_contact_last_name%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY carriers%ROWTYPE);

FUNCTION FIND_CAR_NAME_FUNC(
	p_car_code IN NUMBER
)
RETURN VARCHAR2;

END CAR_PACK;
/