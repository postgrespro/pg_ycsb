\set scan random_zipfian(1, 10, :parameter)
\set scanlimit random(2, 10, :parameter)

BEGIN;
SELECT * from pgbench_accounts where abalance>:scan limit :scanlimit;
END;
