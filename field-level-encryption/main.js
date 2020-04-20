const {MongoClient} = require('mongodb');
const {ClientEncryption} = require("mongodb-client-encryption");
const fs = require('fs');
const path = './sec/master-key.txt';


const docArray= [ { "custom_id": 1, "pet": "cat", "age":2}
            ,{ "custom_id": 2, "pet": "dog", "age":4}
            ,{ "custom_id": 3, "pet": "iguana", "age":3}
            ,{ "custom_id": 4, "pet": "guinea pig", "age":3}
            ,{ "custom_id": 5, "pet": "snake", "age":12} ];




const extraOptions = {
        mongocryptdSpawnPath: '/usr/local/bin/mongocryptd',
        mongocryptdBypassSpawn: true,
        mongocryptdSpawnArgs: ["--port", "30000"],
         mongocryptdURI: 'mongodb://localhost:30000',
         mongocryptdSpawnArgs: ["--idleShutdownTimeoutSecs", "75"]
      }

const jsonSchema= {
    "bsonType": "object",
    "encryptMetadata": {
        "keyId": [
        {
            "$binary": {
            "base64": "OePCTpUhQ0mmYtakcAqzkQ==",
            "subType": "04"
            }
        }
        ]
    },
    "properties": {
        "pet": {
        "bsonType": "object",
        "properties": {
            "policyNumber": {
            "encrypt": {
                "bsonType": "int",
                "algorithm": "AEAD_AES_256_CBC_HMAC_SHA_512-Deterministic"
            }
            }
        }
        }
    }
    };
    
const petSchema = {
    'testDB.petsColl': jsonSchema
    };



const dbName = "testDB";
const collectionName = "petsColl";

async function main(){
    /**
     * Connection URI. Update <username>, <password>, and <your-cluster-url> to reflect your cluster.
     * See https://docs.mongodb.com/ecosystem/drivers/node/ for more details
     */

    const connectionString = process.env.MONGODB_CONNECTION_STRING;
    console.log(connectionString);

   



    const base64 = require('uuid-base64');


    
    //const uri="mongodb+srv://mongodev:secret973@atlanta-workshop-7tmzl.mongodb.net/test?retryWrites=true&w=majority"

   
    const client = new MongoClient(connectionString, { useNewUrlParser: true, useUnifiedTopology: true });
 
    try {
        const localMasterKey = await fs.readFileSync(path);
        const kmsProviders = {
            local: {
              key: localMasterKey
                  }
            };

            const keyVaultNamespace = 'encryption.__keyVault';

            const autoEncryption= {
                keyVaultNamespace,
                kmsProviders,
                schemaMap: petSchema,
                extraOptions: extraOptions
              }
         
            const secureClient = new MongoClient(connectionString, {
             useNewUrlParser: true,
             useUnifiedTopology: true,
             monitorCommands: true,
             autoEncryption: {
               keyVaultNamespace,
               kmsProviders,
               schemaMap: petSchema,
               extraOptions: extraOptions,
             }
                });
         
        // Connect to the MongoDB cluster
        await client.connect();

        await secureClient.connect();

        //insert a doc
        await createMdbDoc(secureClient, dbName, collectionName, docArray[0]);

        await createMdbDoc(client, dbName, "petsOpen", docArray[0]);

 
        // Make the appropriate DB calls
        await  listDatabases(client);
        await  listDatabases(secureClient);
        
 
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