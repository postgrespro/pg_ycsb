# Worload A—Update heavy
pgbench -f scripts/zipfian/read.sql@50 -f scripts/zipfian/update.sql@50 -D parameter=2
