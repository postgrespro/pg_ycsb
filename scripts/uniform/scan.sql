\set scan random(1, 10)
\set scanlimit random(2, 10)

BEGIN;
SELECT * from pgbench_accounts where abalance>:scan limit :scanlimit;
END;
