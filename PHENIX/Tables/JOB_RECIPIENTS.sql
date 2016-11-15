CREATE TABLE phenix.job_recipients (
  jre_prn_id NUMBER(*,0),
  jre_dest_type VARCHAR2(3 BYTE) CONSTRAINT jre_dest_type_ck CHECK (JRE_DEST_TYPE IN ('SMS', 'FAX', 'MAI', 'PRN')),
  jre_id NUMBER(*,0) NOT NULL,
  jre_jsc_id NUMBER(*,0) NOT NULL,
  jre_use_code NUMBER(5),
  jre_email VARCHAR2(200 BYTE),
  jre_cont_type VARCHAR2(240 BYTE) CONSTRAINT jre_cont_type_ck CHECK (JRE_CONT_TYPE IN ('OTH', 'CON', 'VEN', 'USE')),
  jre_fax_number NUMBER(11),
  jre_lang_code VARCHAR2(2 BYTE) DEFAULT 'FR' NOT NULL CONSTRAINT jre_lang_code_ck CHECK (JRE_LANG_CODE IN ('FR','EN')),
  jre_extension VARCHAR2(3 BYTE) DEFAULT 'PDF' NOT NULL CONSTRAINT jre_extension_ck CHECK (JRE_EXTENSION IN ('PDF', 'XML')),
  jre_file_name VARCHAR2(200 BYTE),
  jre_cc_email VARCHAR2(200 BYTE),
  jre_bcc_email VARCHAR2(200 BYTE),
  jre_from_email VARCHAR2(200 BYTE),
  CONSTRAINT jre_pk PRIMARY KEY (jre_id),
  CONSTRAINT jre_jsc_fk FOREIGN KEY (jre_jsc_id) REFERENCES phenix.job_schedules (jsc_id) ON DELETE CASCADE
);
COMMENT ON COLUMN phenix.job_recipients.jre_lang_code IS 'Indique la la langue dans laquelle on veut éditer le rapport';
COMMENT ON COLUMN phenix.job_recipients.jre_extension IS 'Indique le type de fichier à générer';
COMMENT ON COLUMN phenix.job_recipients.jre_file_name IS 'Indique le nom à utiliser lors de la génération du rapport';
COMMENT ON COLUMN phenix.job_recipients.jre_cc_email IS 'Indique le courriel en copie conforme du destinataire';
COMMENT ON COLUMN phenix.job_recipients.jre_bcc_email IS 'Indique le courriel en copie conforme cachée du destinataire';
COMMENT ON COLUMN phenix.job_recipients.jre_from_email IS 'Indique le courriel de l''expéditeur du destinataire';