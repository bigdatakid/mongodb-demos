const {MongoClient} = require('mongodb');

const docArray= [ { "_id": 1, "pet": "cat", "age":2}
            ,{ "_id": 2, "pet": "dog", "age":4}
            ,{ "_id": 3, "pet": "iguana", "age":3}
            ,{ "_id": 4, "pet": "guinea pig", "age":3}
            ,{ "_id": 5, "pet": "snake", "age":12} ];

const dbName = "testDB";
const collectionName = "testColl";

async function main(){
    /**
     * Connection URI. Update <username>, <password>, and <your-cluster-url> to reflect your cluster.
     * See https://docs.mongodb.com/ecosystem/drivers/node/ for more details
     */

    const uri="mongodb+srv://mongodev:secret973@atlanta-workshop-7tmzl.mongodb.net/test?retryWrites=true&w=majority"
 

   
    const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });
 
    try {
        // Connect to the MongoDB cluster
        await client.connect();

        //insert a doc
        await createMdbDoc(client, dbName, collectionName, docArray[0]);

 
        // Make the appropriate DB calls
        await  listDatabases(client);
        
 
    } catch (e) {
        console.error(e);
    } finally {
        await client.close();
    }
}

main().catch(console.error);

async function listDatabases(client){
    databasesList = await client.db().admin().listDatabases();
 
    console.log("Databases:");
    databasesList.databases.forEach(db => console.log(` - ${db.name}`));
};

async function createMdbDoc(client, dbName, collectionName, mdbDoc){
    const result = await client.db(dbName).collection(collectionName).insertOne(mdbDoc);
    console.log(`New MongoDB document created with following id: ${result.insertedId}`);
}