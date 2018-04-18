db = connect("localhost:27010/admin");

db.createUser({ "user" : "products-user"
	          , "pwd" :"topsecret"
	          , "roles": [
	                       { "role": "readWrite"
	                         , "db" : "products"}
	                     ]
	           });

