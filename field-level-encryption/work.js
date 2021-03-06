T
egpnadata01.alldata.com:27017

const docArray= [ { "_id": 1, "pet": "cat", "age":2}
            ,{ "_id": 2, "pet": "dog", "age":4}
            ,{ "_id": 3, "pet": "iguana", "age":3}
            ,{ "_id": 4, "pet": "guinea pig", "age":3}
            ,{ "_id": 5, "pet": "snake", "age":12} ];



async function main(){
    /**
     * Connection URI. Update <username>, <password>, and <your-cluster-url> to reflect your cluster.
     * See https://docs.mongodb.com/ecosystem/drivers/node/ for more details
     */

    let conn_string = process.env.MONGODB_CONNECTION_STRING;
  
    const client = new MongoClient(uri);
 
    try {
        // Connect to the MongoDB cluster
        await client.connect(conn_string);
 
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