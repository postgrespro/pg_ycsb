[WIP]

# pg_ycsb

pg_ycsb implements basic YCSB-like workloads designed specifically to be run with pgbench.

## What is YCSB

[YCSB](https://github.com/brianfrankcooper/YCSB) is a framework and common set of workloads for performance evaluating of different kinds of database systems.

## Workloads

* **workload A**
   Update heavy workload. Example: session store recording recent actions.
   50% reads, 50% updates

* **workload B**
   Read mostly workload. Example: photo tagging; add a tag is an update, but most operations are to read tags.
   95% reads, 5% updates

* **workload C**
   Read only. Example: user profile cache, where profiles are constructed elsewhere.
   100% reads

* **workload D**
   Read latest workload. Example: user status updates; people want to read the latest.
   95% reads, 5% inserts (WIP)

* **workload E**
   Short ranges. Example: threaded conversations, where each scan is for the posts in a given thread.
   95% scans, 5% inserts (WIP)

* **workload F**
   Read-modify-write workload. Example: user database, where user records are read and modified by the user or to record user activity.
   50% reads, 50% inserts (WIP)

## Why use pgbench?

pgbench is a lightweight and flexible framework and usually goes with PostgreSQL. By default it performs TPC-B like benchmarks and widely used across developers. But in some cases default scripts fail to provide comprehensive measurements. pg_ycsb is a set of scripts which enables developers to run YCSB-like workloads with pgbench and using pgbench's default table set.

## Using

Full documentation on pgbench can be found in [official documentation](https://www.postgresql.org/docs/current/static/pgbench.html). The most important options are:

`-f filename@weight`
Add script to the list of executed scripts and `weight` represents probability of the execution of this script.

`-T seconds`
Total time of execution.

`-c clients`
Number of concurrent clients.

**Workload A:**
```
pgbench postgres -f scripts/zipfian/read.sql@50 -f scripts/zipfian/update.sql@50 -T60 -c10
```

**Workload B:**
```
pgbench postgres -f scripts/zipfian/read.sql@95 -f scripts/zipfian/update.sql@5 -T60 -c10
```

**Workload C:**
```
pgbench postgres -f scripts/zipfian/read.sql -T60 -c10
```

**Workload D:**

Not implemented yet.

**Workload E:**

Not implemented yet.

**Workload F:**

Not implemented yet.
