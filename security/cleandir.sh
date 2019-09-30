rm -Rf /tmp/mongod
for i in 00 10 11 12 20 21 22 30 31 32 cfg1 cfg2 cfg3 mongos ; do mkdir -p /tmp/mongod/$i/data ; mkdir -p /tmp/mongod/$i/log ; done
