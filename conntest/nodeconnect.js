const MongoClient = require('mongodb').MongoClient;
const uri = "mongodb+srv://bbvadba:supereasy1234@m0free-vwzqz.mongodb.net/test?retryWrites=true&w=majority";
var assert = require('assert');


const client = new MongoClient(uri, { useNewUrlParser: true , useUnifiedTopology: true });
let result = {"count":0}
client.connect(err => {
  const collection = client.db("testDB").collection("testCollection");
  //collection.deleteMany({},);
  collection.deleteMany({}, function(err, r) {
    assert.equal(null, err, "connecting to the database failed");

    collection.insertMany([{a:1},{a:2}, {a:3}], 
      function(err, r) {
      assert.equal(null, err);
      assert.equal(3, r.insertedCount);
      result=collection.aggregate([
        { $group: {
             _id: null,
             total: { $sum: "$a" } 
                  }
        }
      ],
      function(err, cursor) {
        assert.equal(err, null);
  
        cursor.toArray(function(err, documents) {
          console.log(documents)
          assert.equal(6, documents[0].total, "Connection to the MongoDB Cluster has failed")
          console.log("Successfully connected to MongoDB, inserted and read records successfully");
          client.close();
          //callback(documents);
        });
      }
        );
      });

  });
  


  //client.close();
  });
