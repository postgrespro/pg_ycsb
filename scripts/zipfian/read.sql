-- READ from YCSB workload
\set read random_zipfian(1, 10,:parameter)
BEGIN;
SELECT * from pgbench_accounts where aid = :read;
END;
