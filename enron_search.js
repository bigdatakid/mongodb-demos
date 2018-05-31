use enron_db

db = db.getSiblingDB("enron_db");

db.messages.createIndex({
     "body": "text"
    ,"headers.Subject": "text"
    ,"headers.To": "text"
    ,"headers.From": "text"
    ,"headers.Cc": "text"
    ,"headers.Bcc": "text"
  })


 db.messages.find( { $text: { $search: "dad" } },{"_id":0 ,"headers.From":1, "headers.Subject" :1 , "body":1 } ).pretty()

 db.messages.find( { $text: { $search: "dad" } },{"headers.From":1, "headers.To":1 , "headers.Subject" :1  } ).pretty()

 db.messages.find( { $text: { $search: "dad" } }, { score: { $meta: "textScore" } ,"headers.From":1, "headers.Subject" :1 } ).sort( { score: { $meta: "textScore" } } )

 db.messages.find( { $text: { $search: "dad" } }, { score: { $meta: "textScore" } } ).sort( { score: { $meta: "textScore" } } )
