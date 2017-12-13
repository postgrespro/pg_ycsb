DROP TABLE IF EXISTS pgbench_accounts;

CREATE TABLE pgbench_accounts (
    aid    int not null,
    bid int,
    abalance int,
    filler char(84)
)
PARTITION BY RANGE (aid);

CREATE FUNCTION __create_partitions__(count INTEGER)
RETURNS VOID AS
$$
DECLARE
    i int;
    partition_size int := 100000 / count;
BEGIN
    FOR i IN SELECT generate_series(1, count)
    LOOP
        EXECUTE format('CREATE TABLE pgbench_accounts_%s PARTITION OF pgbench_accounts
                        FOR VALUES FROM (%s) TO (%s)',
                        i,
                        (i - 1) * partition_size + 1,
                        i * partition_size + 1);
    END LOOP;
END
$$
LANGUAGE plpgsql;

SELECT __create_partitions__(:pcount);
DROP FUNCTION __create_partitions__(INTEGER);

INSERT INTO pgbench_accounts (aid, bid, abalance) SELECT generate_series(1, 100000), 1, 0;
