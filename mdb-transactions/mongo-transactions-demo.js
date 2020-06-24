// Create collection in the TRANSACTIONS database with 2 Players 
use transactions_rocha_db;

// Set collName to OS username. collName will be used to reference collection name throughout this proof.
var collName = "staff";
print('Using DB.Collection: ' + db + '.' + collName);

// Drop collection if it exists
db[collName].drop();
db[collName].insert({"name": "James", "class": "blue", "earnings": 100, "expenses": 10 });
db[collName].insert({"name": "Alice", "class": "red", "earnings": 100, "expenses": 10});
db[collName].createIndex( { "name": 1 }, { unique: true } );


////////// SESSION ISOLATION

// Create two sessions, s1 and s2 and start a transaction with s1
var s1 = db.getMongo().startSession();
var s2 = db.getMongo().startSession();
var s1Player = s1.getDatabase('transactions_rocha_db').getCollection(collName);
var s2Player = s2.getDatabase('transactions_rocha_db').getCollection(collName);
s1.startTransaction({readConcern: {level: 'snapshot'}, writeConcern: {w: 'majority'}});

// Insert player 3, inside a transaction/session1
s1Player.insert({"name": "Bob", "class": "blue", "earnings": 100, "expenses": 10});

// Use session 2 and find the documents from collection and session1
s2Player.find();

// Notice that the insert on session1 is only visible to it.
s1Player.find()
s1.commitTransaction();

// show the documents after committing the transaction
s2Player.find();




//////////// MULTIPLE UPDATES


s1Player.find();
s2Player.find();


s1.startTransaction({readConcern: {level: 'snapshot'}, writeConcern: {w: 'majority'}});
s1Player.updateOne({"name": "James"}, {"$inc": {"earnings": 2, "expenses": -1} });
s1Player.updateOne({"name": "Bob"}, {"$inc": {"earnings": -2, "expenses": 1} });

s1Player.find();
s2Player.find();

s1.commitTransaction();

s1Player.find();
s2Player.find();

///////////

/////////ROLLBACK  

// Start a transaction with Zoltar refers a friend and gets 10 gold for the account creation
s1.startTransaction({readConcern: {level: 'snapshot'}, writeConcern: {w: 'majority'}});

s1Player.find({"name": "James"});
// EXPECTED RESULT:
// {"name": "James", "class": "blue", "earnings": 102, "expenses": 9 }

s1Player.updateOne({"name": "James"}, {"$inc": {"earnings": 10} });

s1Player.find({"name": "James"});
// EXPECTED RESULT:
// {"name": "James", "class": "blue", "earnings": 112, "expenses": 9 }

s1Player.insert({"name": "Bob", "class": "yellow", "earnings": 100, "expenses": 10 });
// EXPECTED RESULT:
// WriteCommandError({


s1.abortTransaction();

s1Player.find({"name": "James"});
// EXPECTED RESULT:


////////

// EXPECTED RESULT:
// {"name": "James", "class": "blue", "earnings": 100, "expenses": 10 }
// {"name": "Gilgamesh, "class": "red", "earnings": 100, "expenses": 10}
// {"name": "Bob", "class": "blue", "earnings": 100, "expenses": 10}"}