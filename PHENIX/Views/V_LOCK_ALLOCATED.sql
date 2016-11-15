CREATE OR REPLACE FORCE VIEW phenix.v_lock_allocated (lock_name,lock_id,lock_expiration) AS
SELECT name lock_name,
         lockid lock_id,
         expiration lock_expiration
  FROM sys.dbms_lock_allocated;