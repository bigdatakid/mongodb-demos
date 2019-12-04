const MongoClient = require('mongodb').MongoClient;
const uri = "mongodb+srv://bbvadba:supereasy1234@m0free-vwzqz.mongodb.net/test?retryWrites=true&w=majority";
const client = new MongoClient(uri, { useNewUrlParser: true });
client.connect(err => {
  const collection = client.db("test").collection("devices");
  // perform actions on the collection object
  console.log('connection accepted');
  client.close();
});
