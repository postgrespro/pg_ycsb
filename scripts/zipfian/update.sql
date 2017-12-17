\SET id random_zipfian(1, 100000 * :scale, 0.99)
\SET delta random(-5000, 5000)
BEGIN;
UPDATE pgbench_accounts SET abalance = abalance + :delta WHERE aid = :id;
END;
