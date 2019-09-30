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
     { _id: "Giovanni", balance: 200000
      , pendingTransactions: [] },
     { _id: "Marcelo"
      , balance: 5000
      , pendingTransactions: [] }
   ]
);

//Check balances
db.accounts.find().pretty();



// Insert transaction moving $7k from Gio to Marcelo


db.transactions.insert(
    { _id: "7k-from-Gio-to-Marcelo"
      , source: "Giovanni"
      , destination: "Marcelo"
      , value: 7000 , state: "initial"
      , lastModified: new Date() }
);

// Retrieve the document

var t = db.transactions.findOne( { state: "initial" } );

// Show transaction in the shell

t;

// Now, let's start processing the transaction

db.transactions.update(
    { _id: t._id, state: "initial" },
    {
      $set: { state: "pending" },
      $currentDate: { lastModified: true }
    }
)

// Removing the money from the source account
// Removing $7k from Giovanni's account

db.accounts.update(
   { _id: t.source, pendingTransactions: { $ne: t._id } },
   { $inc: { balance: -t.value }, $push: { pendingTransactions: t._id } }
);

// Adding  money from the destination account
// Adding $7k from Marcelo's account

db.accounts.update(
   { _id: t.destination, pendingTransactions: { $ne: t._id } },
   { $inc: { balance: t.value }, $push: { pendingTransactions: t._id } }
)

// Mark the trnasaction as pending
db.transactions.update(
   { _id: t._id, state: "pending" },
   {
     $set: { state: "applied" },
     $currentDate: { lastModified: true }
   }
)

// Remove the transaction pending flag from the
// source account
db.accounts.update(
   { _id: t.source, pendingTransactions: t._id },
   { $pull: { pendingTransactions: t._id } }
)

db.accounts.update(
   { _id: t.destination, pendingTransactions: t._id },
   { $pull: { pendingTransactions: t._id } }
)

// If both operations were successful
// Mark the transaction as done

db.transactions.update(
   { _id: t._id, state: "pending" },
   {
     $set: { state: "done" },
     $currentDate: { lastModified: true }
   }
)

QUERY to update the documents


// Check balances
db.accounts.find().pretty()

// Check transactions
db.transactions.find().pretty()
