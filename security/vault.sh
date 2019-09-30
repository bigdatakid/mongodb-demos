$ vault read database/creds/my-role
Key                Value
---                -----
lease_id           database/creds/my-role/f7db0f55-d67e-eee5-6170-742acb5e987a
lease_duration     1h
lease_renewable    true
password           A1a-9wsz8389rzws050u
username           v-root-my-role-q3xss0vs68z51t94y7sx-1524686973

MongoDB Enterprise > db.getUsers()
[
	{
		"_id" : "admin.mongodba",
		"user" : "mongodba",
		"db" : "admin",
		"roles" : [
			{
				"role" : "root",
				"db" : "admin"
			}
		]
	},
	{
		"_id" : "admin.v-root-my-role-q3xss0vs68z51t94y7sx-1524686973",
		"user" : "v-root-my-role-q3xss0vs68z51t94y7sx-1524686973",
		"db" : "admin",
		"roles" : [
			{
				"role" : "readWrite",
				"db" : "admin"
			},
			{
				"role" : "read",
				"db" : "foo"
			}
		]
	}
]

$ export VAULT_ADDR='http://127.0.0.1:8200'
$ vault secrets enable database
$ vault write database/config/my-mongodb-database     plugin_name=mongodb-database-plugin     allowed_roles="my-role"     connection_url="mongodb://{{username}}:{{password}}@localhost:27017/admin"     username="mongodba"     password="data2012"

$ vault write database/roles/my-role     db_name=my-mongodb-database     creation_statements='{ "db": "admin", "roles": [{ "role": "readWrite" }, {"role": "read", "db": "foo"}] }'     default_ttl="1h"     max_ttl="24h"

$ vault read database/creds/my-role
$ mongo localhost:27017/admin 

$ vault delete database/config/my-mongodb-database
Success! Data deleted (if it existed) at: database/config/my-mongodb-database


#####

$ sudo mkdir /var/lib/mongo/1/
$ sudo mkdir /var/lib/mongo/2/
$ sudo mkdir /var/lib/mongo/s/
$ sudo chmod 755 /var/lib/mongo/1/
$ sudo chmod 755 /var/lib/mongo/2/
$ sudo chmod 755 /var/lib/mongo/s/
$ sudo cp /etc/mongod.conf   /etc/mongod1.conf
$ sudo cp /etc/mongod.conf   /etc/mongod2.conf
$ sudo cp /etc/mongod.conf   /etc/mongos.conf
$ sudo mkdir /var/lib/mongo/cfg/
$ sudo chmod 755 /var/lib/mongo/cfg/

openssl rand -base64 756 > /var/lib/mongo/keyfile
chmod 400  /var/lib/mongo/keyfile

 daemon --user mongod --check mongod  mongod -f /etc/mongod1.conf 

 db.createUser({ "user" : "mongodba"
	          , "pwd" :"data2012"
	          , "roles": [
	                       { "role": "root" , "db" : "admin"}
	                     ]
	           });


 var config={ "_id" : "repl01"
  ,"members": [ { "_id":0, "host": "ip-172-31-15-0:27011", "priority":2 } ]
};

 var config={ "_id" : "repl02"
  ,"members": [ { "_id":0, "host": "ip-172-31-15-0:27012", "priority":2 } ]
};

 var config={ "_id" : "replCfg"
  ,"version": 2
  ,"members": [ { "_id":0, "host": "ip-172-31-15-0:27019", "priority":2 } ]
};

 rs.reconfig(config)

rs.initiate(config);

db.createUser({ "user" : "merkWrite"
	          , "pwd" :"data2012"
	          , "roles": [
	                       { "role": "readWrite" , "db" : "merk"}
	                     ]
	           });

db.createUser({ "user" : "tacoread"
	          , "pwd" :"data2012"
	          , "roles": [
	                       { "role": "read" , "db" : "taco"}
	                     ]
	           });

mongo localhost:27017/merk -u merkWrite -password "data2012"

vault write database/config/my-mongodb-database     plugin_name=mongodb-database-plugin     allowed_roles="my-role"     connection_url="mongodb://{{username}}:{{password}}@localhost:27017/merk"     username="merkWrite"     password="data2012"

MongoDB Enterprise mongos> db
admin
MongoDB Enterprise mongos> db.createUser({ "user" : "tacoread"
...           , "pwd" :"data2012"
...           , "roles": [
...                        { "role": "read" , "db" : "taco"}
...                      ]
...            });
Successfully added user: {
	"user" : "tacoread",
	"roles" : [
		{
			"role" : "read",
			"db" : "taco"
		}
	]
}


mongo localhost:27017/admin -u mongodba -password "data2012"


vault write database/config/my-mongodb-database     plugin_name=mongodb-database-plugin     allowed_roles="my-role"     connection_url="mongodb://{{username}}:{{password}}@localhost:27017/taco"     username="tacoread"     password="data2012"
