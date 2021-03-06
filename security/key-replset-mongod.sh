echo "Clean Directories"
./cleandir.sh
echo "Starting mongod daemons"

## openssl rand -base64 755 > ./mongodb-key-file
## chmod 400 ./mongodb-key-file

mongod --auth --keyFile ./mongodb-key-file  --replSet replKey --fork \
    --dbpath /tmp/mongod/10/data/ --logpath /tmp/mongod/10/log/mongod10_log.txt --port 27010
mongod --auth  --keyFile ./mongodb-key-file  --replSet replKey --fork \
   --dbpath /tmp/mongod/11/data/ --logpath /tmp/mongod/11/log/mongod11_log.txt --port 27011
mongod --auth  --keyFile ./mongodb-key-file  --replSet replKey --fork \
  --dbpath /tmp/mongod/12/data/ --logpath /tmp/mongod/12/log/mongod12_log.txt --port 27012

  
echo "Before waiting 10 seconds"
sleep 10
echo "Start replSet"
mongo  localhost:27010/admin  ./key-rep.js
echo "Execution finished"
