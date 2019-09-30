
use admin
dbadmin = db.getSiblingDB('admin')
dbadmin.auth('mongodba','data__123')

use testdb

dbtest = getSiblingDB("testdb")




session.startTransaction();

accounts_collection.insertOne({"_id": "Marcelo", "balance":2000})

session.commitTransaction();
session.abortTransaction();
session.endSession();

accounts.collecti
// Start a session.
dbtest = db.getSiblingDB("testdb");
session = dbtest.getMongo().startSession();

 employeesCollection = session.getDatabase("testdb").employees;



session = db.getMongo("replKey/localhost:27010,localhost:27011,localhost:27012").startSession( { mode: "primary" } );
session = db.getMongo("replKey/localhost:27010,localhost:27011,localhost:27012").startSession( { mode: "primary" } );
dbtest = db.getMongo("localhost:27017").startSession({ mode: "primary" }).getDatabase("testdb");


session = db.getMongo("localhost:27017").startSession( { mode: "primary" } );
dbtest = db.getMongo("localhost:27017").startSession({ mode: "primary" }).getDatabase("testdb");






client = pymongo.MongoClient("replKey/localhost:27010,localhost:27011,localhost:27012")
db = client.testdb

db.accounts.drop()
db.accounts.insert({ _id: "Giovanni" , balance: 200000 });
db.accounts.insert({ _id: "Marcelo"  , balance: 5000 });




s = client.start_session()
s.start_transaction()

try:
    db.inventory.update_one({"sku": "abc123"}, {"$inc": {"qty": -100}}, session=s)
    db.shipment.insert_one({"sku": "abc123", "qty": 100}, session=s)
except Exception:
    s.abort_transaction()
else:
    s.commit_transaction()
s.end_session()
