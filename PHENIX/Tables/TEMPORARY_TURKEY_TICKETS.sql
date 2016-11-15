CREATE GLOBAL TEMPORARY TABLE phenix.temporary_turkey_tickets (
  ttt_pmd_id NUMBER(15)
)
ON COMMIT DELETE ROWS;
COMMENT ON TABLE phenix.temporary_turkey_tickets IS 'Table utilisé pour imprimer les étiquettes de dindes';
COMMENT ON COLUMN phenix.temporary_turkey_tickets.ttt_pmd_id IS 'Indique l''identifiant unique de la ligne de détail d''une mission de cueillette';