
kill `ps -ef | grep mongo  | head -3| awk '{print $2}'`
./key-replset-mongod.sh
mongo localhost:27010/admin ./create_mongodba.js
mongo localhost:27010/admin -u ${MONGO_USER} -p ${MONGO_PW}


// Change current database to testdb
use testdb
db = db.getSiblingDB('testdb')

db.accounts.drop();
db.transactions.drop();

// Insert both Giovanni and Marcelo's accounts
// Gio's balance is $200K
// Marcelo's balance is $5k

db.accounts.insert(
   [
     { _id: "Giovanni" , balance: 200000 }
    ,{ _id: "Marcelo"  , balance: 5000
 }
   ]
);


session = db.getMongo().startSession();

accounts_col = session.getDatabase("testdb").accounts;

session.startTransaction();


accounts_col.update(
   { _id: "Giovanni" },
   { $inc: { balance: -7000 } }
);



accounts_col.update(
   { _id: "Marcelo" },
   { $inc: { balance: 7000 } }
);


accounts_col.find().pretty();
db.accounts.find().pretty();

session.commitTransaction();
session.abortTransaction();
session.endSession();

####################################################
####################################################
####################################################
####################################################
