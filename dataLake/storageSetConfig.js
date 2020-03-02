use admin;
db.runCommand( { "storageSetConfig": {
  "stores": [{
    "s3": {
      "name": "s3store",           // Creates an S3 store

      "region":"us-east-1",  // Update with the bucket region code

      "bucket": "data-lake-mdb-demo"    // Update with your bucket name

    }
  }],
  "databases": {
    "testdb": {                    // Creates a database named sample
      "*": [{                      /* Works with the defintion to create a
                                      collection the data in each directory */
        "store": "s3store",        // Links to the S3 store above
        "definition": "/json/{collectionName()}"
      }]
    }
  }
}});