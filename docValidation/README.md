# MongoDB Document Validation Tutorial

This tutorial will demonstrate how to use schema validation on MongoDB. Schema validation gives developers and DBAs the ability to enforce data rules for data quality purposes. So if we want a particular field to be mandatory, or we ant a field to have a certain data type or a certain size

Throughout this demo we are going to work on a collection containing customer data for a magazine publisher.

## Required fields

To keep our initial example extremely simple, initially we are going to create a customer collection and  requires the fields firstName and lastName.

Let's first create a schema that makes these two keys mandatory in any document that is inserted or updated in the collection.

```
let mySchema= {
bsonType: "object"
, required: ["firstName","lastName"]
}
```

Now let's create a collection that enforces the rules that we defined above, namely that both firstName and lastName are always required.

```
use testdb;
db.createCollection("customers", { validator:{ $jsonSchema: mySchema} })
```

We can now see the new collection created:

```
show collections;
```
db.