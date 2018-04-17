echo "Clean Directories"
./cleandir.sh
echo "Starting mongod daemons"
mongod --replSet NotSecure --fork --dbpath /tmp/mongod/10/data/ --logpath /tmp/mongod/10/log/mongod10_log.txt --port 27010 
mongod --replSet NotSecure --fork --dbpath /tmp/mongod/11/data/ --logpath /tmp/mongod/11/log/mongod11_log.txt --port 27011
mongod --replSet NotSecure --fork --dbpath /tmp/mongod/12/data/ --logpath /tmp/mongod/12/log/mongod12_log.txt --port 27012 
echo "Before waiting 10 seconds"
sleep 10
echo "Start replSet"
mongo  localhost:27010/admin --shell ./config-rep.js
echo "Execution finished"