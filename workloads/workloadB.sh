# Worload B - read heavy 
pgbench -f scripts/zipfian/read.sql@95 -f scripts/zipfian/update.sql@5 -D parameter=2
