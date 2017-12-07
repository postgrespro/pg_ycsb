-- INSERT from YCSB workload
\set nbranches :scale
\set ntellers 10 * :scale
\set naccounts 100000 * :scale

\set aid random_zipfian(1, 100000 * :scale, :parameter)
\set bid random_zipfian(1, 1 * :scale, :parameter)
\set tid random_zipfian(1, 10 * :scale, :parameter)
\set delta random_zipfian(-5000, 5000, :parameter)

BEGIN;
INSERT into pgbench_history (tid, bid, aid, delta, mtime) VALUES (:tid, :bid, :aid, :delta, CURRENT_TIMESTAMP);
END;
