\SET id random(1, 100000 * :scale)
BEGIN;
SELECT * FROM pgbench_accounts WHERE aid = :id;
END;
