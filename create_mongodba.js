const c_dba = { "user" : "mongodba"
	          , "pwd" :"data__123"
	          , "roles": [
	                       { "role": "root" , "db" : "admin"}
	                     ]
	           };

db.createUser(c_dba);
