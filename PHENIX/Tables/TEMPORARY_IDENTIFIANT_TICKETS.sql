CREATE TABLE phenix.temporary_identifiant_tickets (
  tit_ide_id VARCHAR2(12 BYTE)
);
COMMENT ON TABLE phenix.temporary_identifiant_tickets IS 'Table temporaraire utilisée pour imprimer les étiquettes d''identifiant';
COMMENT ON COLUMN phenix.temporary_identifiant_tickets.tit_ide_id IS 'Indique le code d''identifiant';