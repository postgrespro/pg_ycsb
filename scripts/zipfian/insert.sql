\SET id random_zipfian(1, 100000 * :scale, 0.99)
BEGIN;
INSERT INTO pgbench_accounts (aid, bid, abalance) VALUES (:id, 1, 0);
END;
