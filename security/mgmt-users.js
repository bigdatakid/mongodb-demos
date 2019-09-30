db = connect("localhost:27010/admin");

db.createUser({ "user" : "mongodba"
	          , "pwd" :"data2012"
	          , "roles": [
	                       { "role": "root" , "db" : "admin"}
	                     ]
	           });



db.createUser({ "user" : "products-user"
	          , "pwd" :"topsecret"
	          , "roles": [
	                       { "role": "readWrite"
	                         , "db" : "products"}
	                     ]
	           });



db = connect("localhost:27010/admin");

db.createUser({ "user" : "katie"
	          , "pwd" :"securityofficer"
	          , "roles": [
	                       { "role": "userAdminAnyDatabase" , "db" : "admin"}
	                     ]
	           });

db.auth("katie","securityofficer")

db.getRole("userAdminAnyDatabase", { showPrivileges: true })


db.auth("katie","securityofficer")



db.createUser({ "user" : "joe"
	          , "pwd" :"sysadmin"
	          , "roles": [
	                       { "role": "clusterManager" , "db" : "admin"}
	                     ]
	           });

db.createUser({ "user" : "tina"
	          , "pwd" :"dba"
	          , "roles": [
	                       { "role": "dbAdminAnyDatabase" , "db" : "admin"}
	                      ,{ "role": "userAdminAnyDatabase" , "db" : "admin"}
	                     ]
	           });

db.updateUser({  "tina"
	          , "roles": [
	                       { "role": "dbAdminAnyDatabase" , "db" : "admin"}
	                     ]
	           });

db.grantRolesToUser({  "tina"
	          , "roles": [
	                       { "role": "userAdminAnyDatabase" , "db" : "admin"}
	                     ]
	           });

var role={
	"role" : "example_role"
   ,"privileges" : [
		{
			"resource" : {
				"db" : "test",
				"collection" : "table1"
			},
			"actions" : [
				"find",
				"insert",
				"update",
				"remove"
			]
		}
	]
   ,"roles" : [
		{
			"role" : "read",
			"db" : "test"
		}
	]
}

db.createRole(role)
