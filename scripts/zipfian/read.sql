\SET id random_zipfian(1, 100000 * :scale, 0.99)
BEGIN;
SELECT * FROM pgbench_accounts WHERE aid = :id;
END;
