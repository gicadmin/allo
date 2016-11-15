CREATE TABLE phenix.formula_components (
  fco_id NUMBER(15) NOT NULL,
  fco_for_id NUMBER(15),
  fco_fco_id NUMBER(15),
  fco_type VARCHAR2(8 BYTE) NOT NULL CONSTRAINT fco_type_ck CHECK (FCO_TYPE IN ('BUNDLE','VALUE', 'CONSTANT')),
  fco_fsc_id NUMBER(15),
  fco_for_exec_id NUMBER(15),
  fco_value NUMBER,
  fco_operation VARCHAR2(3 BYTE),
  CONSTRAINT fco_for_exec_id_ck CHECK (
         (FCO_FOR_EXEC_ID IS NULL AND FCO_FSC_ID IS NOT NULL) OR
         (FCO_FOR_EXEC_ID IS NOT NULL AND FCO_FSC_ID IS NULL) OR
         (FCO_FOR_EXEC_ID IS NULL AND FCO_FSC_ID IS NULL)
        ),
  CONSTRAINT fco_fsc_id_ck CHECK (
         (FCO_FOR_EXEC_ID IS NULL AND FCO_FSC_ID IS NULL AND FCO_TYPE = 'CONSTANT') OR
         (FCO_TYPE IN ('BUNDLE','VALUE'))
        ),
  CONSTRAINT fco_operation_ck CHECK (
         (FCO_TYPE = 'BUNDLE' AND FCO_OPERATION IN ('ADD','SUB', 'MUL', 'DIV')) OR
         (FCO_TYPE != 'BUNDLE' AND FCO_OPERATION IN ('ADD','SUB', 'MUL', 'DIV', 'N/A'))
        ),
  CONSTRAINT fco_parent_ck CHECK (
         (FCO_FOR_ID IS NULL AND FCO_FCO_ID IS NOT NULL) OR
         (FCO_FOR_ID IS NOT NULL AND FCO_FCO_ID IS NULL)
        ),
  CONSTRAINT fco_pk PRIMARY KEY (fco_id),
  CONSTRAINT fco_fco_fk FOREIGN KEY (fco_fco_id) REFERENCES phenix.formula_components (fco_id) ON DELETE CASCADE,
  CONSTRAINT fco_for_exec_fk FOREIGN KEY (fco_for_exec_id) REFERENCES phenix.formulas (for_id),
  CONSTRAINT fco_for_fk FOREIGN KEY (fco_for_id) REFERENCES phenix.formulas (for_id) ON DELETE CASCADE
);