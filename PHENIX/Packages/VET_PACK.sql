CREATE OR REPLACE PACKAGE phenix.VET_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_edi_transactions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vet_ven_code                   IN         vendor_edi_transactions.vet_ven_code%TYPE,
  p_vet_edi_code                   IN         vendor_edi_transactions.vet_edi_code%TYPE,
  p_vet_rec                        OUT NOCOPY vendor_edi_transactions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vet_ven_code                   IN         vendor_edi_transactions.vet_ven_code%TYPE,
  p_vet_edi_code                   IN         vendor_edi_transactions.vet_edi_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vet_ven_code                   IN         vendor_edi_transactions.vet_ven_code%TYPE,
  p_vet_edi_code                   IN         vendor_edi_transactions.vet_edi_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vet_ven_code                   IN         vendor_edi_transactions.vet_ven_code%TYPE,
  p_vet_edi_code                   IN         vendor_edi_transactions.vet_edi_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vet_ven_code                   IN         vendor_edi_transactions.vet_ven_code%TYPE,
  p_vet_edi_code                   IN         vendor_edi_transactions.vet_edi_code%TYPE);


PROCEDURE INSERT_PROC(
  p_vet_ven_code         IN         vendor_edi_transactions.vet_ven_code%TYPE,
  p_vet_edi_code         IN         vendor_edi_transactions.vet_edi_code%TYPE,
  p_vet_direction_flag   IN         vendor_edi_transactions.vet_direction_flag%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_edi_transactions%ROWTYPE);

END VET_PACK;
/