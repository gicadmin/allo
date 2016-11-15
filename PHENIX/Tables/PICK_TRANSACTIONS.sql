CREATE TABLE phenix.pick_transactions (
  pid_id NUMBER(15) NOT NULL,
  pid_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  pid_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  pid_picked_quantity NUMBER(7),
  pid_picked_weight NUMBER(10,3),
  pid_loc_code VARCHAR2(12 BYTE),
  pid_start_date DATE NOT NULL,
  pid_end_date DATE,
  pid_expiry_date DATE,
  pid_fifo_date DATE,
  pid_requested_quantity NUMBER(7),
  pid_requested_weight NUMBER(10,3),
  pid_pmh_id NUMBER(15),
  pid_pmd_id NUMBER(15),
  pid_use_picker_code NUMBER(5),
  pid_use_completion_code NUMBER(5),
  pid_type VARCHAR2(1 BYTE) NOT NULL,
  pid_loc_quantity_on_hand NUMBER(10),
  pid_loc_weight_on_hand NUMBER(10,3),
  pid_container_id NUMBER(12),
  pid_dest_loc_code VARCHAR2(12 BYTE),
  pid_dest_loc_weight_on_hand NUMBER(10,3),
  pid_dest_loc_quantity_on_hand NUMBER(7),
  pid_trans_type VARCHAR2(1 BYTE) NOT NULL CONSTRAINT pid_trans_type_ck CHECK (PID_TRANS_TYPE IN ('P','T','V','S')),
  pid_whs_code VARCHAR2(2 BYTE),
  pid_dock_loc_code VARCHAR2(12 BYTE),
  CONSTRAINT pid_pk PRIMARY KEY (pid_id),
  CONSTRAINT pid_prf_fk FOREIGN KEY (pid_prf_prd_code,pid_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT pid_use_completion_fk FOREIGN KEY (pid_use_completion_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT pid_use_picker_fk FOREIGN KEY (pid_use_picker_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT pid_whs_fk FOREIGN KEY (pid_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.pick_transactions IS 'Table de L''historique des mouvements des conteneurs';
COMMENT ON COLUMN phenix.pick_transactions.pid_id IS 'Indique l''identifiant de la transaction';
COMMENT ON COLUMN phenix.pick_transactions.pid_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.pick_transactions.pid_prf_fmt_code IS 'Indique le format du produit';
COMMENT ON COLUMN phenix.pick_transactions.pid_picked_quantity IS 'Indique la quantité cueillie';
COMMENT ON COLUMN phenix.pick_transactions.pid_picked_weight IS 'Indique le poids cueilli';
COMMENT ON COLUMN phenix.pick_transactions.pid_loc_code IS 'Indique la localisation de la cueillette';
COMMENT ON COLUMN phenix.pick_transactions.pid_start_date IS 'Indique la date/heure de début de la cueillette';
COMMENT ON COLUMN phenix.pick_transactions.pid_end_date IS 'Indique la date/heure de fin de la cueillette';
COMMENT ON COLUMN phenix.pick_transactions.pid_expiry_date IS 'Indique la date d''expiration du produit';
COMMENT ON COLUMN phenix.pick_transactions.pid_fifo_date IS 'Indique la date pour gérer la rotation de l''inventaire';
COMMENT ON COLUMN phenix.pick_transactions.pid_requested_quantity IS 'Indique la quantité demandée';
COMMENT ON COLUMN phenix.pick_transactions.pid_requested_weight IS 'Indique le poids demandé';
COMMENT ON COLUMN phenix.pick_transactions.pid_pmh_id IS 'Indique l''identifiant de l''en-tête de la mission de cueillette';
COMMENT ON COLUMN phenix.pick_transactions.pid_pmd_id IS 'Indique l''identifiant du détail de la mission de cueillette';
COMMENT ON COLUMN phenix.pick_transactions.pid_use_picker_code IS 'Indique le code de l''utilisateur ayant effectué la cueillette';
COMMENT ON COLUMN phenix.pick_transactions.pid_use_completion_code IS 'Indique le code de l''utilisateur ayant fermé la mission de cueillette';
COMMENT ON COLUMN phenix.pick_transactions.pid_type IS 'Indique si la transaction est une cueillette ou un retour fournisseur';
COMMENT ON COLUMN phenix.pick_transactions.pid_loc_quantity_on_hand IS 'Indique la quantité en inventaire de ce produit dans la localisation';
COMMENT ON COLUMN phenix.pick_transactions.pid_loc_weight_on_hand IS 'Indique le poids en inventaire de ce produit dans la localisation';
COMMENT ON COLUMN phenix.pick_transactions.pid_container_id IS 'Indique le numéro du conteneur utilisé pour cette cueillette';
COMMENT ON COLUMN phenix.pick_transactions.pid_dest_loc_code IS 'Indique la localisation où l''inventaire a été re-localisé';
COMMENT ON COLUMN phenix.pick_transactions.pid_dest_loc_weight_on_hand IS 'Indique le poids en inventaire du code de la localisation de destination';
COMMENT ON COLUMN phenix.pick_transactions.pid_dest_loc_quantity_on_hand IS 'Indique la quantité en inventaire du code de la localisation de destination';
COMMENT ON COLUMN phenix.pick_transactions.pid_trans_type IS 'Indique la méthode utilisée pour effectuer la cueillette';
COMMENT ON COLUMN phenix.pick_transactions.pid_whs_code IS 'Indique l''entrepôt où la transaction a eu lieu';
COMMENT ON COLUMN phenix.pick_transactions.pid_dock_loc_code IS 'Indique le quai destinataire, toujours nul si on n''est pas dans un environnement avec Identifiants.';