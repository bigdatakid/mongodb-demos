const MongoClient=require('mongodb').MongoClient

const url = 'mongodb://mongodba:data2012@localhost:27010,localhost:27011,localhost:27012/admin?replicaSet=replKey';

MongoClient.connect(url, function(err,client){ 
	if (err) 
	{
		console.error(err); 
	    console.log('trouble');
	}
	else 
	{	
	    console.log('successful connect'); 
		client.close();
	}
});
