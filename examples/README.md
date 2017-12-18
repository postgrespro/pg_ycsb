# Examples

## Partitioning vs single table

In this directory you can find `init_partition.sql` script which would create a partitioned version of `pgbench_accounts` table. To run it you'll need to specify partitions count (`pcount` variable) and scale (1 is default `pgbench` scale) like following:

```
psql <dbname> -f init_partition.sql -v pcount=10 -v scale=1
```

Now let's perform workload C (100% read). The following command will run script for 60 seconds and utilize 10 connections:

```
pgbench <dbname> ../scripts/zipfian/read.sql -T60 -c10
```
