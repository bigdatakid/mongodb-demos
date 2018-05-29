
#      kill `ps -ef | grep mongo  | head -3| awk '{print $2}'`
#     ./key-replset-mongod.sh
#     mongo localhost:27010/admin create_mongodba.js
#     mongo localhost:27010/admin -u ${MONGO_USER} -p ${MONGO_PW} ./repstatus_looper.js
#     mongo localhost:27011/admin -u ${MONGO_USER} -p ${MONGO_PW} ./repstatus_looper.js
#     mongo localhost:27012/admin -u ${MONGO_USER} -p ${MONGO_PW} ./repstatus_looper.js
#     ./insert_data.py
#     kill `ps -ef | grep mongo | grep 27010 | awk '{print $2}'`
#     mongod --auth --keyFile ./mongodb-key-file  --replSet replKey --fork --dbpath /tmp/mongod/10/data/ --logpath /tmp/mongod/10/log/mongod10_log.txt --port 27010
#     kill `ps -ef | grep mongo  | head -3| awk '{print $2}'`