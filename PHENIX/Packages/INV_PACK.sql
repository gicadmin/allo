CREATE OR REPLACE PACKAGE phenix.INV_PACK IS

/*----------------------------------------------------------------------------
* Procedures et fonctionss generees automatiquement.
*----------------------------------------------------------------------------*/
FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  inventories%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_inv_id                         IN         inventories.inv_id%TYPE,
  p_inv_rec                        OUT NOCOPY inventories%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_inv_id                         IN         inventories.inv_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_inv_id                         IN         inventories.inv_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_inv_id                         IN         inventories.inv_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_inv_id                         IN         inventories.inv_id%TYPE)
RETURN NUMBER;

FUNCTION GET_FULL_FUNC(
  p_inv_prf_prd_code               IN         inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code               IN         inventories.inv_prf_fmt_code%TYPE,
  p_inv_loc_code                   IN         inventories.inv_loc_code%TYPE,
  p_inv_rec                        OUT NOCOPY inventories%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_inv_prf_prd_code               IN         inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code               IN         inventories.inv_prf_fmt_code%TYPE,
  p_inv_loc_code                   IN         inventories.inv_loc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_inv_prf_prd_code               IN         inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code               IN         inventories.inv_prf_fmt_code%TYPE,
  p_inv_loc_code                   IN         inventories.inv_loc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_inv_prf_prd_code               IN         inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code               IN         inventories.inv_prf_fmt_code%TYPE,
  p_inv_loc_code                   IN         inventories.inv_loc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_inv_prf_prd_code               IN         inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code               IN         inventories.inv_prf_fmt_code%TYPE,
  p_inv_loc_code                   IN         inventories.inv_loc_code%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_inv_prf_prd_code           IN         inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code           IN         inventories.inv_prf_fmt_code%TYPE,
  p_inv_loc_code               IN         inventories.inv_loc_code%TYPE,
  p_inv_quantity_on_hand       IN         inventories.inv_quantity_on_hand%TYPE,
  p_inv_weight_on_hand         IN         inventories.inv_weight_on_hand%TYPE,
  p_inv_quantity_in            IN         inventories.inv_quantity_in%TYPE,
  p_inv_weight_in              IN         inventories.inv_weight_in%TYPE,
  p_inv_quantity_out           IN         inventories.inv_quantity_out%TYPE,
  p_inv_weight_out             IN         inventories.inv_weight_out%TYPE,
  p_inv_quantity_on_hold       IN         inventories.inv_quantity_on_hold%TYPE,
  p_inv_weight_on_hold         IN         inventories.inv_weight_on_hold%TYPE,
  p_inv_in_date                IN         inventories.inv_in_date%TYPE,
  p_inv_quantity_max           IN         inventories.inv_quantity_max%TYPE,
  p_inv_last_pick_date         IN         inventories.inv_last_pick_date%TYPE,
  p_inv_last_count_date        IN         inventories.inv_last_count_date%TYPE,
  p_inv_fifo_date              IN         inventories.inv_fifo_date%TYPE,
  p_inv_expiry_date            IN         inventories.inv_expiry_date%TYPE,
  p_inv_quantity_min           IN         inventories.inv_quantity_min%TYPE,
  p_inv_weight_max             IN         inventories.inv_weight_max%TYPE,
  p_inv_weight_min             IN         inventories.inv_weight_min%TYPE,
  p_inv_out_date               IN         inventories.inv_out_date%TYPE,
  p_inv_quantity_moved_in      IN         inventories.inv_quantity_moved_in%TYPE,
  p_inv_quantity_moved_out     IN         inventories.inv_quantity_moved_out%TYPE,
  p_inv_weight_moved_out       IN         inventories.inv_weight_moved_out%TYPE,
  p_inv_trans_type             IN         inventories.inv_trans_type%TYPE,
  p_inv_on_hold_date           IN         inventories.inv_on_hold_date%TYPE,
  p_inv_creation_date          IN         inventories.inv_creation_date%TYPE               DEFAULT NULL,
  p_inv_last_modification_date IN         inventories.inv_last_modification_date%TYPE      DEFAULT NULL)
RETURN NUMBER;

FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY inventories%ROWTYPE)
RETURN NUMBER;

/*----------------------------------------------------------------------------
* Anciennes procedures et fonctionss.Prendre, autant que possible, les
* procedures et fonctions generees.
*----------------------------------------------------------------------------*/

FUNCTION GET_INV_ID_FUNC RETURN NUMBER;

FUNCTION GET_INV_RECORD_FUNC(
	p_inv_id           IN inventories.inv_id%TYPE,
  p_inv_prf_prd_code IN inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code IN inventories.inv_prf_fmt_code%TYPE,
  p_inv_loc_code     IN inventories.inv_loc_code%TYPE,
  p_inventories_rec  OUT NOCOPY inventories%ROWTYPE
)
RETURN PLS_INTEGER;

FUNCTION LOCK_INV_RECORD_FUNC(
	p_inv_id           IN inventories.inv_id%TYPE,
  p_inv_prf_prd_code IN inventories.inv_prf_prd_code%TYPE	DEFAULT NULL,	--si le ID est rempli
  p_inv_prf_fmt_code IN inventories.inv_prf_fmt_code%TYPE	DEFAULT NULL,	--si le ID est rempli
  p_inv_loc_code     IN inventories.inv_loc_code%TYPE			DEFAULT NULL	--si le ID est rempli
)
RETURN BOOLEAN;

PROCEDURE INSERT_INV_QTY_ONLY_PROC(
	p_inv_id                      IN inventories.inv_id%TYPE,
	p_inv_prf_prd_code            IN inventories.inv_prf_prd_code%TYPE,
	p_inv_prf_fmt_code            IN inventories.inv_prf_fmt_code%TYPE,
	p_inv_loc_code                IN inventories.inv_loc_code%TYPE,
	p_inv_quantity_on_hand        IN inventories.inv_quantity_on_hand%TYPE,
	p_inv_quantity_in             IN inventories.inv_quantity_in%TYPE,
	p_inv_quantity_out            IN inventories.inv_quantity_out%TYPE,
	p_inv_quantity_on_hold        IN inventories.inv_quantity_on_hold%TYPE,
	p_inv_quantity_max            IN inventories.inv_quantity_max%TYPE,
	p_inv_quantity_min            IN inventories.inv_quantity_min%TYPE,
	p_inv_quantity_moved_in       IN inventories.inv_quantity_moved_in%TYPE,
	p_inv_quantity_moved_out      IN inventories.inv_quantity_moved_out%TYPE,
	p_inv_in_date                 IN inventories.inv_in_date%TYPE									DEFAULT NULL,
	p_inv_out_date                IN inventories.inv_out_date%TYPE								DEFAULT NULL,
	p_inv_last_pick_date          IN inventories.inv_last_pick_date%TYPE					DEFAULT NULL,
	p_inv_last_count_date         IN inventories.inv_last_count_date%TYPE					DEFAULT NULL,
	p_inv_fifo_date               IN inventories.inv_fifo_date%TYPE								DEFAULT NULL,
	p_inv_expiry_date             IN inventories.inv_expiry_date%TYPE							DEFAULT NULL,
	p_inv_trans_type              IN inventories.inv_trans_type%TYPE							DEFAULT NULL,
	p_inv_on_hold_date            IN inventories.inv_on_hold_date%TYPE						DEFAULT NULL,
	p_inv_creation_date           IN inventories.inv_creation_date%TYPE						DEFAULT SYSDATE,
	p_inv_last_modification_date  IN inventories.inv_last_modification_date%TYPE	DEFAULT SYSDATE
);

PROCEDURE INSERT_INV_WGHT_ONLY_PROC(
	p_inv_id                      IN inventories.inv_id%TYPE,
	p_inv_prf_prd_code            IN inventories.inv_prf_prd_code%TYPE,
	p_inv_prf_fmt_code            IN inventories.inv_prf_fmt_code%TYPE,
	p_inv_loc_code                IN inventories.inv_loc_code%TYPE,
	p_inv_weight_on_hand          IN inventories.inv_weight_on_hand%TYPE,
	p_inv_weight_in               IN inventories.inv_weight_in%TYPE,
	p_inv_weight_out              IN inventories.inv_weight_out%TYPE,
	p_inv_weight_on_hold          IN inventories.inv_weight_on_hold%TYPE,
	p_inv_weight_max              IN inventories.inv_weight_max%TYPE,
	p_inv_weight_min              IN inventories.inv_weight_min%TYPE,
	p_inv_weight_moved_out        IN inventories.inv_weight_moved_out%TYPE,
	p_inv_in_date                 IN inventories.inv_in_date%TYPE									DEFAULT NULL,
	p_inv_out_date                IN inventories.inv_out_date%TYPE								DEFAULT NULL,
	p_inv_last_pick_date          IN inventories.inv_last_pick_date%TYPE					DEFAULT NULL,
	p_inv_last_count_date         IN inventories.inv_last_count_date%TYPE					DEFAULT NULL,
	p_inv_fifo_date               IN inventories.inv_fifo_date%TYPE								DEFAULT NULL,
	p_inv_expiry_date             IN inventories.inv_expiry_date%TYPE							DEFAULT NULL,
	p_inv_trans_type              IN inventories.inv_trans_type%TYPE							DEFAULT NULL,
	p_inv_on_hold_date            IN inventories.inv_on_hold_date%TYPE						DEFAULT NULL,
	p_inv_creation_date           IN inventories.inv_creation_date%TYPE						DEFAULT SYSDATE,
	p_inv_last_modification_date  IN inventories.inv_last_modification_date%TYPE	DEFAULT SYSDATE
);

PROCEDURE INSERT_INV_PROC(
	p_inv_id                      IN inventories.inv_id%TYPE,
	p_inv_prf_prd_code            IN inventories.inv_prf_prd_code%TYPE,
	p_inv_prf_fmt_code            IN inventories.inv_prf_fmt_code%TYPE,
	p_inv_loc_code                IN inventories.inv_loc_code%TYPE,
	p_inv_quantity_on_hand        IN inventories.inv_quantity_on_hand%TYPE,
	p_inv_quantity_in             IN inventories.inv_quantity_in%TYPE,
	p_inv_quantity_out            IN inventories.inv_quantity_out%TYPE,
	p_inv_quantity_on_hold        IN inventories.inv_quantity_on_hold%TYPE,
	p_inv_quantity_max            IN inventories.inv_quantity_max%TYPE,
	p_inv_quantity_min            IN inventories.inv_quantity_min%TYPE,
	p_inv_quantity_moved_in       IN inventories.inv_quantity_moved_in%TYPE,
	p_inv_quantity_moved_out      IN inventories.inv_quantity_moved_out%TYPE,
	p_inv_weight_on_hand          IN inventories.inv_weight_on_hand%TYPE,
	p_inv_weight_in               IN inventories.inv_weight_in%TYPE,
	p_inv_weight_out              IN inventories.inv_weight_out%TYPE,
	p_inv_weight_on_hold          IN inventories.inv_weight_on_hold%TYPE,
	p_inv_weight_max              IN inventories.inv_weight_max%TYPE,
	p_inv_weight_min              IN inventories.inv_weight_min%TYPE,
	p_inv_weight_moved_out        IN inventories.inv_weight_moved_out%TYPE,
	p_inv_in_date                 IN inventories.inv_in_date%TYPE									DEFAULT NULL,
	p_inv_out_date                IN inventories.inv_out_date%TYPE								DEFAULT NULL,
	p_inv_last_pick_date          IN inventories.inv_last_pick_date%TYPE					DEFAULT NULL,
	p_inv_last_count_date         IN inventories.inv_last_count_date%TYPE					DEFAULT NULL,
	p_inv_fifo_date               IN inventories.inv_fifo_date%TYPE								DEFAULT NULL,
	p_inv_expiry_date             IN inventories.inv_expiry_date%TYPE							DEFAULT NULL,
	p_inv_trans_type              IN inventories.inv_trans_type%TYPE							DEFAULT NULL,
	p_inv_on_hold_date            IN inventories.inv_on_hold_date%TYPE						DEFAULT NULL,
	p_inv_creation_date           IN inventories.inv_creation_date%TYPE						DEFAULT SYSDATE,
	p_inv_last_modification_date  IN inventories.inv_last_modification_date%TYPE	DEFAULT SYSDATE
);

FUNCTION IS_THERE_INV_FOR_PRD_FUNC(
	p_prd_code IN VARCHAR2
)
RETURN NUMBER;

PROCEDURE FIND_INV_ON_HAND_PROC(
	p_loc_code			IN inventories.inv_loc_code%TYPE,
	p_prd_code			IN inventories.inv_prf_prd_code%TYPE,
	p_fmt_code			IN inventories.inv_prf_fmt_code%TYPE,
	p_qty_on_hand		OUT inventories.inv_quantity_on_hand%TYPE,
	p_wght_on_hand	OUT inventories.inv_weight_on_hand%TYPE
);

FUNCTION FIND_INV_ON_HAND_AND_DATE_FUNC(
	p_loc_code			IN  inventories.inv_loc_code%TYPE,
	p_prd_code			IN  inventories.inv_prf_prd_code%TYPE,
	p_fmt_code			IN  inventories.inv_prf_fmt_code%TYPE,
	p_qty_on_hand		OUT inventories.inv_quantity_on_hand%TYPE,
	p_wght_on_hand	OUT inventories.inv_weight_on_hand%TYPE,
	p_fifo_date			OUT inventories.inv_fifo_date%TYPE,
	p_expiry_date		OUT inventories.inv_expiry_date%TYPE
)
RETURN BOOLEAN;

FUNCTION FIND_DATE_EXPIRY_AND_LOG_FUNC(
	p_loc              IN inventories.inv_loc_code%TYPE,
  p_prd_code         IN inventories.inv_prf_prd_code%TYPE,
  p_fmt_code         IN inventories.inv_prf_fmt_code%TYPE,
  p_fifo_date        OUT inventories.inv_fifo_date%TYPE,
  p_expiry_date      OUT inventories.inv_expiry_date%TYPE
)
RETURN PLS_INTEGER;

FUNCTION FIND_INV_DATE_FUNC(
	p_loc_code			IN inventories.inv_loc_code%TYPE,
	p_prd_code			IN inventories.inv_prf_prd_code%TYPE,
	p_fmt_code			IN inventories.inv_prf_fmt_code%TYPE,
	p_fifo_date			OUT inventories.inv_fifo_date%TYPE,
	p_expiry_date		OUT inventories.inv_expiry_date%TYPE
)
RETURN BOOLEAN;

--voir si la loc demandé contient d'autre produit format que celui en paramètre
FUNCTION FIND_INV_DIFF_PRF_EXISTS_FUNC(
	p_loc_code IN	inventories.inv_loc_code%TYPE,
	p_prd_code IN	inventories.inv_prf_prd_code%TYPE,
	p_fmt_code IN	inventories.inv_prf_fmt_code%TYPE
)
RETURN NUMBER;

--voir si la loc demandé contient d'autre produit que celui en paramètre
FUNCTION FIND_INV_DIFF_PRD_EXISTS_FUNC(
	p_loc_code IN	inventories.inv_loc_code%TYPE,
	p_prd_code IN	inventories.inv_prf_prd_code%TYPE
)
RETURN NUMBER;

--voir si la loc demandé contient le même produit avec des formats différents
FUNCTION FIND_INV_DIFF_FMT_EXISTS_FUNC(
	p_loc_code IN	inventories.inv_loc_code%TYPE,
	p_prd_code IN	inventories.inv_prf_prd_code%TYPE,
	p_fmt_code IN	inventories.inv_prf_fmt_code%TYPE
)
RETURN NUMBER;
------
FUNCTION IS_THERE_INV_OH_FOR_PRD_FUNC(
	p_prd_code IN VARCHAR2
)
RETURN NUMBER ;

END INV_PACK;
/