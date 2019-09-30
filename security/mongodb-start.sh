echo "Starting mongods"
mongod --replSet A --logpath "/Users/marcelo/Documents/mongofiles/log/A27010.txt" --dbpath /Users/marcelo/Documents/mongofiles/shard/dataA27010 --port 27010 --fork --shardsvr    --pidfilepath "/Users/marcelo/Documents/mongofiles/log/A27010.pid" --directoryperdb
mongod --replSet A --logpath "/Users/marcelo/Documents/mongofiles/log/A27011.txt" --dbpath /Users/marcelo/Documents/mongofiles/shard/dataA27011 --port 27011 --fork --shardsvr    --pidfilepath "/Users/marcelo/Documents/mongofiles/log/A27011.pid" --directoryperdb
mongod --replSet A --logpath "/Users/marcelo/Documents/mongofiles/log/A27012.txt" --dbpath /Users/marcelo/Documents/mongofiles/shard/dataA27012 --port 27012 --fork --shardsvr    --pidfilepath "/Users/marcelo/Documents/mongofiles/log/A27012.pid" --directoryperdb


mongod --replSet B --logpath "/Users/marcelo/Documents/mongofiles/log/B27020.txt" --dbpath /Users/marcelo/Documents/mongofiles/shard/dataB27020 --port 27020 --fork --shardsvr    --pidfilepath "/Users/marcelo/Documents/mongofiles/log/B27020.pid" --directoryperdb
mongod --replSet B --logpath "/Users/marcelo/Documents/mongofiles/log/B27021.txt" --dbpath /Users/marcelo/Documents/mongofiles/shard/dataB27021 --port 27021 --fork --shardsvr    --pidfilepath "/Users/marcelo/Documents/mongofiles/log/B27021.pid" --directoryperdb
mongod --replSet B --logpath "/Users/marcelo/Documents/mongofiles/log/B27022.txt" --dbpath /Users/marcelo/Documents/mongofiles/shard/dataB27022 --port 27022 --fork --shardsvr    --pidfilepath "/Users/marcelo/Documents/mongofiles/log/B27022.pid" --directoryperdb



mongod --replSet C --logpath "/Users/marcelo/Documents/mongofiles/log/C27030.txt" --dbpath /Users/marcelo/Documents/mongofiles/shard/dataC27030 --port 27030 --fork --shardsvr    --pidfilepath "/Users/marcelo/Documents/mongofiles/log/C27030.pid" --directoryperdb
mongod --replSet C --logpath "/Users/marcelo/Documents/mongofiles/log/C27031.txt" --dbpath /Users/marcelo/Documents/mongofiles/shard/dataC27031 --port 27031 --fork --shardsvr    --pidfilepath "/Users/marcelo/Documents/mongofiles/log/C27031.pid" --directoryperdb
mongod --replSet C --logpath "/Users/marcelo/Documents/mongofiles/log/C27032.txt" --dbpath /Users/marcelo/Documents/mongofiles/shard/dataC27032 --port 27032 --fork --shardsvr    --pidfilepath "/Users/marcelo/Documents/mongofiles/log/C27032.pid" --directoryperdb


mongod --logpath "/Users/marcelo/Documents/mongofiles/log/log-cfg1-28041.txt" --dbpath /Users/marcelo/Documents/mongofiles/shard/data-cfg1-28041 --port 28041 --fork --configsvr --pidfilepath "/Users/marcelo/Documents/mongofiles/log/cfg1-28041.pid" --directoryperdb 
mongod --logpath "/Users/marcelo/Documents/mongofiles/log/log-cfg2-28042.txt" --dbpath /Users/marcelo/Documents/mongofiles/shard/data-cfg2-28042 --port 28042 --fork --configsvr --pidfilepath "/Users/marcelo/Documents/mongofiles/log/cfg2-28042.pid" --directoryperdb 
mongod --logpath "/Users/marcelo/Documents/mongofiles/log/log-cfg3-28043.txt" --dbpath /Users/marcelo/Documents/mongofiles/shard/data-cfg3-28043 --port 28043 --fork --configsvr --pidfilepath "/Users/marcelo/Documents/mongofiles/log/cfg3-28043.pid" --directoryperdb 


echo "Wait  20 secs for mongods to come online "
for x in {1..20}
do
   echo "Waiting " + ${x} 
	sleep 1
done

mongos --port 29010 --fork --logpath  "/Users/marcelo/Documents/mongofiles/log/logS-29010.txt" --configdb localhost:28041,localhost:28042,localhost:28043
