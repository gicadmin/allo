CREATE TABLE phenix.multi_lang_messages (
  mlm_id NUMBER(15) NOT NULL,
  mlm_domain VARCHAR2(256 BYTE) NOT NULL,
  mlm_domain_key VARCHAR2(256 BYTE) NOT NULL,
  mlm_lang_code VARCHAR2(5 BYTE) NOT NULL CONSTRAINT mlm_lang_code_ck CHECK (MLM_LANG_CODE IN ('fr-CA','en-CA','fr-VC','en-VC')),
  mlm_message VARCHAR2(4000 BYTE) NOT NULL,
  mlm_order NUMBER(3) DEFAULT 1 NOT NULL,
  CONSTRAINT mlm_pk PRIMARY KEY (mlm_id),
  CONSTRAINT mlm_uk UNIQUE (mlm_domain,mlm_domain_key,mlm_lang_code)
);
COMMENT ON TABLE phenix.multi_lang_messages IS 'Table des messages multi langues';
COMMENT ON COLUMN phenix.multi_lang_messages.mlm_id IS 'ID du message';
COMMENT ON COLUMN phenix.multi_lang_messages.mlm_domain IS 'Domaine du message';
COMMENT ON COLUMN phenix.multi_lang_messages.mlm_domain_key IS 'Cle pour le domaine';
COMMENT ON COLUMN phenix.multi_lang_messages.mlm_lang_code IS 'Code de langue - "Langue (ISO-639-2)"_"Pays (ISO-3166)". Nous utilisons le pays VC pour les messages "voice"';
COMMENT ON COLUMN phenix.multi_lang_messages.mlm_message IS 'Message selon la langue (column MLM_LANG_CODE)';
COMMENT ON COLUMN phenix.multi_lang_messages.mlm_order IS 'Ordre d''affichage du message (Utilisé pour le tri de la langue - DOMAIN = LANGUAGE_CODE)';