-- READ from YCSB workload
\set read random(1, 10)
BEGIN;
SELECT * from pgbench_accounts where aid = :read;
END;
