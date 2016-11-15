CREATE TABLE phenix.send_fax (
  sef_id NUMBER(15) NOT NULL,
  sef_jre_id NUMBER(15) NOT NULL,
  sef_path VARCHAR2(250 BYTE) NOT NULL,
  sef_number NUMBER(11) NOT NULL,
  sef_creation_date TIMESTAMP(3) DEFAULT systimestamp NOT NULL,
  sef_sent_date TIMESTAMP(3),
  sef_status_flag VARCHAR2(1 BYTE) DEFAULT 'R' NOT NULL CONSTRAINT sef_status_flag_ck CHECK (SEF_STATUS_FLAG IN ('C', 'R', 'S', 'W', 'F')),
  sef_fax_submissiontime DATE,
  sef_fax_status VARCHAR2(257 BYTE),
  sef_fax_errordesc VARCHAR2(257 BYTE),
  sef_fax_errorcode VARCHAR2(12 BYTE),
  sef_fax_sendpages VARCHAR2(18 BYTE),
  sef_fax_totalpages VARCHAR2(18 BYTE),
  sef_fax_retries VARCHAR2(18 BYTE),
  CONSTRAINT sef_pk PRIMARY KEY (sef_id),
  CONSTRAINT sef_jre_fk FOREIGN KEY (sef_jre_id) REFERENCES phenix.job_recipients (jre_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.send_fax IS 'Gestion des telecopies';
COMMENT ON COLUMN phenix.send_fax.sef_id IS 'Identifiant de l''enrgistrement';
COMMENT ON COLUMN phenix.send_fax.sef_jre_id IS 'Id du job_recipient';
COMMENT ON COLUMN phenix.send_fax.sef_path IS 'Nom et chemin du ficher';
COMMENT ON COLUMN phenix.send_fax.sef_number IS 'Numero de telecopieur a utiliser';
COMMENT ON COLUMN phenix.send_fax.sef_creation_date IS 'Date de création du fichier';
COMMENT ON COLUMN phenix.send_fax.sef_sent_date IS 'Date d''envoi du fax';
COMMENT ON COLUMN phenix.send_fax.sef_status_flag IS 'Statut de l''envoi';
COMMENT ON COLUMN phenix.send_fax.sef_fax_submissiontime IS 'Date pour a laquel le document a ete envoye au fax server';
COMMENT ON COLUMN phenix.send_fax.sef_fax_status IS 'Status du document dans fax server';
COMMENT ON COLUMN phenix.send_fax.sef_fax_errordesc IS 'Description de l''erreur du document dans fax server';
COMMENT ON COLUMN phenix.send_fax.sef_fax_errorcode IS ' Code de l''erreur du document dans fax server';
COMMENT ON COLUMN phenix.send_fax.sef_fax_sendpages IS 'Nombre de page envoye';
COMMENT ON COLUMN phenix.send_fax.sef_fax_totalpages IS 'Nombre total de page du document';
COMMENT ON COLUMN phenix.send_fax.sef_fax_retries IS ' Nombre de tantative d''envoie';