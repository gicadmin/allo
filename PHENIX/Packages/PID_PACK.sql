CREATE OR REPLACE PACKAGE phenix.PID_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pick_transactions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pid_id                         IN         pick_transactions.pid_id%TYPE,
  p_pid_rec                        OUT NOCOPY pick_transactions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pid_id                         IN         pick_transactions.pid_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pid_id                         IN         pick_transactions.pid_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pid_id                         IN         pick_transactions.pid_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pid_id                         IN         pick_transactions.pid_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pid_id                         IN         pick_transactions.pid_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pid_prf_prd_code              IN         pick_transactions.pid_prf_prd_code%TYPE,
  p_pid_prf_fmt_code              IN         pick_transactions.pid_prf_fmt_code%TYPE,
  p_pid_start_date                IN         pick_transactions.pid_start_date%TYPE,
  p_pid_type                      IN         pick_transactions.pid_type%TYPE,
  p_pid_trans_type                IN         pick_transactions.pid_trans_type%TYPE,
  p_pid_picked_quantity           IN         pick_transactions.pid_picked_quantity%TYPE                DEFAULT NULL,
  p_pid_picked_weight             IN         pick_transactions.pid_picked_weight%TYPE                  DEFAULT NULL,
  p_pid_loc_code                  IN         pick_transactions.pid_loc_code%TYPE                       DEFAULT NULL,
  p_pid_end_date                  IN         pick_transactions.pid_end_date%TYPE                       DEFAULT NULL,
  p_pid_expiry_date               IN         pick_transactions.pid_expiry_date%TYPE                    DEFAULT NULL,
  p_pid_fifo_date                 IN         pick_transactions.pid_fifo_date%TYPE                      DEFAULT NULL,
  p_pid_requested_quantity        IN         pick_transactions.pid_requested_quantity%TYPE             DEFAULT NULL,
  p_pid_requested_weight          IN         pick_transactions.pid_requested_weight%TYPE               DEFAULT NULL,
  p_pid_pmh_id                    IN         pick_transactions.pid_pmh_id%TYPE                         DEFAULT NULL,
  p_pid_pmd_id                    IN         pick_transactions.pid_pmd_id%TYPE                         DEFAULT NULL,
  p_pid_use_picker_code           IN         pick_transactions.pid_use_picker_code%TYPE                DEFAULT NULL,
  p_pid_use_completion_code       IN         pick_transactions.pid_use_completion_code%TYPE            DEFAULT NULL,
  p_pid_loc_quantity_on_hand      IN         pick_transactions.pid_loc_quantity_on_hand%TYPE           DEFAULT NULL,
  p_pid_loc_weight_on_hand        IN         pick_transactions.pid_loc_weight_on_hand%TYPE             DEFAULT NULL,
  p_pid_container_id              IN         pick_transactions.pid_container_id%TYPE                   DEFAULT NULL,
  p_pid_dest_loc_code             IN         pick_transactions.pid_dest_loc_code%TYPE                  DEFAULT NULL,
  p_pid_dest_loc_quantity_on_han  IN         pick_transactions.pid_dest_loc_quantity_on_hand%TYPE      DEFAULT NULL,
  p_pid_dest_loc_weight_on_hand   IN         pick_transactions.pid_dest_loc_weight_on_hand%TYPE        DEFAULT NULL,
  p_pid_whs_code                  IN         pick_transactions.pid_whs_code%TYPE                       DEFAULT NULL,
  p_pid_dock_loc_code             IN         pick_transactions.pid_dock_loc_code%TYPE                  DEFAULT NULL)
RETURN NUMBER;
----------------------------------------------------------------------------------------------------
--les fonctions/procedures existantes avant la regénération
----------------------------------------------------------------------------------------------------
FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pick_transactions%ROWTYPE)
RETURN NUMBER;
FUNCTION GET_PID_ID_FUNC RETURN NUMBER;

PROCEDURE INSERT_PID_PROC(
	p_pid_id                        	IN pick_transactions.pid_id%TYPE,
	p_pid_pmh_id                      IN pick_transactions.pid_pmh_id%TYPE,
	p_pid_pmd_id                      IN pick_transactions.pid_pmd_id%TYPE,
	p_pid_whs_code                    IN pick_transactions.pid_whs_code%TYPE,
	p_pid_prf_prd_code                IN pick_transactions.pid_prf_prd_code%TYPE,
	p_pid_prf_fmt_code                IN pick_transactions.pid_prf_fmt_code%TYPE,
	p_pid_use_picker_code             IN pick_transactions.pid_use_picker_code%TYPE,
	p_pid_use_completion_code         IN pick_transactions.pid_use_completion_code%TYPE,
	p_pid_type                        IN pick_transactions.pid_type%TYPE,
	p_pid_container_id                IN pick_transactions.pid_container_id%TYPE,
	p_pid_trans_type                  IN pick_transactions.pid_trans_type%TYPE,
	p_pid_loc_code                    IN pick_transactions.pid_loc_code%TYPE,
	p_pid_loc_quantity_on_hand        IN pick_transactions.pid_loc_quantity_on_hand%TYPE,
	p_pid_loc_weight_on_hand          IN pick_transactions.pid_loc_weight_on_hand%TYPE,
	p_pid_requested_quantity          IN pick_transactions.pid_requested_quantity%TYPE,
	p_pid_requested_weight            IN pick_transactions.pid_requested_weight%TYPE,
	p_pid_picked_quantity             IN pick_transactions.pid_picked_quantity%TYPE,
	p_pid_picked_weight               IN pick_transactions.pid_picked_weight%TYPE,
	p_pid_start_date                  IN pick_transactions.pid_start_date%TYPE,
	p_pid_end_date                    IN pick_transactions.pid_end_date%TYPE,
	p_pid_expiry_date                 IN pick_transactions.pid_expiry_date%TYPE,
	p_pid_fifo_date                   IN pick_transactions.pid_fifo_date%TYPE,
	p_pid_dest_loc_code               IN pick_transactions.pid_dest_loc_code%TYPE,
	p_pid_dest_loc_qty_on_hand   			IN pick_transactions.pid_dest_loc_quantity_on_hand%TYPE,
	p_pid_dest_loc_weight_on_hand     IN pick_transactions.pid_dest_loc_weight_on_hand%TYPE,
  p_pid_dock_loc_code               IN pick_transactions.pid_dock_loc_code%TYPE  --CSC8347
);

FUNCTION UPDATE_PICK_AUDIT_FUNC(
  p_pmd_id            IN  NUMBER,
  p_picker_code       IN  NUMBER,   							--gic1842
  p_completion_code   IN  NUMBER,   							--gic1842
  p_start_date        IN  DATE,   								--gic2056
  p_end_date          IN  DATE,   								--gic2056
  p_do_commit_switch  IN  NUMBER DEFAULT 0,
  p_pid_container_id  IN  NUMBER DEFAULT NULL,   	--csc2799
  p_dest_loc          IN  VARCHAR2 DEFAULT NULL,  --CSC2997
  p_trans_type				IN	VARCHAR2, 							--CSC3357
  p_fifo_date					IN 	DATE,										--csc5212
  p_expiry_date				IN	DATE										--csc5212
)
RETURN PLS_INTEGER;

END PID_PACK;
/