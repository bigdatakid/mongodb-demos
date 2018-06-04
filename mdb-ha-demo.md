# MongoDB High Availability Micro Demo
## Description

This MongoDB micro-demo is intentended to showcase MongoDB high availability features.

Here is the sequence of steps:

1. Remove existing mongod replica sets from memory
2. A 3-node MongoDB replicaset is started, with authentication enabled.
2. Replication is configured.
3. A mongodba user is created in the admin database
4. A total of 5 terminal windows need to be open
5. Window #1. -- Load generator
6. Windows #2, #3, and #4 run the looper to show the statusof each replica set
7. After running for a little while kill the primary
8. Restart the "dead" server
9. Highlight the application keeps running


## Commands

```bash
$   kill `ps -ef | grep mongo  | head -3| awk '{print $2}'`
$  ./key-replset-mongod.sh
$  mongo localhost:27010/admin create_mongodba.js
$  mongo localhost:27010/admin -u ${MONGO_USER} -p ${MONGO_PW} ./repstatus_looper.js
$  mongo localhost:27011/admin -u ${MONGO_USER} -p ${MONGO_PW} ./repstatus_looper.js
$  mongo localhost:27012/admin -u ${MONGO_USER} -p ${MONGO_PW} ./repstatus_looper.js
$  ./insert_data.py
$  kill `ps -ef | grep mongo | grep 27010 | awk '{print $2}'`
$  mongod --auth --keyFile ./mongodb-key-file  --replSet replKey --fork --dbpath /tmp/mongod/10/data/ --logpath /tmp/mongod/10/log/mongod10_log.txt --port 27010
$ kill `ps -ef | grep mongo  | head -3| awk '{print $2}'`
```
## Files
 * ha-mdb.sh
 * key-replset-mongod.sh
 * key-rep.js
 * create_mongodb.js
 * insert_data.py
