#Connect to DB
use retail_db
db = db.getSiblingDB("retail_db");

#Insert documents
 db.stores.insert(
   [
      { _id: 1, name: "Java Hut", description: "Coffee and cakes" }
     ,{ _id: 2, name: "Burger Buns", description: "Gourmet hamburgers"  }
     ,{ _id: 3, name: "Coffee Shop", description: "Just coffee" }
     ,{ _id: 4, name: "Clothes Clothes Clothes", description: "Discount clothing" }
     ,{ _id: 5, name: "Java Shopping", description: "Indonesian goods" }
     ,{ _id: 6, name: "Pizza Shop", description: "You get a restaurant" }
     ,{ _id: 7, name: "Java", description: "Great programming language" }
     ,{ _id: 8, name: "Black drink", description: "Coffee negative -shop" }
   ]
)
#Wrong Solution
db.stores.find( { "name": "Java coffee shop" } )

#Solution with $regex
db.stores.find( { "name": { $regex: /java|coffee|shop/ ,  $options: 'i' } } )
db.stores.find({ "$or": [{ "name": { $regex: /java|Coffee|Shop/ ,  $options: 'i' } }
                        ,{ "description": { $regex: /java|Coffee|Shop/ ,  $options: 'i' } }
                        ]
              } )

Problem with approaches above
==> Regular expressions are inneficient
==> No stemming, stop words or ranking
==> Regular expressions are inneficient
==> No weighted Search


#Create a Search Index on name and description
db.stores.createIndex( { name: "text", description: "text" } )

#Search for documents that have either java, coffee or shop
db.stores.find( { $text: { $search: "java coffee shop" } } )

#PHRASE SEARCH -- Search for documents that contain Java and the phrase "coffee shop"
db.stores.find( { $text: { $search: "java \"coffee shop\"" } } )

#Term exclusion -- Search for documents that contain Java and the phrase "coffee shop"
db.stores.find( { $text: { $search: "java shop -coffee" } } )



## Ranking and sorting
db.stores.find(
   { $text: { $search: "java coffee shop" } },
   { score: { $meta: "textScore" } }
).sort( { score: { $meta: "textScore" } } )
db.stores.find( { "name": { $regex: /java/ } } )

## How to future-proof a search Index
## Wildcard INDEXING

 db.stores.insert(
  { _id: 9, name: "Breakfast", description: "Drink wakes you up" , "category": "not coffee"  }
                 )

## DROP INDEX
db.stores.dropIndex( { name: "text", description: "text" } )

## WILDCARD INDEXING
db.stores.createIndex( { "$**": "text", description: "text" } )

## Same search with Wildcard INDEX
## ALL Fields: Search for documents that have either java, coffee or shop
db.stores.find( { $text: { $search: "java coffee shop" } } )
