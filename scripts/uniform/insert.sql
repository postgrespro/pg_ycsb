\SET id random(1, 100000 * :scale)
BEGIN;
INSERT INTO pgbench_accounts (aid, bid, abalance) VALUES (:id, 1, 0);
END;
