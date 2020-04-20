const base64 = require('uuid-base64');
const {MongoClient} = require('mongodb');
const {ClientEncryption} = require("mongodb-client-encryption");
const fs = require('fs');
const path = './sec/master-key.txt';


const connectionString = process.env.MONGODB_CONNECTION_STRING;
console.log(connectionString);

const keyVaultNamespace = 'encryption.__keyVault';
const client = new MongoClient(connectionString, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});



async function main() {
  try {
    const localMasterKey = await fs.readFileSync(path);
    const kmsProviders = {
        local: {
          key: localMasterKey
        }
      };
    await client.connect();
    const encryption = new ClientEncryption(client, {
      keyVaultNamespace,
      kmsProviders,
    });
    for (i = 0; i < 10; i++) {
        const key = await encryption.createDataKey('local');
        const base64DataKeyId = key.toString('base64');
        const uuidDataKeyId = base64.decode(base64DataKeyId);
        console.log('DataKeyId [UUID]: ', uuidDataKeyId);
        console.log('DataKeyId [base64]: ', base64DataKeyId);
      }

  } finally {
    await client.close();
  }
}
main();