-- UPDATE from YCSB workload
\set aid random_zipfian(1, 100000 * :scale, :parameter)
\set delta random_zipfian(-5000, 5000, :parameter)

BEGIN;
UPDATE pgbench_accounts SET abalance = abalance + :delta WHERE aid = :aid;
END;
