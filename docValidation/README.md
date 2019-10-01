# MongoDB Document Validation Tutorial
# How to enforce data types and mandatory fields on your MongoDB Data

This tutorial will demonstrate how to use schema validation on MongoDB. Schema validation gives developers and DBAs the ability to enforce data rules for data quality purposes. So if we want a particular field to be mandatory, or we ant a field to have a certain data type or a certain size. 

The types of rules that can be enforced by MongoDB can be very sophisticated, and it provides greater level of control to DBAs and data architects, when compared to current capabilities of legacy RDBMS(s).

Throughout this demo we are going to work on a collection containing customer data for a magazine publisher.

## Required Prerequisites
To successfully complete this tutorial, the following software should be installed:

* Access to a MongoDB instance.  You can either download [MongoDB](https://www.mongodb.com/download-center/enterprise)
and set it up on a workstation/server.  Or, the *recommended* way to complete the workshop, is by using [MongoDB
Atlas](https://www.mongodb.com/cloud/atlas), the fully managed service from MongoDB.  To access, simply create an account
at [https://cloud.mongodb.com](https://cloud.mongodb.com) or login to an existing account you may have previously
created.

* [MongoDB Compass](https://www.mongodb.com/download-center/compass) -- Version 1.19 or above- Download links below- This is a GUI to MongoDB that will be used to 
write queries.

* [MongoDB mongo shell](https://www.mongodb.com/download-center/enterprise) -- Version 4.2 or above
*

## Demo - 01 - Required fields

To keep our initial example extremely simple, initially we are going to create a customer collection and  requires the fields firstName and lastName.

Let's first create a schema that makes these two keys mandatory in any document that is inserted or updated in the collection.

```
let mySchema= {
  $jsonSchema: {
    required: [ 'firstName', 'lastName']
               }
};

```

Now let's create a collection that enforces the rules that we defined above, namely that both firstName and lastName are always required.

```
use testdb;
db.createCollection("customers", { validator: mySchema });
```

We can now see the new collection created:

```
show collections;
```
The next image shows creating the schema and creating a new collection with the above referred schema.

![](images/docValidation-terminal-image-01.png)

You could do the same thing with MongoDB Compass. The next image shows the initial screen of MongoDB Compass as we connect to a free tier MongoDB instance hosted on MongoDB Atlas. The arrows call attention to the authentication method, authentication database, and the button to add this cluster as a "favorite" inside of the Compass app.

XXXXX-Hello-XXXXX
![](images/docValidation-compass-image-01.jpg)

XXXXX-Hello-XXXXX
![](images/docValidation-compass-image-02.jpg)

XXXXX-Hello-XXXXX
![](images/docValidation-compass-image-03.jpg)

XXXXX-Hello-XXXXX
![](images/docValidation-compass-image-04.jpg)

XXXXX-Hello-XXXXX
![](images/docValidation-compass-image-05.jpg)

XXXXX-Hello-XXXXX
![](images/docValidation-compass-image-06.jpg)
XXXXX-Hello-XXXXX

![](images/docValidation-compass-image-07.jpg)

XXXXX-Hello-XXXXX
![](images/docValidation-compass-image-08.jpg)

XXXXX-Hello-XXXXX
![](images/docValidation-compass-image-09.jpg)

XXXXX-Hello-XXXXX
![](images/docValidation-compass-image-10.jpg)




db.getCollectionInfos()


```
let mySchema02= {
    bsonType: "object"
    ,required: ["firstName","lastName"]
    ,properties : {
    	firstName: {bsonType: "string"}
    }
};

use testdb;
db.runCommand( { collMod: customers, validator:{ $jsonSchema: mySchema02 } } )


```